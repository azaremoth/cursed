local THRESHOLD_EXPENSIVE = 800

--seconds
TIMER_EXPENSIVE_UNITS = 60 * 10
TIMER_ADV_FACTORY = 60 * 15
TIMER_SUPERWEAPON = 60 * 30

stringExpensiveUnits = "That <name> is particularly expensive; at this point, cheaper units offer far more flexibility. You should probably save that for later."
stringAdvFactory = "That <name> is difficult to use and inflexible early game; you should start with a more basic factory."
stringSuperweapon = "Superweapons such as that <name> are meant for resolving late-game stalemates when no other options remain. This is NOT the time to be building one!"

stringAirSpotted = "\255\255\0\0Enemy aircraft spotted.\008 Now might be a good time to invest in some anti-air."
stringNukeSpotted = "\255\255\0\0Enemy nuclear silo located.\008 Build an anti-nuke launcher while you still can."

generalTips = {
	"Use the priority buttons to maximize your efficiency during stalls (expenditure outstripping income). Resources will be allocated to high priority units before low priority ones.",
	"Repairing units is faster than building them.",
	"When fighting AoE weapons, spread out your units to minimize damage.",
	"You can draw on the map with tilde (~) and left mouse. ~ + double click adds a labelled point, while ~ + middle click adds a point without label. ~ + right click erases.",
	"Many commands can be issued over a whole area by keeping button the down and dragging a box or disc.",
	"Space-clicking on a unit or its build button in the menu brings up the \255\255\64\0Context Menu\008, where you can view detailed unit data.",
}

unitTips = {
--[[	corclog = {"The \255\255\64\0Dirtbag\008 leaves a mound of earth when it dies, obstructing units (especially vehicles) and weapons.", 3, 5},
	capturecar = {"The \255\255\64\0Dominatrix\008 capture vehicle can capture enemy units (with a 5 second cooldown between captures), but control is lost if the capturing Dominatrix dies.", 3, 5},
	armcrabe = {"The \255\255\64\0Crabe\008 outranges basic defenses. It curls up into armored form when stationary, becoming a formidable defense turret.", 3, 5},
	firewalker = {"The \255\255\64\0Firewalker\008 creates large clouds of fire which can seriously harm units - friend or foe - standing in them.", 3, 5},
	
	tawf114 = {"The \255\255\64\0Banisher\008 packs a punch against groups of small units, but can be easily rushed - make sure to screen it.", 3, 4},]]--
}

raiderDefs = {
	"tc_ghoul",
	"tc_skeleton",
}

assaultDefs = {
	"euf_tank",
	"euf_walker",
	"tc_mancubus",
	"tc_belial",	
}

skirmDefs = {
	"euf_tank",
	"tc_mancubus",
}

riotDefs = {
	"euf_marine",
}

artyDefs = {
	"tc_bonebeast",
	"euf_bazooka",
	"tc_purgatory",
	"euf_mlrs",	
}

bomberDefs = {
	"tc_acranisu",
	"euf_bomber",
}

conDefs = {}

mexDefs = {
	"tc_metalextractor_lvl1",
	"tc_metalextractor_lvl2",
	"euf_metalextractor_lvl1",
	"euf_metalextractor_lvl2",		
}

energyDefs = {
	"euf_solar",
	"euf_powerplant",
	"tc_soulstone",
	"tc_soulcage",
}

factoryDefs = {
	"euf_barracks",
	"tc_pyramid",	
	}

advFactoryDefs = {
	"euf_factory",
	"tc_damnedportal",	
}

airFactoryDefs = {
	"euf_airport",
	"tc_darkassembler",
	"tc_darkassembler_lvl2",	
}

superweaponDefs = {}

for name in pairs(UnitDefNames) do
	if string.find(name, "factory") then factoryDefs[#factoryDefs+1] = name end
end

--unitDefID-indexed versions
raider = {}
assault = {}
skirm = {}
riot = {}
arty = {}
bomber = {}
con = {}
mex = {}
energy = {}
factory = {}
commander = {}
expensive_unit = {}
adv_factory = {}
air_factory = {}
superweapon = {}

for i=1,#UnitDefs do
	if UnitDefs[i].isCommander then commander[i]=true
	elseif UnitDefs[i].metalCost > THRESHOLD_EXPENSIVE then expensive_unit[i] = true end
end

local function CreateArray(source, target)
	for i=1, #source do
		local def = UnitDefNames[source[i]]
		if def then target[def.id] = true end
	end
end

CreateArray(raiderDefs, raider)
CreateArray(assaultDefs, assault)
CreateArray(skirmDefs, skirm)
CreateArray(riotDefs, riot)
CreateArray(artyDefs, arty)
CreateArray(bomberDefs, bomber)
CreateArray(conDefs, con)

CreateArray(mexDefs, mex)
CreateArray(energyDefs, energy)
CreateArray(factoryDefs, factory)
CreateArray(advFactoryDefs, adv_factory)
CreateArray(airFactoryDefs, air_factory)
CreateArray(superweaponDefs, superweapon)
