local assaultgroup = {
	"tc_shade",
	"tc_shade_lvl1",
	"tc_shade_lvl2",
	"tc_shade_lvl3",
	"tc_shade_lvl4",
	"tc_shade_lvl5",
	"euf_sarge",
	"euf_sarge_lvl1",
	"euf_sarge_lvl2",
	"euf_sarge_lvl3",
	"euf_sarge_lvl4",	
	"euf_sarge_lvl5",
	"tc_dragon",	
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
	"euf_marine_laser",	
	"euf_pyro",	
	"euf_sniper_ai",
	"euf_tank",
	"euf_aatank",
	"euf_scorpion",	
	"euf_hover",	
}	

local skirmishers = {
	"tc_enforcer",
	"euf_bazooka",
	"euf_bazooka_missile",	
	"tc_gunner",
	"tc_bonebeast",
	"tc_mage",		
	"euf_sniper_ai",	
}	

local raider = {
	"tc_cacodemon",	
	"tc_ghoul",
	"tc_skeleton",
	"euf_raider",	
	"euf_marine",
	"euf_marine_laser",		
	"euf_paladin_ai",
}

local jumper = { -- uses jump for offense. IE do not put commander or AA here. -- Jumping deactivated for CAI in the cursed, as controlled otherwise
	"euf_pyro",
	"tc_ghoul",
	"tc_mage",	
	"tc_cacodemon",	
	"euf_sarge_lvl2",
	"euf_sarge_lvl3",
	"euf_sarge_lvl4",
	"euf_sarge_lvl5",	
	"tc_shade_lvl2",
	"tc_shade_lvl3",
	"tc_shade_lvl4",
	"tc_shade_lvl5",
	"bug_med",		
}

local arty = {
	"tc_purgatory_ai",
	"euf_mlrs_ai",	
}

local counteredByAssaults = {
	"tc_enforcer",
	"tc_bonebeast",	
	"euf_bazooka",
	"euf_bazooka_missile",		
	"tc_purgatory_ai",
	"euf_mlrs_ai",	
}

local prioritySos = {
	"tc_pyramid_ai",
	"euf_barracks_ai",
}
	

local riot = assaultgroup
local assault = assaultgroup
local skirm = skirmishers

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
