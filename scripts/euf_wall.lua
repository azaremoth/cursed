local base = piece 'base'
local sperre = piece 'sperre'
local wirre = piece 'wirre'
local BUILDINGFX	 = 1024+0

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(sperre,BUILDINGFX)
			Sleep(10)
	end

	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = math.random(3)
	local randomnumber  = math.random(3)	
	local newteeth
	local team = Spring.GetUnitTeam(unitID)

		if (randomnumber < 2 ) then
			newteeth = Spring.CreateUnit("euf_wall_rotated", x, y, z, heading, team)
		end

		if (randomnumber >= 2 ) then
			newteeth = Spring.CreateUnit("euf_wall_rotated2", x, y, z, heading, team)
		end
	
end
	
function script.Killed( damage, health )
	return (1)
end