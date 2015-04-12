--pieces
local base = piece "base"
local building = piece "building"
local turret = piece "turret"
local rotator = piece "rotator"
local gun = piece "gun"
local horns = piece "horns"

-- emiters etc.
local emit = piece "emit"

--signals
local SIG_AIM1 = 2

--FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local GUNFLARE	 = 1026+0

function script.Activate ( )
end

function script.Deactivate ( )
end

function script.Create()
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( building, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( building, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( building, y_axis, 0, 1000 )
	Sleep(500)
end


--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return rotator
end

function script.AimWeapon1(heading, pitch)
--	Spring.Echo(pitch)
--	if pitch < 0.25 then
--		return false
--	end
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( turret, y_axis, heading, 0.6 )
	Turn( rotator,  x_axis, -pitch, 0.4 ) 
	WaitForTurn (turret, y_axis)
	WaitForTurn (rotator, x_axis)

	return true
end

function script.FireWeapon1()
	Move(gun, z_axis, -15)
	Move(gun, z_axis, 0, 12)
	EmitSfx( emit, GUNFLARE )
	Sleep(50)
	return(1)
end
-----------------------------------------------------------------

function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end