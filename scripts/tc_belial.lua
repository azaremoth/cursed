local base = piece 'base' 
local pelvis = piece 'pelvis' 
local chest = piece 'chest' 
local head = piece 'head' 
local luparm = piece 'luparm' 
local gun = piece 'gun' 
local barrel = piece 'barrel' 
local ruparm = piece 'ruparm' 
local rocketgun = piece 'rocketgun' 
local lleg1 = piece 'lleg1' 
local lleg2 = piece 'lleg2' 
local lleg3 = piece 'lleg3' 
local rleg1 = piece 'rleg1' 
local rleg2 = piece 'rleg2' 
local rleg3 = piece 'rleg3' 
local lemit = piece 'lemit' 
local remit = piece 'remit' 
local emit_summon = piece 'emit_summon' 
local emit_rleg = piece 'emit_rleg' 
local emit_lleg = piece 'emit_lleg' 
local emit_groundflash_r = piece 'emit_groundflash_r' 
local emit_groundflash_l = piece 'emit_groundflash_l' 

local moving = false
local attacking = false
local MOVEANIMATIONSPEED

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 1

local SUMMONING = 1024+0
local FOOTDUST = 1025+0
local BLOOD = 1026+0
local BIGGUNFLARE = 1027+0
local SMALLGUNFLARE = 1028+0
local GROUNDFLASH = 1029+0

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/180000) --200000
	if MOVEANIMATIONSPEED < 0.05 then 
		MOVEANIMATIONSPEED = 0.05
	end
	MOVEANIMATIONSLEEPTIME = 80/MOVEANIMATIONSPEED --100
end

-- Walk Motion
local function Walkscript()
	while true do
		if moving then 
--			SetSignalMask(SIG_WALK)	
			SetMoveAnimationSpeed()
			Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*55 )
			Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*60 )			
			if not attacking then
				Turn2( luparm , x_axis, 25, MOVEANIMATIONSPEED*75 )
				Turn2( ruparm , x_axis, -35, MOVEANIMATIONSPEED*75 )				
			end
			EmitSfx( emit_lleg,  FOOTDUST )
			Move( pelvis, y_axis, 3, MOVEANIMATIONSPEED*25 )			
			Turn2( lleg1, x_axis, 10.5, MOVEANIMATIONSPEED*79.91 )
			Turn2( lleg2, x_axis, -10.8, MOVEANIMATIONSPEED*67.38 )
			Turn2( lleg3, x_axis, 0.5, MOVEANIMATIONSPEED*147.29 )
			Turn2( rleg1, x_axis, -26.7, MOVEANIMATIONSPEED*221.14 )
			Turn2( rleg2, x_axis, 1.9, MOVEANIMATIONSPEED*148.02 )
			Turn2( rleg3, x_axis, 25.5, MOVEANIMATIONSPEED*73.13 )
			Sleep(MOVEANIMATIONSLEEPTIME*4.65)
		end
		if moving then
			if not attacking then
				Turn2( chest , z_axis, 3, MOVEANIMATIONSPEED*15 )
				Turn2( head , z_axis, -5, MOVEANIMATIONSPEED*22 )
			end
			Move( pelvis, y_axis, 0, MOVEANIMATIONSPEED*10 )			
			Turn2( lleg1, x_axis, 62.3, MOVEANIMATIONSPEED*172.62 )
			Turn2( lleg2, x_axis, -44.4, MOVEANIMATIONSPEED*112.17 )
			Turn2( lleg3, x_axis, -17.6, MOVEANIMATIONSPEED*60.44 )
			Turn2( rleg2, x_axis, -40.3, MOVEANIMATIONSPEED*140.58 )
			Turn2( rleg3, x_axis, 67.6, MOVEANIMATIONSPEED*140.28 )
			Sleep(MOVEANIMATIONSLEEPTIME*2.99)
		end
		if moving then
			if not attacking then
				Turn2( luparm , x_axis, -35, MOVEANIMATIONSPEED*75 )
				Turn2( ruparm , x_axis, 25, MOVEANIMATIONSPEED*75 )
			end
			EmitSfx( emit_rleg,  FOOTDUST )
			Move( pelvis, y_axis, 3, MOVEANIMATIONSPEED*25 )			
			Turn2( lleg1, x_axis, -32.7, MOVEANIMATIONSPEED*178.24 )
			Turn2( lleg2, x_axis, 7.7, MOVEANIMATIONSPEED*97.77 )
			Turn2( lleg3, x_axis, 25.3, MOVEANIMATIONSPEED*80.47 )
			Turn2( rleg1, x_axis, 20.8, MOVEANIMATIONSPEED*88.75 )
			Turn2( rleg2, x_axis, -16.8, MOVEANIMATIONSPEED*44.08 )
			Turn2( rleg3, x_axis, -3.3, MOVEANIMATIONSPEED*132.83 )
			Sleep(MOVEANIMATIONSLEEPTIME*5.32)
		end
		if moving then
			if not attacking then
				Turn2( chest , z_axis, -3, MOVEANIMATIONSPEED*15 )
				Turn2( head , z_axis, 5, MOVEANIMATIONSPEED*22 )				
			end
			Move( pelvis, y_axis, 0, MOVEANIMATIONSPEED*10 )			
			Turn2( lleg1, x_axis, -27.7, MOVEANIMATIONSPEED*16.89 )
			Turn2( lleg2, x_axis, -38.4, MOVEANIMATIONSPEED*153.54 )
			Turn2( lleg3, x_axis, 66.3, MOVEANIMATIONSPEED*136.66 )
			Turn2( rleg1, x_axis, 75.5, MOVEANIMATIONSPEED*182.43 )
			Turn2( rleg2, x_axis, -66, MOVEANIMATIONSPEED*164.12 )
			Turn2( rleg3, x_axis, -8.8, MOVEANIMATIONSPEED*18.31 )
			Sleep(MOVEANIMATIONSLEEPTIME*2.99)		
		end
		if not moving then 
			if not attacking then
				Turn2( luparm , x_axis, 15, 20 )
				Turn2( luparm , y_axis, 0, 10 )			
				Turn2( ruparm , x_axis, 15, 20 )
				Turn2( ruparm , y_axis, 0, 10 )	
				Turn2( gun , x_axis, 45, 20 )
				Turn2( rocketgun , x_axis, 45, 20 )	
				Turn2( chest , z_axis, 0, 20 )
				Turn2( head , z_axis, 0, 20 )				
			end					
			Move( pelvis, y_axis, 0, MOVEANIMATIONSPEED*10 )
			Turn2( lleg1, x_axis, 0, MOVEANIMATIONSPEED*178.24 )
			Turn2( lleg2, x_axis, 0, MOVEANIMATIONSPEED*153.54 )
			Turn2( lleg3, x_axis, 0, MOVEANIMATIONSPEED*147.29 )
			Turn2( rleg1, x_axis, 0, MOVEANIMATIONSPEED*221.14 )
			Turn2( rleg2, x_axis, 0, MOVEANIMATIONSPEED*164.12 )
			Turn2( rleg3, x_axis, 0, MOVEANIMATIONSPEED*140.28 )
	end
		Sleep( 10)
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking and not moving then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( chest, y_axis, 30, MOVEANIMATIONSPEED*20 )
				Turn2( head, y_axis, 15, MOVEANIMATIONSPEED*30 )			
				WaitForTurn( chest, y_axis )
			elseif (borednumber < 5)then
				Turn2( chest, y_axis, -30, MOVEANIMATIONSPEED*20 )			
				Turn2( head, y_axis, -15, MOVEANIMATIONSPEED*30 )	
				WaitForTurn( chest, y_axis )
			else 
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*35 )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*30 )
				WaitForTurn( chest, y_axis )				
			end
		end
	Sleep(1500)		
	end
