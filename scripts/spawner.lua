--include "common.lua"

local function Checking()
	local x, y, z = Spring.GetUnitPosition(unitID)
	local spawnerTeam = Spring.GetUnitTeam(unitID)
	while true do
		local unitsAround = Spring.GetUnitsInSphere(x,y,z, 450)
		for _,aUnitID in ipairs(unitsAround) do
			local aLocalteam = Spring.GetUnitTeam(aUnitID)
			local aAi = select(4, Spring.GetTeamInfo(aLocalteam))		
			if (not aAi) and (aLocalteam ~= spawnerTeam) and not Spring.AreTeamsAllied(aLocalteam, spawnerTeam) then
				local zero = Spring.CreateUnit("tc_ghoul", x-30,y,z+10, math.random(3), spawnerTeam)
				local one = Spring.CreateUnit("tc_ghoul", x+10,y,z-20, math.random(3), spawnerTeam)
				local two = Spring.CreateUnit("tc_ghoul", x+20,y,z+10, math.random(3), spawnerTeam)				
			end
		end
		Sleep(1000)
	end
end

function script.Create( )
	StartThread(Checking)
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	Spring.SetUnitCloak(unitID, 2, 0)	
end

function script.Killed()
	--return 0
end