local base = piece 'base'
local monolith_1 = piece 'monolith_1'
local monolith_2 = piece 'monolith_2'
local monolith_3 = piece 'monolith_3'
local monolith_4 = piece 'monolith_4'
local monolith_5 = piece 'monolith_5'

local BUILDINGFX	 = 1024+0

function script.Create()
	Hide (monolith_1)
	Hide (monolith_2)
	Hide (monolith_3)
	Hide (monolith_4)
	Hide (monolith_5)	
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(monolith_3,BUILDINGFX)
			Sleep(10)
	end

	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitHeading(unitID)
	local teamID = Spring.GetUnitTeam(unitID)	
	local randomnumber  = math.random(4)
	local randomnumber2  = math.random(4)

	if (randomnumber2 < 3 ) then
		if (heading < 16000 ) then
			heading = heading+32767
		elseif (heading == 32767 ) then
			heading = 0
		else
			heading = heading*-1
		end
	end

	if (randomnumber < 3 ) then
			local newFeatureID = Spring.CreateFeature('tc_wall_lvl2_1', x, y, z, heading, teamID)	
	else	
			local newFeatureID = Spring.CreateFeature('tc_wall_lvl2_2', x, y, z, heading, teamID)
	end
	Spring.DestroyUnit(unitID, false, false, unitID)
end
	
function script.Killed( damage, health )
	return (1)
end