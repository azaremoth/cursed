function gadget:GetInfo()
	return {
		name = "Modoptions",
		desc = "Loads standard mod options (non-lobby start) and assigns faction",
		author = "aZaremoth, sprunk",
		date = "2018-07-31",
		license = "Public Domain",
		layer = -math.huge,
		enabled = true
	}
end

local Gaia = Spring.GetGaiaTeamID()
local modOptions = Spring.GetModOptions()
local campaignBattleID = Spring.GetModOptions().singleplayercampaignbattleid

GG.teamside = GG.teamside or {}

do
	local teams = Spring.GetTeamList()
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= Gaia) then
			local side = select(5, Spring.GetTeamInfo(teamID))
			if (side ~= "imperials" and side ~= "cursed") then
				if (math.random() > 0.5) then
					side = "imperials"
				else
					side = "cursed"
				end
			end
			GG.teamside[teamID] = side
			-- Spring.SetTeamRulesParam(teamID, "side", side, {allied=true, public=false}) -- visible to allies only, set visible to all on GameStart
		end
	end	
end

do
	local fileMO = VFS.Include("modoptions.lua")
	Spring.Echo("MODOPTIONS LOADED")
	for i = 1, #fileMO do
		local modopt = fileMO[i]
		-- Spring.Echo(modopt.key)
		if not modOptions[modopt.key] then
			modOptions[modopt.key] = modopt.def
		end
	end
end

Spring.GetModOptions = function ()
    return modOptions
end

