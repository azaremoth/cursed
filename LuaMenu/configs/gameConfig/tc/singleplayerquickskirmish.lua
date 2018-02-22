local skirmishSetupData = {
	pages = {
		{
			humanName = "Select Game Type",
			name = "gameType",
			options = {
				"1v1",
				"2v2",
				"3v3",
				"Survival",
			},
		},
		{
			humanName = "Select Map",
			name = "map",
			minimap = true,
			options = {
				"Barren 2",
			},
		},
	},
}

local chickenDifficulty = {
	"Chicken: Beginner",
	"Chicken: Very Easy",
	"Chicken: Easy",
	"Chicken: Normal",
	"Chicken: Hard",
	"Chicken: Suicidal",
}


function skirmishSetupData.ApplyFunction(battleLobby, pageChoices)
	local difficulty = pageChoices.difficulty or 2 -- easy is default
	local gameType = pageChoices.gameType or 1
	local map = pageChoices.map or 1
	
	local Configuration = WG.Chobby.Configuration
	local pageConfig = skirmishSetupData.pages
	battleLobby:SelectMap(pageConfig[3].options[map])
	
	battleLobby:SetBattleStatus({
		allyNumber = 0,
		isSpectator = false,
	})
	
	-- Chickens
	if gameType == 4 then
		battleLobby:AddAi(chickenDifficulty[difficulty], chickenDifficulty[difficulty], 1)
		return
	end
	
	local bitAppend = (Configuration:GetIsRunning64Bit() and "64") or "32"
	local aiName = "Skirmish AI"
	local displayName = aiName
	
	if Configuration.gameConfig.GetAiSimpleName then
		local betterName = Configuration.gameConfig.GetAiSimpleName(displayName)
		if betterName then
			displayName = betterName
		end
	end
	
	-- AI game
	local aiNumber = 1
	local allies = gameType - 1
	for i = 1, allies do
		battleLobby:AddAi(displayName .. " (" .. aiNumber .. ")", aiName, 0, Configuration.gameConfig.aiVersion)
		aiNumber = aiNumber + 1
	end
	
	local enemies = gameType
	for i = 1, enemies do
		battleLobby:AddAi(displayName .. " (" .. aiNumber .. ")", aiName, 1, Configuration.gameConfig.aiVersion)
		aiNumber = aiNumber + 1
	end
end

return skirmishSetupData