end

function script.Create()
	SetMoveAnimationSpeed()
	Turn2( luparm , x_axis, 15 )
	Turn2( ruparm , x_axis, 15 )
	Turn2( gun , x_axis, 45 )
	Turn2( rocketgun , x_axis, 45 )
	Turn2( emit_summon , x_axis, -90 )
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	
			EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
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
	Sleep( 5000)
	StopSpin  ( barrel, z_axis, 50 )	
	attacking = false
	return (0)
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return remit	
end

function script.AimFromWeapon1 ()
	return rocketgun	
end

function script.AimWeapon1(heading, pitch)
	Turn2( chest, y_axis, 0, 300 )
	Turn2( ruparm , x_axis, 0, 300 )

	attacking = true
	Signal( SIG_AIM1)
	SetSignalMask( SIG_AIM1)

	Turn( head, y_axis, heading, 1 )
	
	Turn( ruparm, y_axis, heading, 5 )
	Turn( rocketgun, x_axis, -pitch, 5 )		
    WaitForTurn(ruparm, y_axis)
	WaitForTurn(rocketgun, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	EmitSfx( remit,  BIGGUNFLARE )	
	EmitSfx( emit_groundflash_r,  GROUNDFLASH )
	return (0)
end


--weapon 2 -----------------------------------------------------------------

function script.QueryWeapon2 (piecenum)
	return lemit	
end

function script.AimFromWeapon2 (piecenum)
	return gun	
end

function script.AimWeapon2 (heading, pitch)
	Turn2( chest, y_axis, 0, 300 )
	Turn2( luparm , x_axis, 0, 300 )

	attacking = true
	Signal( SIG_AIM2)
	SetSignalMask( SIG_AIM2)
	Spring.UnitScript.Spin ( barrel, z_axis, 10, 20)	

	Turn( luparm, y_axis, heading, 5 )
	Turn( gun, x_axis, -pitch, 5 )	
 
    WaitForTurn(luparm, y_axis)
	WaitForTurn(gun, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot2()
	EmitSfx( lemit,  SMALLGUNFLARE )	
	EmitSfx( emit_groundflash_l,  GROUNDFLASH )
	return (0)
end

	
function script.Killed(severity, corpsetype)

	local px, py, pz = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/demoncry.wav", 10, px, py, pz)
			
	Turn2( chest , x_axis, -43, 300 )
	Turn2( chest , y_axis, 15, 50 )
	Turn2( luparm , z_axis, -50, 200 )
	Turn2( ruparm , z_axis, 30, 200 )

	Turn2( rleg1 , y_axis, -45, 500 )
	Turn2( rleg1 , z_axis, -17, 500 )

	Turn2( base , x_axis, -25, 75 )
	WaitForTurn(base, x_axis)
	Turn2( base , x_axis, -50, 200 )
	WaitForTurn(base, x_axis)
	Turn2( base , x_axis, -75, 400 )
	WaitForTurn(base, x_axis)
	
	EmitSfx( chest,  BLOOD )
	EmitSfx( head,  BLOOD )

	EmitSfx( lleg3,  FOOTDUST )
	EmitSfx( rleg3,  FOOTDUST )
	
	Sleep( 100)

	return (0)
end