
local completeUnitListNames = {

	turretAA = {
		"tc_defender",
		"euf_aatower",
	},

	turret = {
		"tc_defender",
		"tc_tower",
		"tc_hellfire",		
		"euf_plasmatower",
		"euf_lasertower",
		"euf_artytower",		
	},
	
	economy = {
		"euf_metalextractor_lvl1",
		"euf_metalextractor_lvl2",
		"tc_metalextractor_lvl1",
		"tc_metalextractor_lvl2",
	},
	
	constructor = {
		"tc_restless",
		"tc_lich_ai",
		"euf_constructor_ai",
		"euf_constructor_lvl2_ai",		
	},
}

local ground = {

	raider = {
		"tc_ghoul",
		"tc_skeleton",
		"euf_marine",
		"euf_pyro",
	},

	assault = {
		"euf_marine",
		"tc_gunner",
		"euf_walker",
		"tc_belial",
	},

	skirm = {
		"euf_sniper_ai",
		"euf_hover",		
		"tc_enforcer",
		"tc_mage",
		"tc_witch",		
		"tc_agares",		
	},
	
	antiSkirm = {
		"euf_pyro",
		"tc_ghoul",		
	},

	riot = {
		"euf_tank",	
		"tc_mancubus",
		"bug_med_undead",
		"bug_big_undead",
	},

	arty = {
		"euf_bazooka",
		"euf_mlrs_ai",
		"tc_bonebeast",	
		"tc_purgatory_ai",		
	},
}

local antiAir = {
	antiAir = {
		"euf_marine",
		"euf_aatank",		
		"tc_mage",
		"tc_crawler",		
	},
}

local air = {
	bomber = {
		"euf_bomber",
		"tc_acranius",
	},
	
	gunship = {
		"euf_scout",
		"euf_angel",			
		"tc_dragon",		
		"tc_cacodemon",		
		"tc_redeemer",
		"tc_sledgehammer",
	},
	
	transport = {
		"euf_transport",
	},
}

local fighter = {
	fighter = {
		"euf_interceptor",
		"tc_blade",	
	},
}

local defenseRequirementNames =  { }

local function FlattenTableInto(tableToFlatten, category, otherTable)
	for _, namesList in pairs(tableToFlatten) do
		otherTable[category] = {}
		for i = 1, #namesList do
			otherTable[category][i] = namesList[i]
		end
	end
end

FlattenTableInto(ground, "ground", completeUnitListNames)
FlattenTableInto(antiAir, "antiAir", completeUnitListNames)
FlattenTableInto(air, "air", completeUnitListNames)
FlattenTableInto(fighter, "fighter", completeUnitListNames)

local getMovetype = Spring.Utilities.getMovetype

local function AddListNames(list, source)
	for category, namesList in pairs(source) do
		for i = 1, #namesList do
			local defName = namesList[i]
			local ud = UnitDefNames[defName]
			if ud then
				list[ud.id] = {
					name = category,
					cost = ud.metalCost,
				}
			end
		end
	end
	
	for defID = 1, #UnitDefs do
		if not list[defID] then
			local ud = UnitDefs[defID]
			
			local moveType = getMovetype(ud)
			if moveType then
				list[ud.id] = {
					name = "miscUnit",
					cost = ud.metalCost,
				}
			else
				list[ud.id] = {
					name = "miscStructure",
					cost = ud.metalCost,
				}
			end
		end
	end
end

local function CreateHeatmapData(source)
	local retList = {}
	for category, namesList in pairs(source) do
		for defName, data in pairs(namesList) do
			local ud = UnitDefNames[defName]
			if ud then
				local weaponRange = (data.range or ud.maxWeaponRange) + 50
				local finalData = {
					name = category,
					radius = weaponRange,
					amount = ud.metalCost*data.mult,
				}
				if retList[ud.id] then
					retList[ud.id][#retList[ud.id]] = finalData
				else
					retList[ud.id] = {
						[1] = finalData,
					}
				end
			end
		end
	end
	return retList
end

local function CreateWeightedNameList(source)
	local retList = {}
	for defName, data in pairs(source) do
		local ud = UnitDefNames[defName]
		if ud then
			local weaponRange = (data.range or ud.maxWeaponRange) + 50
			local finalData = {
				name = category,
				radius = weaponRange,
				amount = ud.metalCost*data.mult,
			}
			if retList[ud.id] then
				retList[ud.id][#retList[ud.id]] = finalData
			else
				retList[ud.id] = {
					[1] = finalData,
				}
			end
		end
	end
	return retList
end

local completeListUnitDefID = {}
AddListNames(completeListUnitDefID, completeUnitListNames)


local defenseRequirementUnitDefID = CreateWeightedNameList(defenseRequirementNames)

return defenseRequirementUnitDefID, completeListUnitDefID
