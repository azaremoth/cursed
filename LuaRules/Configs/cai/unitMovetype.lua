local staticUnits = {}
local movetypeDefID = {}

local movetypes = {
	{name = "bot", movedef = "WALKER3X3"},
	{name = "amph", movedef = "TANK2X2_AMP"},
	{name = "spider", movedef = "CLIMBER3X3"},
	{name = "veh", movedef = "TANK3X3"},
	{name = "hover", movedef = "TANKHOVER3x3"},
	{name = "air", movedef = false},
	{name = "sea", movedef = "BOAT3x3"},
	{name = "static", movedef = false},
}

local movedefMap = {
	["WALKER2X2"] = "bot",
	["WALKER3X3"] = "bot",
	["HEAVYWALKER2X2"] = "bot",
	["ULTRAHEAVYWALKER4X4"] = "bot",
	["MEGAHEAVYWALKER4X4"] = "bot",	
	["Trooper1X1"] = "bot",
	["Trooper2X2"] = "bot",	
	["Trooper3X3"] = "bot",	
	["SubTrooper2X2"] = "amph",
	["CLIMBER3X3"] = "spider",
	["SUBTERRAIN"] = "spider",	
	["TANK2X2"] = "veh",
	["TANK3X3"] = "veh",
	["TANK4X4"] = "veh",
	["LIGHTTANK3X3"] = "veh",	
	["SMALLHOVER2x2"] = "hover",
	["TANKHOVER3x3"] = "hover",
	["TANK2X2_AMP"] = "amph",
	["BOAT3x3"] = "sea",
}

for i = 1, #UnitDefs do
	local ud = UnitDefs[i]
	if ud.isImmobile then
		staticUnits[i] = true
		movetypeDefID[i] = "static"
	else
		if ud.moveDef then
			if ud.moveDef.name and movedefMap[ud.moveDef.name] then
				movetypeDefID[i] = movedefMap[ud.moveDef.name]
			else
				movetypeDefID[i] = "air"
			end
		end
	end
end

return staticUnits, movetypeDefID, movetypes
