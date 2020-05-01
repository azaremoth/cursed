include "constants.lua"
include "common.lua"

--pieces
local base = piece "base"
local building = piece "building"
local turret = piece "turret"
local sleeve = piece "sleeve"
local barrel = piece "barrel"
local fist1 = piece 'fist1'
local fist2 = piece 'fist2'

-- emiters etc.
local emit = piece "emit"
local emit_groundflash = piece "emit_groundflash"

-- variables
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
				Turn2( turret, y_axis, math.random(360), 30 )				
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
			Turn2( sleeve,  x_axis, 0, 20 )
			isaiming = false
		end		
	end
end

function script.Create()
	if NotEnemyAI() then
		Hide(fist1)
		Hide(fist2)
	end
	isaiming = false
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( building, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( building, y_axis, outofground, 200 )
		EmitSfx(base,turretbaseFX)
		Sleep(100)
	end
	Move( building, y_axis, 0, 1000 )
	Sleep(500)
	StartThread( MotionControl )
	StartThread( RestoreAfterDelay )	
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return turret
end

function script.AimWeapon1(heading, pitch)
	isaiming = true
	idleCount = maxIdleCount	
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( turret, y_axis, heading, 2.0 )
	Turn( sleeve,  x_axis, -pitch, 1.75 ) 
	WaitForTurn (turret, y_axis)
	WaitForTurn (sleeve, x_axis)	
	return true
end

function script.FireWeapon1()
	Move(barrel, z_axis, -5)
	Move(barrel, z_axis, 0, 24)
	EmitSfx( emit, GUNFLARE )				
	EmitSfx( emit_groundflash, GROUNDFLASH )			
	return(1)
end
-----------------------------------------------------------------

function script.Killed( damage, health )
	Turn2( turret, y_axis, 0, 300 )	
	EmitSfx(base,BOOM)
	return (1)
end