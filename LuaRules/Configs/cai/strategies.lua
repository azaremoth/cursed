local function noFunc()
end

-- these buildTaskMods function by editing the config supplied as the arg

--[[local function BuildTasksMod_Blitz(buildConfig)
	local factory = buildConfig.robots.factoryByDefId
	factory[UnitDefNames['factorycloak'].id].importance = 1.1
	factory[UnitDefNames['factoryshield'].id].importance = 0.9
	factory[UnitDefNames['factoryveh'].id].importance = 1.2
	factory[UnitDefNames['factoryhover'].id].importance = 1.2
	factory[UnitDefNames['factoryspider'].id].importance = 0.8
	factory[UnitDefNames['factoryjump'].id].importance = 0.8
	for fac, data in pairs(factory) do
		if not data.airFactory then
			data[3].importanceMult = data[3].importanceMult*1.2 -- more raiders
			data[4].importanceMult = data[4].importanceMult*0.8 -- fewer arty
			data[5].importanceMult = data[5].importanceMult*1.15 -- more assaults
			data[6].importanceMult = data[6].importanceMult*0.9 -- fewer skirms
			data[7].importanceMult = data[7].importanceMult*0.9 -- fewer riots
		end
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 0.8
			data.airDefenceQuota[i] = data.airDefenceQuota[i] * 0.9
		end
	end
	local econ = buildConfig.robots.econByDefId
	for econBldg, data in pairs(econ) do
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 0.8
			data.airDefenceQuota[i] = data.airDefenceQuota[i] * 0.9
		end
	end
end

local function BuildTasksMod_Pusher(buildConfig)
	local factory = buildConfig.robots.factoryByDefId
	factory[UnitDefNames['factoryshield'].id].importance = 1.1
	factory[UnitDefNames['factoryhover'].id].importance = 0.9
	factory[UnitDefNames['factoryspider'].id].importance = 0.9
	factory[UnitDefNames['factorytank'].id].importance = 1.1
	for fac, data in pairs(factory) do
		if not data.airFactory then
			data[3].importanceMult = data[3].importanceMult*0.9 -- fewer raiders
			data[4].importanceMult = data[4].importanceMult*1.1 -- more arty
			data[6].importanceMult = data[6].importanceMult*1.2 -- more skirms
			data[7].importanceMult = data[7].importanceMult*1.1 -- more riots
		end
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 0.9
		end
	end
	local econ = buildConfig.robots.econByDefId
	for econBldg, data in pairs(econ) do
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 0.9
		end
	end
end

local function BuildTasksMod_Defensive(buildConfig)
	local factory = buildConfig.robots.factoryByDefId
	factory[UnitDefNames['factorycloak'].id].importance = 0.9
	factory[UnitDefNames['factoryshield'].id].importance = 1.1
	factory[UnitDefNames['factoryveh'].id].importance = 1.1
	factory[UnitDefNames['factoryhover'].id].importance = 0.8
	factory[UnitDefNames['factoryspider'].id].importance = 0.8
	factory[UnitDefNames['factoryjump'].id].importance = 1.1
	factory[UnitDefNames['factorytank'].id].importance = 1.1
	for fac, data in pairs(factory) do
		if not data.airFactory then
			data[3].importanceMult = data[3].importanceMult*0.8 -- fewer raiders
			data[4].importanceMult = data[4].importanceMult*0.9 -- less arty
			data[5].importanceMult = data[5].importanceMult*0.9 -- fewer assaults
			data[6].importanceMult = data[6].importanceMult*1.1 -- more skirms
			data[7].importanceMult = data[7].importanceMult*1.2 -- more riots
		end
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 1.2
			data.airDefenceQuota[i] = data.airDefenceQuota[i] * 1.2
		end
	end
	local econ = buildConfig.robots.econByDefId
	for econBldg, data in pairs(econ) do
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 1.2
			data.airDefenceQuota[i] = data.airDefenceQuota[i] * 1.2
		end
	end
end

local function BuildTasksMod_Lolz(buildConfig)
	local factory = buildConfig.robots.factoryByDefId
	factory[UnitDefNames['factorycloak'].id].importance = 0
	factory[UnitDefNames['factoryshield'].id].importance = 0
	factory[UnitDefNames['factoryveh'].id].importance = 0
	factory[UnitDefNames['factoryhover'].id].importance = 0
	factory[UnitDefNames['factoryspider'].id].importance = 0
	factory[UnitDefNames['factoryjump'].id].importance = 1
	factory[UnitDefNames['factorytank'].id].importance = 0
	
	factory[UnitDefNames['factoryjump'].id].minFacCount = 0
	
	for fac, data in pairs(factory) do
		if not data.airFactory then
			--data[3].importanceMult = data[3].importanceMult*0.8 -- fewer raiders
			--data[4].importanceMult = data[4].importanceMult*0.9 -- less arty
			--data[5].importanceMult = data[5].importanceMult*0.9 -- fewer assaults
			data[6].importanceMult = data[6].importanceMult*5 -- more moderators!!!
			--data[7].importanceMult = data[7].importanceMult*1.2 -- more riots
		end
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i]
			data.airDefenceQuota[i] = data.airDefenceQuota[i]
		end
	end
	local econ = buildConfig.robots.econByDefId
	for econBldg, data in pairs(econ) do
		for i=1,3 do
			data.defenceQuota[i] = data.defenceQuota[i] * 1.2
			data.airDefenceQuota[i] = data.airDefenceQuota[i] * 1.2
		end
	end
end]]--

strategies = {
	[1] = {	-- standard
		name = "Standard",
		chance	= 1,
		commanders = {
			count = 0,
		},
		buildTasksMods = noFunc,
		conAndEconHandlerMods = {},
	},
}

local function SelectComm(player, team, strat)
	local count = strategies[strat].commanders.count
	local rand = math.random()
	
	local commName
	local total = 0
	for i = 1, count do
		total = total + strategies[strat].commanders[i].chance
		if rand < total then
			commName = strategies[strat].commanders[i].ID
			GG.SetFaction(commName, player, team)
			Spring.Echo("CAI: team "..team.." has selected strategy: "..strategies[strat].name..", using commander "..commName)
			break
		end
	end
end

function SelectRandomStrat(player, team)
	local count = #strategies
	local rand = math.random()
	
	local stratIndex = 1
	local total = 0
	for i = 1, count do
		total = total + strategies[i].chance
		if rand < total then
			SelectComm(player, team, i)
			stratIndex = i
			break
		end
	end
	
	return stratIndex
end