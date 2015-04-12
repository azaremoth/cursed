local assaultgroup = {
	"tc_ghoul",
	"tc_gunner",
	"tc_enforcer",
	"tc_mage",	
	"tc_mancubus",		
	"tc_belial",
	"tc_crawler",	
	"tc_rictus",	
	"euf_pyro",	
	"euf_marine",
	"euf_pyro",	
	"euf_sniper_ai",
	"euf_tank",
	"euf_aatank",
	"euf_scorpion",	
	"euf_hover",	
}	

local raider = {
	"tc_ghoul",
	"tc_skeleton",
	"euf_raider",	
	"euf_marine",
	"euf_paladin_ai",
}


local jumper = { -- uses jump for offense. IE do not put commander or AA here.
	"euf_pyro",
	"tc_ghoul",
	"tc_mage",	
}

local arty = {
	"tc_enforcer",
	"euf_bazooka",
	"tc_purgatory_ai",
	"euf_mlrs_ai",	
}

local counteredByAssaults = {
	"tc_enforcer",
	"euf_bazooka",
	"tc_purgatory_ai",
	"euf_mlrs_ai",	
}

local prioritySos = {
	"tc_pyramid_ai",
	"euf_barracks_ai",
}
	

local riot = assaultgroup
local assault = assaultgroup
local skirm = assaultgroup

--global versions
raiderArray = {}
assaultArray = {}
jumperArray = {}
skirmArray = {}
riotArray = {}
artyArray = {}
counteredByAssaultsArray = {}
prioritySosArray = {}

local function CreateArray(source, target)
	for i=1, #source do
		local def = UnitDefNames[source[i]]
		if def then target[def.id] = true end
	end
end

CreateArray(raider, raiderArray)
CreateArray(assault, assaultArray)
CreateArray(jumper, jumperArray)
CreateArray(skirm, skirmArray)
CreateArray(riot, riotArray)
CreateArray(arty, artyArray)
CreateArray(counteredByAssaults, counteredByAssaultsArray)
CreateArray(prioritySos, prioritySosArray)
