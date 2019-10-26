--include "common.lua"
local spawnunitcount = tonumber(UnitDefs[unitDefID].customParams.spawnunitcount) or 5
local radius = tonumber(UnitDefs[unitDefID].customParams.spawnradius) or 450
local spawnunit = UnitDefs[unitDefID].customParams.spawnunit or "tc_ghoul"

local x, y, z = Spring.GetUnitPosition(unitID)
local spawnerTeam = Spring.GetUnitTeam(unitID)

local function Checking()
	while true do
		local unitsAround = Spring.GetUnitsInSphere(x,y,z, radius)
		for _,aUnitID in ipairs(unitsAround) do
			local aLocalteam = Spring.GetUnitTeam(aUnitID)
			local aAi = select(4, Spring.GetTeamInfo(aLocalteam))		
			if (not aAi) and (aLocalteam ~= spawnerTeam) and not Spring.AreTeamsAllied(aLocalteam, spawnerTeam) then
				Spring.DestroyUnit(unitID,false,false)
			end
		end
		Sleep(1000)
	end
end

local function Spawning()
	Sleep(50)
	for i = 1,spawnunitcount do
		local spawnunit = Spring.CreateUnit(spawnunit, x-(i*10),y,z+(i*10), math.random(3), spawnerTeam)	
	end
end

function script.Create( )
	StartThread(Checking)
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	Spring.SetUnitCloak(unitID, 2, 0)	
end

function script.Killed()
	Spawning()
	--return 0
end