local base = piece 'base'
local building = piece 'building'
local radar = piece 'radar'
local pont_dark = piece 'pont_dark'
local pont_glow = piece 'pont_glow'
local emit_beam = piece 'emit_beam'
local top_nuke = piece 'top_nuke'
local ring1 = piece 'ring1'
local ring2 = piece 'ring2'
local ring3 = piece 'ring3'
local ring4 = piece 'ring4'


local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0

function script.Create()
	Hide (pont_glow)

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
	Spring.UnitScript.Spin ( radar, y_axis, 2)
	Spring.UnitScript.Spin ( ring1, y_axis, 1)
	Spring.UnitScript.Spin ( ring2, y_axis, -1)
	Spring.UnitScript.Spin ( ring3, y_axis, 1)
	Spring.UnitScript.Spin ( ring4, y_axis, -1)
	
--	Spring.SetUnitWeaponState(unitID, 0, "reloadState", 0)
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit_beam
end

function script.AimFromWeapon1 ()
	return radar	
end

function script.AimWeapon1(heading, pitch)
    return (1)
end

function script.Shot1()
	return (0)
end

function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end