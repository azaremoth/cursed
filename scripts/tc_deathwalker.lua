local base = piece 'base' 
local pelvis = piece 'pelvis' 
local chest = piece 'chest' 
local top1 = piece 'top1' 
local top2 = piece 'top2' 
local top3 = piece 'top3' 
local head = piece 'head' 
local horn1 = piece 'horn1' 
local horn2 = piece 'horn2' 
local luparm = piece 'luparm' 
local lgun_holder = piece 'lgun_holder' 
local rgun_holder = piece 'rgun_holder' 
local lgun = piece 'lgun' 
local rgun = piece 'rgun'
local lbarrel = piece 'lbarrel' 
local rbarrel = piece 'rbarrel'
local rockbox = piece 'rockbox' 
local ruparm = piece 'ruparm' 
local lleg1 = piece 'lleg1' 
local lleg2 = piece 'lleg2' 
local lleg3 = piece 'lleg3' 
local rleg1 = piece 'rleg1' 
local rleg2 = piece 'rleg2' 
local rleg3 = piece 'rleg3' 
local lemit = piece 'lemit' 
local remit = piece 'remit' 
local rockemit = piece 'rockemit' 
local emit_summon = piece 'emit_summon' 
local emit_rleg = piece 'emit_rleg' 
local emit_lleg = piece 'emit_lleg' 
local emit_groundflash_r = piece 'emit_groundflash_r' 
local emit_groundflash_l = piece 'emit_groundflash_l' 

local RandomNumber2, moving, attacking, MOVEANIMATIONSPEED

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_AIM2 = 8
local SIG_WALK = 1

