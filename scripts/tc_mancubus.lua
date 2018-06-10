local base = piece 'base' 
local body = piece 'body' 
local larm = piece 'larm' 
local lgun = piece 'lgun' 
local rarm = piece 'rarm' 
local rgun = piece 'rgun' 
local spads = piece 'spads' 
local lemit = piece 'lemit' 
local remit = piece 'remit' 
local head = piece 'head' 
local emit_summon = piece 'emit_summon' 
local emit_groundflash_r = piece 'emit_groundflash_r' 
local emit_groundflash_l = piece 'emit_groundflash_l' 

local MOVEANIMATIONSLEEPTIME = 100
local MOVEANIMATIONSPEED = 5
local moving = false
local attacking = false

local SUMMONING = 1024+0
local BLOOD = 1025+0
local FLARE = 1026+0


local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 1

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end


local function SetMoveAnimationSpeed()
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1000)
	MOVEANIMATIONSLEEPTIME = (20000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

-- Move Animation -------------------------
local function Walkscript()
	SetSignalMask(SIG_WALK)
	while  true  do
		if  moving  then
			SetMoveAnimationSpeed()
			Turn2( body , y_axis, 5, MOVEANIMATIONSPEED/10 )
			Turn2( body , z_axis, -5, MOVEANIMATIONSPEED/10 )
			if not attacking then	
				Turn2( rarm, x_axis, 12, MOVEANIMATIONSPEED/3 )
			end
			WaitForTurn(body, y_axis)
			Turn2( body , y_axis, 0, MOVEANIMATIONSPEED/10 )
			Turn2( body , z_axis, 0, MOVEANIMATIONSPEED/10 )
			if not attacking then	
				Turn2( larm, x_axis, 0, MOVEANIMATIONSPEED/3 )
			end			
			WaitForTurn(body, y_axis)		
		end
		if  moving  then
			Turn2( body , y_axis, -5, MOVEANIMATIONSPEED/10 )
			Turn2( body , z_axis, 5, MOVEANIMATIONSPEED/10 )
			if not attacking then	
				Turn2( rarm, x_axis, 0, MOVEANIMATIONSPEED/3 )
			end					
			WaitForTurn(body, y_axis)
			Turn2( body , y_axis, 0, MOVEANIMATIONSPEED/10 )
			Turn2( body , z_axis, 0, MOVEANIMATIONSPEED/10 )
			if not attacking then	
				Turn2( larm, x_axis, 10, MOVEANIMATIONSPEED/3 )
			end					
			WaitForTurn(body, y_axis)		
		end
		if  not moving  then
			Turn2( body , z_axis, 0, MOVEANIMATIONSPEED )		
		end
		Sleep(100)		
	end 
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if (not attacking) and (not moving) then		
			local borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( larm, x_axis, -20, MOVEANIMATIONSPEED/5 )
				Turn2( body, y_axis, 20, MOVEANIMATIONSPEED/5 )
				Turn2( head, y_axis, 40, MOVEANIMATIONSPEED/4 )				
				WaitForTurn( body, y_axis )
			elseif (borednumber < 5)then
				Turn2( rarm, x_axis, -20, MOVEANIMATIONSPEED/5 )
				Turn2( body, y_axis, -20, MOVEANIMATIONSPEED/5 )
				Turn2( head, y_axis, -40, MOVEANIMATIONSPEED/4 )						
				WaitForTurn( body, y_axis )
			else 
				Turn2( rarm, x_axis, 18, MOVEANIMATIONSPEED/7 )
				Turn2( larm, x_axis, 14, MOVEANIMATIONSPEED/7 )
				Turn2( body, y_axis, 0, MOVEANIMATIONSPEED/5 )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED/5 )	
			end
		end
	Sleep(1500)		
	end
end
-------------------------------------------

function script.Create()
	moving = false
	attacking = false	
	Turn( lgun , z_axis, math.rad(25.000000) )
	Turn( rgun , z_axis, math.rad(-25.000000) )
	Turn( emit_summon , x_axis, math.rad(-90.000000) )	
	SetMoveAnimationSpeed()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
		EmitSfx( emit_summon,  SUMMONING )
		Sleep( 300)
	end
	StartThread(Walkscript)
	StartThread( BoredAnimation )	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
	moving = false
end

local function RestoreAfterDelay()
	Sleep(1000)
	attacking = false	
	Turn( lgun , x_axis, 0, math.rad(200.000000) )
	Turn( rgun , x_axis, 0, math.rad(200.000000) )
	Turn( larm , y_axis, 0, math.rad(100.000000) )
	Turn( rarm , y_axis, 0, math.rad(100.000000) )
	Turn( head , y_axis, 0, math.rad(150.000000) )
end

function script.QueryWeapon1(piecenum)
	return  remit
end

function script.AimFromWeapon1(piecenum)
	return  rgun
end

function script.AimWeapon1(heading, pitch)
	Signal( SIG_AIM1 )
	SetSignalMask( SIG_AIM1 )
	attacking = true

	Turn2( rarm, x_axis, 0, 100 )	
	Turn( rarm, y_axis, heading, 1 )
	Turn( rgun, x_axis, -pitch, 1 )	

	Turn( head, y_axis, heading, 1 )
	
	WaitForTurn(rarm, y_axis)
	WaitForTurn(rgun, x_axis)
	StartThread(RestoreAfterDelay)
	return (1)
end

function script.FireWeapon1()
	EmitSfx( emit_groundflash_r,  FLARE )
	Sleep( 200)
end

function script.QueryWeapon2(piecenum)
	return  lemit
end

function script.AimFromWeapon2(piecenum)
	return  lgun
end

function script.AimWeapon2(heading, pitch)
	Signal( SIG_AIM2 )
	SetSignalMask( SIG_AIM2 )
	attacking = true

	Turn2( larm, x_axis, 0, 100 )		
	Turn( larm, y_axis, heading, 1 )
	Turn( lgun, x_axis, -pitch, 1 )	

	WaitForTurn(larm, y_axis)
	WaitForTurn(lgun, x_axis)
	StartThread(RestoreAfterDelay)
	return (1)
end

function script.FireWeapon1()
	EmitSfx( emit_groundflash_l,  FLARE )
	Sleep( 200)
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end	

function script.Killed( damage, health )
	EmitSfx( body,  BLOOD )
	EmitSfx( head,  BLOOD )
	return 1		
end
