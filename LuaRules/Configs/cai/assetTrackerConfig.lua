local heatmapNames = {
	mobileAntiAir = {	},
	
	staticAntiAir = {	},
	
	mobileLand = {	},
	
	staticLand = {	},
}

local completeUnitListNames = {

	turretAA = {	},

	turret = {	},
	
	economy = {	},
	
	constructor = {	},
}

local ground = {

	raider = {	},

	assault = {	},

	skirm = {	},
	
	antiSkirm = { },

	riot = { },

	arty = { },
}

local antiAir = {
	antiAir = { },
}

local air = {
	bomber = { },
	
	gunship = { },
	
	transport = { },
}

local fighter = {
	fighter = { },
}

local economyTargetNames =  {
}

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

local function AddListNames(list, source, addMisc, addCommander)
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
	
	if addMisc then
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
	
	if addCommander then
		for defID = 1, #UnitDefs do
			local ud = UnitDefs[defID]
			if ud.customParams.dynamic_comm or ud.customParams.commtype then
				list[ud.id] = {
					name = "commander",
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

local heatmapUnitDefID = CreateHeatmapData(heatmapNames)

local completeListUnitDefID = {}
AddListNames(completeListUnitDefID, completeUnitListNames, true)

local combatListUnitDefID = {}
AddListNames(combatListUnitDefID, ground, false, true)
AddListNames(combatListUnitDefID, antiAir)
AddListNames(combatListUnitDefID, air)
AddListNames(combatListUnitDefID, fighter)

local economyTargetUnitDefID = CreateWeightedNameList(economyTargetNames)

return heatmapUnitDefID, completeListUnitDefID, combatListUnitDefID, economyTargetUnitDefID
