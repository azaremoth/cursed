include "constants.lua"

local base = piece 'base'
local head = piece 'head'
local tail1 = piece 'tail1'
local tail2 = piece 'tail2'
local tail3 = piece 'tail3'
local jaws = piece 'jaws'
local larm_up = piece 'larm_up'
local larm_low = piece 'larm_low'
local larm_spike = piece 'larm_spike'
local rarm_up = piece 'rarm_up'
local rarm_low = piece 'rarm_low'
local rarm_spike = piece 'rarm_spike'
local emit_gun1 = piece 'emit_gun1'
local emit_gun2 = piece 'emit_gun2'


local moving = false
local jumping = false
local aiming = false

local restore_delay = 3000

local JUMP	 = 1024+0
local BOOM	 = 1025+0
local TELEPORTFX	 = 1026+0


--signals
local SIG_Aim = 1
local SIG_Aim2 = 4

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/4000)
	MOVEANIMATIONSLEEPTIME = (38000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

-- Walk Motion
local function Moveanimation()
	while true do
		SetMoveAnimationSpeed()	
		if moving then
			Turn2( tail1, x_axis, 30, MOVEANIMATIONSPEED )
			Turn2( tail2, x_axis, 70, MOVEANIMATIONSPEED )
			Turn2( tail3, x_axis, 100, MOVEANIMATIONSPEED )
			if not aiming then		
				Turn2( rarm_up, x_axis, -10, MOVEANIMATIONSPEED )
				Turn2( larm_up, x_axis, 30, MOVEANIMATIONSPEED )
			end
			Sleep(MOVEANIMATIONSLEEPTIME*3)				
		end
		if moving then
			Turn2( tail1, x_axis, 70, MOVEANIMATIONSPEED )
			Turn2( tail2, x_axis, 30, MOVEANIMATIONSPEED )
			Turn2( tail3, x_axis, 40, MOVEANIMATIONSPEED )
			
			if not aiming then
				Turn2( rarm_up, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( larm_up, x_axis, -10, MOVEANIMATIONSPEED )
			end
			Sleep(MOVEANIMATIONSLEEPTIME*3)	
		end
		
		
		if not moving then
			if not aiming then
				Turn2( tail1, x_axis, -15, MOVEANIMATIONSPEED/6 )
				Turn2( tail2, x_axis, 45, MOVEANIMATIONSPEED/6 )
				Turn2( tail3, x_axis, 60, MOVEANIMATIONSPEED/6 )
				Turn2( rarm_up, x_axis, 70, MOVEANIMATIONSPEED/5 )
				Turn2( larm_up, x_axis, 80, MOVEANIMATIONSPEED/5 )
			end			
			Sleep(MOVEANIMATIONSLEEPTIME*5)	
		end
		
		if not moving then
			if not aiming then		
				Turn2( tail1, x_axis, -30, MOVEANIMATIONSPEED/6 )
				Turn2( tail2, x_axis, 45, MOVEANIMATIONSPEED/6 )
				Turn2( tail3, x_axis, 45, MOVEANIMATIONSPEED/6 )
			end
			Sleep(MOVEANIMATIONSLEEPTIME*5)	
		end
		
		
		
	Sleep(50)	
	end
end

function script.Activate()
end

function script.Deactivate()
end

function script.MoveRate(curRate)
	if curRate < 1 then
		moving = false
	else
		moving = true
	end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	--		EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	StartThread( Moveanimation )
end

local function RestoreAfterDelay()
	Sleep(restore_delay)
	aiming = false
	Turn2( jaws, x_axis, 0, 20 )
	Turn2( rarm_up, y_axis, 0, 20 )
	Turn2( larm_up, y_axis, 0, 20 )	
	return (0)
end


function script.Shot1 ()
end

function script.Shot2 ()
end

function script.QueryWeapon1()
	 return emit_gun1
end

function script.QueryWeapon2()
	 return emit_gun2
end

function script.AimFromWeapon1() return base end

function script.AimFromWeapon2() return base end

function script.AimWeapon1(heading, pitch)
	Turn2( jaws, x_axis, 60, 100 )
	Turn2( rarm_up, y_axis, -30, 100 )
	Turn2( larm_up, y_axis, 30, 100 )
	Turn2( rarm_low, y_axis, -20, 100 )
	Turn2( larm_low, y_axis, 20, 100 )
	aiming = true	
	StartThread( RestoreAfterDelay) 	
	return true
end

function script.AimWeapon2(heading, pitch)
	return true
end

--Jumps
local function JumpExhaust()
	while jumping do 
		EmitSfx(base, JUMP)
		EmitSfx(base, JUMP)
		Sleep(33)
	end
end

function script.preJump()
end

function script.beginJump()
	jumping = true
	EmitSfx(base,TELEPORTFX)	
	EmitSfx(head,TELEPORTFX)		
	EmitSfx(tail1,TELEPORTFX)		
	EmitSfx(tail3,TELEPORTFX)
end

function script.jumping()
end

function script.halfJump()
end

function script.endJump()
	jumping = false
	EmitSfx(base,TELEPORTFX)	
	EmitSfx(head,TELEPORTFX)		
	EmitSfx(tail1,TELEPORTFX)		
	EmitSfx(tail3,TELEPORTFX)
end	

function script.Killed(recentDamage, maxHealth)
	Explode(tail1, SFX.FALL + SFX.NO_HEATCLOUD)			
	Explode(tail2, SFX.FALL + SFX.NO_HEATCLOUD)			
	Explode(tail3, SFX.FALL + SFX.NO_HEATCLOUD)
	EmitSfx(base, BOOM)		
	return 3
end