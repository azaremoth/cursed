function gadget:GetInfo()
  return {
    name      = "Kill Stragglers",
    desc      = "Kills remaining AI units after base destruction",
    author    = "aZaremoth",
    date      = "2012-18-11",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

if gadgetHandler:IsSyncedCode() then

local killstragglers = Spring.GetModOptions().killstragglers
	
if (killstragglers == "1") then

	local NonChickenAITeams = {}
	local AIbuildings = {}
	local AIalive = {}
	local gamestarted = false

	ChickenAIs = 
	{
		["Zombie Survival: Very Easy"] = true,
		["Zombie Survival: Easy"] = true,	
		["Zombie Survival: Normal"] = true,	
		["Zombie Survival: Hard"] = true,
		["Zombie Survival: Suicidal"] = true,
		["Zombie Survival: Custom"] = true,
	}

	function gadget:GameStart()
		local teams = Spring.GetTeamList()
		for i = 1,#teams do
			local teamID = teams[i]
			local ai = select(4, Spring.GetTeamInfo(teamID))
			if ai then
				AIbuildings[teamID] = 0	
				AIalive[teamID] = true	
				local ischickenai = ChickenAIs[Spring.GetTeamLuaAI(teamID)]
				if not ischickenai then
					NonChickenAITeams[teamID] = true
					Spring.Echo("Found an AI player")
				end
			end			
		end	
	end

	function gadget:UnitCreated(unitID, unitDefID, teamID)
		if (NonChickenAITeams[teamID]) then
			local unitspeed = UnitDefs[unitDefID].speed
			if (unitspeed == nil or unitspeed == 0) then
				AIbuildings[teamID] = (AIbuildings[teamID]+1)
--				Spring.Echo("AI: " .. teamID .. " has buildings: " .. AIbuildings[teamID])
			end
		end
	end

	function gadget:GameFrame(f)
		if (f > 3600) then
			gamestarted = true
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, teamID)
		if (NonChickenAITeams[teamID]) then
			local unitspeed = UnitDefs[unitDefID].speed
			if (unitspeed == nil or unitspeed == 0) then
				AIbuildings[teamID] = (AIbuildings[teamID]-1)
--				Spring.Echo("AI " .. teamID .. " has buildings: " .. AIbuildings[teamID])
			end
			if (AIbuildings[teamID] < 1 and AIalive[teamID] and gamestarted == true) then
				AIalive[teamID] = false
				for _,loopunitID in ipairs(Spring.GetTeamUnits(teamID)) do
					if (loopunitID ~= unitID) then
						Spring.DestroyUnit(loopunitID, false, false)
            			Spring.Echo("Remaining units of AI " .. teamID .. " were destroyed!")						
					end
				end			
			end
		end
	end

end

----- SYNCED -----
-------------------------------------
else
-------------------------------------
----- UNSYNCED -----


----- UNSYNCED -----
-------------------------------------
end