local SUMMONING = 1024+0
local FOOTDUST = 1025+0
local BLOOD = 1026+0
local BIGGUNFLARE = 1027+0
local ROCKETFLARE = 1028+0
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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1900)
	MOVEANIMATIONSLEEPTIME = (20000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

-- Walk Motion
local function Walkscript()
	while true do
		if moving then 
--			SetSignalMask(SIG_WALK)	
			SetMoveAnimationSpeed()
			if not attacking then
				Turn( luparm , x_axis, math.rad(-25), math.rad(MOVEANIMATIONSPEED*0.8) )
			end
			Turn( top1 , x_axis, math.rad(-3), math.rad(MOVEANIMATIONSPEED*0.5) )
			Turn( top2 , x_axis, math.rad(-3), math.rad(MOVEANIMATIONSPEED*0.5) )			
			Turn( top3 , x_axis, math.rad(-3), math.rad(MOVEANIMATIONSPEED*0.5) )			
			
			Turn( rleg1 , x_axis, math.rad(-30), math.rad(MOVEANIMATIONSPEED) )
			Turn( rleg2 , x_axis, math.rad(40), math.rad(MOVEANIMATIONSPEED*1.6) )
			Move( pelvis , y_axis, 0.3 , 8 )
			WaitForTurn(lleg1, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
			if not attacking then
				Turn( ruparm , x_axis, math.rad(15), math.rad(MOVEANIMATIONSPEED*0.8) )
				Turn( chest , z_axis, math.rad(-(-2)), math.rad(MOVEANIMATIONSPEED) )
				Turn( head , z_axis, math.rad(-(5)), math.rad(MOVEANIMATIONSPEED*0.3) )
			end
			EmitSfx( emit_lleg,  FOOTDUST )
			Turn( lleg1 , x_axis, math.rad(20), math.rad(MOVEANIMATIONSPEED) )		
			Turn2( pelvis, z_axis, -2, MOVEANIMATIONSPEED*0.3 )			
			Turn( rleg1 , z_axis, math.rad(-(-5)), math.rad(MOVEANIMATIONSPEED*0.8) )
			WaitForTurn(rleg2, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
			Turn( rleg2 , x_axis, math.rad(0 ), math.rad(MOVEANIMATIONSPEED*1.6) )
			Move( pelvis , y_axis, 0 , 8 )
			WaitForTurn(rleg1, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)					
		end
		if moving then
			if not attacking then
				Turn( ruparm , x_axis, math.rad(-25), math.rad(MOVEANIMATIONSPEED*0.8) )
				Turn( chest , z_axis, math.rad(-(2)), math.rad(MOVEANIMATIONSPEED) )
				Turn( head , z_axis, math.rad(-(-5)), math.rad(MOVEANIMATIONSPEED*0.3) )
			end
			EmitSfx( emit_rleg,  FOOTDUST )
			Turn( rleg1 , x_axis, math.rad(20), math.rad(MOVEANIMATIONSPEED) )
			Turn2( pelvis, z_axis, 2, MOVEANIMATIONSPEED*0.3 )		
			Turn( lleg1 , z_axis, math.rad(-(5)), math.rad(MOVEANIMATIONSPEED*0.8) )
--			Turn( rleg1 , z_axis, math.rad(-(10)), math.rad(MOVEANIMATIONSPEED*0.8) )
			WaitForTurn(lleg1, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)					
		end
		if moving then
			if not attacking then
				Turn( luparm , x_axis, math.rad(15), math.rad(MOVEANIMATIONSPEED*0.8) )
			end
			Turn( top1 , x_axis, math.rad(3), math.rad(MOVEANIMATIONSPEED*0.5) )
			Turn( top2 , x_axis, math.rad(3), math.rad(MOVEANIMATIONSPEED*0.5) )			
			Turn( top3 , x_axis, math.rad(5), math.rad(MOVEANIMATIONSPEED*0.5) )		
			
			Turn( lleg1 , x_axis, math.rad(-30), math.rad(MOVEANIMATIONSPEED) )
			Turn( lleg2 , x_axis, math.rad(40), math.rad(MOVEANIMATIONSPEED*1.6) )
			Move( pelvis , y_axis, 0.3 , 8 )
			WaitForTurn(lleg2, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)					
		end
		if moving then 
			Turn( lleg2 , x_axis, math.rad(0 ), math.rad((MOVEANIMATIONSPEED*1.6)) )
			Move( pelvis , y_axis, 0 , 8 )
			WaitForTurn(rleg1, x_axis)
			Sleep(MOVEANIMATIONSLEEPTIME)					
		end
		if not moving then 
			if not attacking then	
				Turn( luparm , x_axis, math.rad(-15), math.rad(MOVEANIMATIONSPEED*1.2) )
				Turn( ruparm , x_axis, math.rad(-15), math.rad(MOVEANIMATIONSPEED*1.2) )
				Turn( lgun_holder , x_axis, math.rad(60), math.rad(MOVEANIMATIONSPEED*1.2) )
				Turn( rgun_holder , x_axis, math.rad(60), math.rad(MOVEANIMATIONSPEED*1.2) )		
				Turn( chest , z_axis, math.rad(-(0)), math.rad(MOVEANIMATIONSPEED) )
				Turn( head , z_axis, math.rad(-(0)), math.rad(MOVEANIMATIONSPEED*0.3) )
			end	
			Turn( top1 , x_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED) )
			Turn( top2 , x_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED) )			
			Turn( top3 , x_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED) )	
			Turn( rleg1 , x_axis, math.rad(0 ), math.rad(MOVEANIMATIONSPEED) )
			Turn( lleg1 , x_axis, math.rad(0 ), math.rad(MOVEANIMATIONSPEED) )
			Turn( rleg2 , x_axis, math.rad(0 ), math.rad(MOVEANIMATIONSPEED*1.6) )
			Turn( lleg2 , x_axis, math.rad(0 ), math.rad(MOVEANIMATIONSPEED*1.6) )
			Turn2( pelvis, z_axis, 0, MOVEANIMATIONSPEED*0.3 )		
			Turn( lleg1 , z_axis, math.rad(-(0 )), math.rad(MOVEANIMATIONSPEED*0.8) )
			Turn( rleg1 , z_axis, math.rad(-(0 )), math.rad(MOVEANIMATIONSPEED*0.8) )
			Move( pelvis , y_axis, 0 , 8 )
	end
		Sleep( 10)
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, 30, MOVEANIMATIONSPEED*1.5 )			
				WaitForTurn( chest, y_axis )
			elseif (borednumber < 5)then
				Turn2( chest, y_axis, -100, MOVEANIMATIONSPEED )			
				Turn2( head, y_axis, -10, MOVEANIMATIONSPEED*1.5 )	
				WaitForTurn( chest, y_axis )
			else 
				Turn2( chest, y_axis, -50, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, 20, MOVEANIMATIONSPEED*1.5 )
				WaitForTurn( chest, y_axis )				
			end
		end
	Sleep(1500)		
	end
