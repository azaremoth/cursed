include "constants.lua"
include "common.lua"

--pieces
local base = piece "base"
local turretbase = piece "turretbase"
local turret = piece "turret"
local torso = piece "torso"
local barrel1 = piece "barrel1"
local barrel2 = piece "barrel2"
local aimpoint = piece "aimpoint"

-- emiters etc.
local emit1 = piece "emit1"
local emit2 = piece "emit2"
local emit_groundflash = piece "emit_groundflash"

-- variables
local gun = 1
local isaiming

--signals
local SIG_AIM1 = 2

--FX
local GUNFLARE	 = 1024+0
local BOOM	 = 1025+0
local turretbaseFX	 = 1026+0
local GROUNDFLASH	 = 1027+0

-----------------------------------------------------------------

-- Motion Control
local function MotionControl()
	while true do
		if isaiming then
			Sleep(50)
		else
			borednumber = math.random(500)
			if (borednumber > 496) and not isaiming then
				Turn2( turret, y_axis, math.random(360), 50 )				
				WaitForTurn( turret, y_axis )
				if not isaiming then 				
					Sleep(250)
				end
				if not isaiming then 				
					Sleep(250)
				end	
			end
		end
		Sleep(50)		
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
			Turn2( torso,  x_axis, 0, 20 ) 	
			isaiming = false
		end		
	end
end

function script.Create()
	isaiming = false
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( turretbase, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( turretbase, y_axis, outofground, 200 )
		EmitSfx(base,turretbaseFX)
		Sleep(100)
	end
	Move( turretbase, y_axis, 0, 1000 )
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
	return aimpoint
end

function script.AimWeapon1(heading, pitch)
	isaiming = true
	idleCount = maxIdleCount	
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( turret, y_axis, heading, 6.0 )
	Turn( torso,  x_axis, -pitch, 6.0 ) 
	WaitForTurn (turret, y_axis)
	WaitForTurn (torso, x_axis)
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