function gadget:GetInfo()
	return {
		name = "Faction control",
		desc = "Assigns faction",
		author = "aZaremoth",
		date = "2019-03-28",
		license = "Public Domain",
		layer = -math.huge,
		enabled = true
	}
end

-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end

local Gaia = Spring.GetGaiaTeamID()
local campaignBattleID = Spring.GetModOptions().singleplayercampaignbattleid
GG.teamside = GG.teamside or {}

function gadget:Initialize()
	local teams = Spring.GetTeamList()
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= Gaia) then
			local side = select(5, Spring.GetTeamInfo(teamID))
			if campaignBattleID then 
				side = "imperials"
			else
				if (side ~= "imperials") and (side ~= "cursed") then
					if (math.random() > 0.5) then
						side = "imperials"
					else
						side = "cursed"
					end
				end
			end
			GG.teamside[teamID] = side
			Spring.Echo("Team " .. teamID .. " plays as faction " .. side)
			Spring.SetTeamRulesParam(teamID, "side", side, {allied=true, public=false}) -- visible to allies only, set visible to all on GameStart
		end
	end	
end
