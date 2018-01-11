
local subnameMap = {
	{"Skirmish AI", "AI: Skirmish"},
	{"Zombie Survival: Very Easy", "ZI: Beginner"},
	{"Zombie Survival: Easy", "ZI: Novice"},
	{"Zombie Survival: Normal", "ZI: Normal"},
	{"Zombie Survival: Hard", "ZI: Hard"},
	{"Zombie Survival: Suicidal", "ZI: Deadly"},
}



local function GetAiSimpleName(name)
	if name == "Null AI" then
		return "Inactive AI"
	end
	if string.find(name, "Zombie") then
		return name
	end
	for i = 1, #subnameMap do
		if string.find(name, subnameMap[i][1]) then
			return subnameMap[i][2]
		end
	end
	return false
end

local simpleAiOrder = {
	["Skirmish AI"] = 0,
	["Zombie Survival: Very Easy"] = 1,
	["Zombie Survival: Easy"] = 2,
	["Zombie Survival: Normal"] = 3,
	["Zombie Survival: Hard"] = 4,
	["Zombie Survival: Suicidal"] = 5,
}

local aiTooltip = {
	["Skirmish AI"] = "Recommended for experienced strategy gamers with some experience of streaming economy.",
	["Zombie Survival: Very Easy"] = "Defeat waves of zombies easily.",
	["Zombie Survival: Easy"] = "Defeat waves of zombies.",
	["Zombie Survival: Normal"] = "Defeat waves of zombies.",
	["Zombie Survival: Hard"] = "Try to survive some waves of zombies.",
	["Zombie Survival: Suicidal"] = "Learn to suffer while being crushed by waves of zombies.",
}

return {
	GetAiSimpleName = GetAiSimpleName,
	simpleAiOrder = simpleAiOrder,
	aiTooltip = aiTooltip
}
