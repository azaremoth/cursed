include "constants.lua"
include "common.lua"

--pieces
local base = piece "base"
local raisepoint = piece 'raisepoint'
local building = piece "building"
local turret = piece "turret"
local sleeve = piece "sleeve"
local barrel1 = piece "barrel1"
local sleeve = piece "sleeve"
local barrel2 = piece "barrel2"
local fist1 = piece 'fist1'
local fist2 = piece 'fist2'
local fist3 = piece 'fist3'

-- emiters etc.
local emit1 = piece "emit1"
local emit2 = piece "emit2"
local emit_groundflash = piece "emit_groundflash"

-- variables
local gun = 1
local isaiming = false

--signals
local SIG_AIM1 = 2

--FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local GUNFLARE	 = 1026+0
local GROUNDFLASH	 = 1027+0

-----------------------------------------------------------------

-- Motion Control
local function MotionControl()
	while true do
		if not isaiming then
			borednumber = math.random(500)
			if (borednumber > 495) and not isaiming then
				Turn2( turret, y_axis, math.random(360), 30 )				
				WaitForTurn( turret, y_axis )
			end
		end
		Sleep(200)		
	end
end

function script.Activate ( )
end

function script.Deactivate ( )
end

local function RestoreAfterDelay()
	while true do
		Sleep(300)
		idleCount = (idleCount - 300)
		if (idleCount < 1) then
			idleCount = 0
			Turn2( sleeve,  x_axis, 0, 20 )
			isaiming = false
		end		
	end
end

function script.Create()
	if NotEnemyAI() then
		Hide(fist1)
		Hide(fist2)
		Hide(fist3)
	end
	gun = 1
	isaiming = false
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( raisepoint, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( raisepoint, y_axis, outofground, 50 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( raisepoint, y_axis, 0, 200 )
	Sleep(500)
	StartThread( MotionControl )
	StartThread( RestoreAfterDelay )
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	if gun >= 0 then
		return emit1
	end
	if gun < 0 then
		return emit2
	end
end

function script.AimFromWeapon1 ()
	return turret
end

function script.AimWeapon1(heading, pitch)
	isaiming = true
	idleCount = maxIdleCount
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( turret, y_axis, heading, 1.6 )
	Turn( sleeve,  x_axis, -pitch, 1.0 ) 
	WaitForTurn (turret, y_axis)
	WaitForTurn (sleeve, x_axis)	
	return true
end

function script.FireWeapon1()
	if gun >= 0 then
		Move(barrel2, z_axis, -5)
		Move(barrel2, z_axis, 0, 24)
		EmitSfx( emit1, GUNFLARE )
	end
	if gun < 0 then
		Move(barrel1, z_axis, -5)
		Move(barrel1, z_axis, 0, 24)
		EmitSfx( emit2, GUNFLARE )
	end
	EmitSfx( emit_groundflash, GROUNDFLASH )
	gun = gun*(-1)
	return(1)
end
-----------------------------------------------------------------

function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end