end

function script.Create()
	SetMoveAnimationSpeed()
	moving = false
	attacking = false
	Turn( luparm , x_axis, math.rad(45) )
	Turn( ruparm , x_axis, math.rad(45) )
	Turn( lgun_holder , x_axis, math.rad(-45) )
	Turn( rgun_holder , x_axis, math.rad(-45) )
	Turn( emit_summon , x_axis, math.rad(-90) )
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
	Move( rbarrel , z_axis, 0 , 20 )
	Move( lbarrel , z_axis, 0 , 20 )
	Sleep( 5000)
	Turn( ruparm , y_axis, 0, 5 )
	Turn( luparm , y_axis, 0, 5 )
	Turn( head, y_axis, 0, 1 )
	attacking = false
	return (0)
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return remit	
end

function script.AimFromWeapon1 ()
	return rgun_holder	
end

function script.AimWeapon1(heading, pitch)
	Turn2( chest, y_axis, 0, 300 )
	Turn( ruparm , x_axis, 0, math.rad(500.000000) )

	attacking = true
	Signal( SIG_AIM1)
	SetSignalMask( SIG_AIM1)
	
	Turn( ruparm, y_axis, heading, 5 )
	Turn( rgun_holder, x_axis, -pitch, 5 )		
	
	
    WaitForTurn(ruparm, y_axis)
	WaitForTurn(rgun_holder, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	Move( rbarrel , z_axis, -10, 100 )
	EmitSfx( remit,  BIGGUNFLARE )	
	EmitSfx( emit_groundflash_r,  GROUNDFLASH )
	return (0)
end


--weapon 2 -----------------------------------------------------------------

function script.QueryWeapon2 (piecenum)
	return lemit	
end

function script.AimFromWeapon2 (piecenum)
	return lgun_holder	
end

function script.AimWeapon2 (heading, pitch)
	Turn2( chest, y_axis, 0, 300 )
	Turn( luparm , x_axis, 0, math.rad(500.000000) )

	attacking = true
	Signal( SIG_AIM2)
	SetSignalMask( SIG_AIM2)

	Turn( luparm, y_axis, heading, 5 )
	Turn( lgun_holder, x_axis, -pitch, 5 )	
 
    WaitForTurn(luparm, y_axis)
	WaitForTurn(lgun_holder, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot2()
	Move( lbarrel , z_axis, -10, 100 )
	EmitSfx( lemit,  BIGGUNFLARE )	
	EmitSfx( emit_groundflash_l,  GROUNDFLASH )
	return (0)
end

--weapon 3 -----------------------------------------------------------------

function script.QueryWeapon3 (piecenum)
	return rockemit	
end

function script.AimFromWeapon3 (piecenum)
	return rockbox	
end

function script.AimWeapon3 (heading, pitch)
	Signal( SIG_AIM3)
	SetSignalMask( SIG_AIM3)
    return (1)
end

function script.Shot3()
	EmitSfx( rockemit,  ROCKETFLARE )	
	return (0)
end
	
function script.Killed(severity, corpsetype)

	local px, py, pz = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/agares_select.wav", 10, px, py, pz)
			
	Turn( chest , x_axis, math.rad(-43), math.rad(300) )
	Turn( chest , y_axis, math.rad(15), math.rad(50) )
	Turn( luparm , z_axis, math.rad(-(50)), math.rad(200) )
	Turn( ruparm , z_axis, math.rad(-(-30)), math.rad(200) )

	Turn( rleg1 , y_axis, math.rad(-45), math.rad(500) )
	Turn( rleg1 , z_axis, math.rad(-(17)), math.rad(500) )

	Turn( base , x_axis, math.rad(-25), math.rad(75) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-50), math.rad(200) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-75), math.rad(400) )
	WaitForTurn(base, x_axis)
	
	EmitSfx( chest,  BLOOD )
	EmitSfx( head,  BLOOD )

	EmitSfx( lleg3,  FOOTDUST )
	EmitSfx( rleg3,  FOOTDUST )
	
	Sleep( 100)

	return (0)
end