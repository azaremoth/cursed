local base = piece 'base' 
local pelvis = piece 'pelvis' 
local chest = piece 'chest' 

local turret1 = piece 'turret1'
local turret2 = piece 'turret2'
local turret3 = piece 'turret3'

local gun11 = piece 'gun11'
local gun12 = piece 'gun12'
local gun21 = piece 'gun21'
local gun22 = piece 'gun22'
local gun3 = piece 'gun3'

local lleg1 = piece 'lleg1' 
local lleg2 = piece 'lleg2' 
local lleg3 = piece 'lleg3' 
local lfoot = piece 'lfoot' 
local rleg1 = piece 'rleg1' 
local rleg2 = piece 'rleg2' 
local rleg3 = piece 'rleg3'
local rfoot = piece 'rfoot' 

local emit11 = piece 'emit11'
local emit12 = piece 'emit12'
local emit21 = piece 'emit21'
local emit22 = piece 'emit22'
local emit3 = piece 'emit3' 
local emit_groundflash1 = piece 'emit_groundflash1'
local emit_groundflash2 = piece 'emit_groundflash2'
local emit_groundflash3 = piece 'emit_groundflash3'
local emit_lleg = piece 'emit_lleg' 
local emit_rleg = piece 'emit_rleg' 

local dusters1 = piece 'dusters1' 
local dusters2 = piece 'dusters2' 
local dusters3 = piece 'dusters3' 
local dusters4 = piece 'dusters4' 

local moving = false
local MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1900)
local attacking = false
local smallgun = 1

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 4

