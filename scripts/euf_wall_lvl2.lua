local base = piece 'base'
local wall = piece 'wall'
local BUILDINGFX	 = 1024+0

function script.Create()
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( wall, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( wall, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( wall, y_axis, 0, 1000 )

	local x, y, z = Spring.GetUnitPosition(unitID)
	local teamID = Spring.GetUnitTeam(unitID)
	local heading = Spring.GetUnitHeading(unitID)
	
	local wall = Spring.CreateFeature("euf_wall_lvl2", x, y, z, heading, teamID)
	Spring.DestroyUnit(unitID, false, false, unitID)
end
	
function script.Killed( damage, health )
	return (1)
end