local base = piece 'base'
local sperre = piece 'sperre'
local BUILDINGFX	 = 1024+0

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(sperre,BUILDINGFX)
			Sleep(10)
	end

	local x, y, z = Spring.GetUnitPosition(unitID)
	local randomnumber  = math.random()	
	local team = Spring.GetUnitTeam(unitID)

		if (randomnumber < 0.33 ) then
			local wall1 = Spring.CreateFeature("euf_wall_lvl1_1", x, y, z, math.random(0, 3), team)
		elseif (randomnumber > 0.66 ) then
			local wall2 = Spring.CreateFeature("euf_wall_lvl1_2", x, y, z, math.random(0, 3), team)
		else
			local wall3 = Spring.CreateFeature("euf_wall_lvl1_3", x, y, z, math.random(0, 3), team)	
		end
end
	
function script.Killed( damage, health )
	return (1)
end