local FOOTDUST = 1024+0
local BOOM = 1025+0
local FLARE = 1026+0
local GROUNDFLASH = 1027+0
local BIGFLARE = 1028+0
local unfinished = true

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/3500)
	MOVEANIMATIONSLEEPTIME = (35000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 5 then 
		MOVEANIMATIONSPEED = 5
	end
	if MOVEANIMATIONSLEEPTIME > 1500 then 
		MOVEANIMATIONSLEEPTIME = 1500
	end
end

-- Walk Motion
local function Walkscript()
	while true do
		if moving then 
			SetMoveAnimationSpeed()
			Turn(rleg2, y_axis, 0, math.rad(MOVEANIMATIONSPEED))
			Turn(rleg2, z_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED))
			Turn(rfoot, z_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED))

			Turn(rleg1, x_axis, math.rad(50.000000), math.rad(MOVEANIMATIONSPEED*3)) --Mid
			Turn(rleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*6)) --Mid
			Turn(rleg3, x_axis, math.rad(20.000000), math.rad(MOVEANIMATIONSPEED*3))
			Turn(rfoot, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*20)) -- RIGHT FOOT IS REAR	
			if not attacking then
				Turn(chest, y_axis, 0, math.rad(MOVEANIMATIONSPEED)*4)
				Turn(chest, z_axis, math.rad(-(5)), math.rad(MOVEANIMATIONSPEED*0.4))
				Turn(chest, x_axis, math.rad(3), math.rad(MOVEANIMATIONSPEED*1))

				Turn(turret1, x_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED*3))
				Turn(turret2, x_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED*3))			
					
			end
			Sleep(MOVEANIMATIONSLEEPTIME*2)			
		end
		if moving then 
			SetMoveAnimationSpeed()

			Turn(rleg1, x_axis, math.rad(-20.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(rleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(rleg3, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(rfoot, x_axis, math.rad(-10.000000), math.rad(MOVEANIMATIONSPEED*20)) -- FOOT IS MIDDLE MOVING FORWARD
			
			if not attacking then
				Turn(chest, z_axis, math.rad(-(-5)), math.rad(MOVEANIMATIONSPEED*0.4))
				Turn(chest, x_axis, math.rad(-3), math.rad(MOVEANIMATIONSPEED*1))		
			end
						
			Sleep(MOVEANIMATIONSLEEPTIME*0.75)			
		end
		if moving then 
			SetMoveAnimationSpeed()
			Turn(rleg1, x_axis, math.rad(-20.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(rleg2, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(rleg3, x_axis, math.rad(40.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(rfoot, x_axis, math.rad(20.000000), math.rad(MOVEANIMATIONSPEED*20)) -- RIGHT FOOT IS FRONT
			if not attacking then
				Turn(chest, x_axis, math.rad(3), math.rad(MOVEANIMATIONSPEED*1))	
			end
			
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then 
			SetMoveAnimationSpeed()
			Turn(rleg1, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(rleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(rleg3, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(rfoot, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*20))
			EmitSfx( rfoot,  FOOTDUST )
			Sleep(MOVEANIMATIONSLEEPTIME*0.5)			
		end
		if not moving then 
--			Move( pelvis, y_axis, 0, MOVEANIMATIONSPEED )	
			
			Turn2(rleg1, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rleg2, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rleg3, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rfoot, z_axis, 0, MOVEANIMATIONSPEED*4)
		
			Turn2(rleg1, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rleg2, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rleg3, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(rfoot, x_axis, 0, MOVEANIMATIONSPEED*4)
		
			if not attacking then
				Turn(turret1, x_axis, math.rad(20), math.rad(MOVEANIMATIONSPEED*3))
				Turn(turret2, x_axis, math.rad(20), math.rad(MOVEANIMATIONSPEED*3))
			end			
	end
		Sleep(100)
	end
end

local function Walkscript_leftonly()
	while true do
		if moving then 
			SetMoveAnimationSpeed()
			Turn(lleg2, y_axis, 0, math.rad(MOVEANIMATIONSPEED))
			Turn(lleg2, z_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED))
			Turn(lfoot, z_axis, math.rad(0), math.rad(MOVEANIMATIONSPEED))
			Turn(lleg1, x_axis, math.rad(-20.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(lleg2, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*8)) --Up
			Turn(lleg3, x_axis, math.rad(40.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(lfoot, x_axis, math.rad(20.000000), math.rad(MOVEANIMATIONSPEED*20)) -- LEFT FOOT IS FRONT
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then 
			SetMoveAnimationSpeed()	
			Turn(lleg1, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(lleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(lleg3, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(lfoot, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*20))
			EmitSfx( lfoot,  FOOTDUST )	
			Sleep(MOVEANIMATIONSLEEPTIME*0.5)			
		end		
		if moving then 
			SetMoveAnimationSpeed()
			Turn(lleg1, x_axis, math.rad(50.000000), math.rad(MOVEANIMATIONSPEED*3)) --Mid
			Turn(lleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*6)) --Mid
			Turn(lleg3, x_axis, math.rad(20.000000), math.rad(MOVEANIMATIONSPEED*3))
			Turn(lfoot, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*20)) -- LEFT FOOT IS REAR	
			Sleep(MOVEANIMATIONSLEEPTIME*2)			
		end
		if moving then 
			SetMoveAnimationSpeed()	
			Turn(lleg1, x_axis, math.rad(-20.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(lleg2, x_axis, math.rad(0.000000), math.rad(MOVEANIMATIONSPEED*8)) --Back
			Turn(lleg3, x_axis, math.rad(-40.000000), math.rad(MOVEANIMATIONSPEED*6))
			Turn(lfoot, x_axis, math.rad(-10.000000), math.rad(MOVEANIMATIONSPEED*20)) -- FOOT IS MIDDLE MOVING FORWARD
			Sleep(MOVEANIMATIONSLEEPTIME*0.75)			
		end
		if not moving then 
			Turn2(lleg1, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lleg2, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lleg3, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lfoot, z_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lleg1, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lleg2, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lleg3, x_axis, 0, MOVEANIMATIONSPEED*4)
			Turn2(lfoot, x_axis, 0, MOVEANIMATIONSPEED*4)

	end
		Sleep(100)
	end
end


-- Bored Animation
local function BoredAnimation()
	while true do
		if attacking and not moving then
			Sleep(200)
		else
			borednumber = math.random(500)
			if (borednumber > 497) and not attacking then
				Turn2( chest, y_axis, math.random(360), 30 )				
				WaitForTurn( chest, y_axis )
			end
		end
		Sleep(50)		
	end
end

-- Dusters
local function BoredAnimation()
	while unfinished do
		EmitSfx( dusters1,  FOOTDUST )	
		EmitSfx( dusters2,  FOOTDUST )	
		EmitSfx( dusters3,  FOOTDUST )	
		EmitSfx( dusters4,  FOOTDUST )			
		Sleep(50)		
	end
end

------------------------ ACTIVATION

function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 1000
	attacking = false
	smallgun = 1	

	Move( pelvis, y_axis, -45)
	
	Turn(lleg1, x_axis, math.rad(-20.000000))
	Turn(lleg2, x_axis, math.rad(50.000000))
	Turn(lleg3, x_axis, math.rad(-60.000000))
	Turn(lfoot, x_axis, math.rad(30.000000))
	
	Turn(rleg1, x_axis, math.rad(-20.000000))
	Turn(rleg2, x_axis, math.rad(50.000000))
	Turn(rleg3, x_axis, math.rad(-60.000000))
	Turn(rfoot, x_axis, math.rad(30.000000))

	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread( Dusters )
	
	Sleep(4000)
	Move( pelvis, y_axis, 0, 20)
	
	unfinished = false
	StartThread( Walkscript )
	StartThread( Walkscript_leftonly )	
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
	Turn2( turret1 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret1 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret1 , z_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , z_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , z_axis, 0, MOVEANIMATIONSPEED )
	attacking = false
	return (0)
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	if (smallgun == 1) then
		return emit11
	elseif (smallgun == 2) then
		return emit12
	elseif (smallgun == 3) then
		return emit21
	else
		return emit22
	end
end

function script.AimFromWeapon1 ()
	return chest	
end

function script.AimWeapon1(heading, pitch)
	Turn2( chest, y_axis, 0, 300 )		
	Turn2( turret1, z_axis, 0, MOVEANIMATIONSPEED*5 )
	Turn2( turret2, z_axis, 0, MOVEANIMATIONSPEED*5 )	

	attacking = true
	Signal( SIG_AIM1)
	SetSignalMask( SIG_AIM1)
	
	Turn( chest, y_axis, heading, 5 )
	Turn( turret1, x_axis, -pitch, 5 )		
	Turn( turret2, x_axis, -pitch, 5 )	
	
	WaitForTurn(turret1, x_axis)
	WaitForTurn(turret2, x_axis)    	
	WaitForTurn(chest, y_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	if (smallgun == 1) then
		EmitSfx( emit11,  FLARE )
		EmitSfx( emit_groundflash1,  GROUNDFLASH )
		smallgun = 2
	elseif (smallgun == 2) then
		EmitSfx( emit12,  FLARE )
		EmitSfx( emit_groundflash1,  GROUNDFLASH )
	    smallgun = 3
	elseif (smallgun == 3) then
		EmitSfx( emit21,  FLARE )
		EmitSfx( emit_groundflash2,  GROUNDFLASH )
		smallgun = 4
	else
		EmitSfx( emit22,  FLARE )
		EmitSfx( emit_groundflash2,  GROUNDFLASH )
		smallgun = 1
	end
	return (0)
end


--weapon 2 -----------------------------------------------------------------

function script.QueryWeapon2 (piecenum)
	return emit3	
end

function script.AimFromWeapon2 (piecenum)
	return turret3	
end

function script.AimWeapon2 (heading, pitch)

	attacking = true
	Signal( SIG_AIM2)
	SetSignalMask( SIG_AIM2)

	Turn( chest, y_axis, heading, 5 )
	Turn( turret3, x_axis, -pitch, 1 )	
 
    WaitForTurn(chest, y_axis)
	WaitForTurn(turret3, x_axis)
	
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot2()
	EmitSfx( emit3,  BIGFLARE )	
	EmitSfx( emit_groundflash3,  GROUNDFLASH )
	return (0)
end

	
function script.Killed(severity, corpsetype)
--[[
	local px, py, pz = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/demoncry.wav", 10, px, py, pz)
			
	Turn( chest , x_axis, math.rad(-43), math.rad(300) )
	Turn( chest , y_axis, math.rad(15), math.rad(50) )
	Turn( turret1 , z_axis, math.rad(-(50)), math.rad(200) )
	Turn( turret2 , z_axis, math.rad(-(-30)), math.rad(200) )

	Turn( rleg2 , y_axis, math.rad(-45), math.rad(500) )
	Turn( rleg2 , z_axis, math.rad(-(17)), math.rad(500) )

	Turn( base , x_axis, math.rad(-25), math.rad(75) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-50), math.rad(200) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-75), math.rad(400) )
	WaitForTurn(base, x_axis)
	
	EmitSfx( chest,  BLOOD )
	EmitSfx( head,  BLOOD )

	EmitSfx( lfoot,  FOOTDUST )
	EmitSfx( rfoot,  FOOTDUST )]]--
	
	Sleep( 100)

	return (0)
end