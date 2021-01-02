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

local modOptions = Spring.GetModOptions()
local campaignBattleID = modOptions.singleplayercampaignbattleid
local killstragglers = Spring.GetModOptions().killstragglers
if (killstragglers == nil) then -- set active by default if no modoptions are available
	if campaignBattleID then
		killstragglers = "0"
	else
		killstragglers = "1"
	end
end
	
local kothisactive = false

if Spring.GetModOptions()["koth"] ~=nil then
	if (tonumber(Spring.GetModOptions()["koth"]) > 0) then
		kothisactive = true
		Spring.Echo("The Kill Stragglers function is not available for the KOTH game mode.")
	end
end	


if (killstragglers == "1" and kothisactive == false) then
	
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

	function gadget:Initialize()
		GG.delayeddeathlist = GG.delayeddeathlist or {}
	end

	
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
		if (gamestarted == false and f > 3600) then
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
					if (loopunitID ~= unitID) and (loopunitID ~= nil) then
						GG.delayeddeathlist[loopunitID] = Spring.GetGameFrame()+math.random(30)
						-- Spring.DestroyUnit(loopunitID, false, false, loopunitID) -- recursion?! Maybe just because of cheating?  				
					end
				end
				Spring.Echo("Remaining units of AI " .. teamID .. " were destroyed!")						
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


