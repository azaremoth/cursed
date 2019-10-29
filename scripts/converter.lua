--include "common.lua"
local radius = tonumber(UnitDefs[unitDefID].customParams.converterradius) or 300

local function Checking()
	local x, y, z = Spring.GetUnitPosition(unitID)
	local converterTeam = Spring.GetUnitTeam(unitID)
	while true do
		local unitsAround = Spring.GetUnitsInSphere(x,y,z, 300)
		for _,aUnitID in ipairs(unitsAround) do
			local aLocalteam = Spring.GetUnitTeam(aUnitID)
			local aAi = select(4, Spring.GetTeamInfo(aLocalteam))		
			if (not aAi) and (aLocalteam ~= converterTeam) and Spring.AreTeamsAllied(aLocalteam, converterTeam) then
				for _,eUnitID in ipairs(unitsAround) do
					local eTeam = Spring.GetUnitTeam(eUnitID)
					if (eUnitID ~= unitID) and (eTeam == converterTeam) then
						local lx, ly, lz = Spring.GetUnitPosition(eUnitID)
						Spring.SpawnCEG('SCORPION_CEG', lx, ly, lz)						
						Spring.TransferUnit(eUnitID,aLocalteam)
					end
				end
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