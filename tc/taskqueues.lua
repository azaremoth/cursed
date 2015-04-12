--[[
 Task Queues!
]]--

local restless = {
	"tc_metalextractor_lvl1",
	"tc_metalextractor_lvl1",
	"tc_soulstone",
	"tc_soulstone",
	"tc_metalextractor_lvl1",
	"tc_defender",
	"tc_soulstone",
	"tc_bonebeast",	
	"tc_pyramid_ai",
	"tc_seer",
	"tc_defender",
	"tc_soulstone",
	"tc_bonebeast",		
	"tc_pitt",
	"tc_soulstone",
	"tc_bonebeast",	
	"tc_bonebeast",	
	"tc_hellfire",
	"tc_defender",
	"tc_darkassembler",	
}

local lich = {
	"tc_metalextractor_lvl2",
	"tc_soulcage",
	"tc_metalextractor_lvl2",
	"tc_soulcage",
	"tc_cursedhand",
	"tc_damnedportal",		
	"tc_cursedhand",	
	"tc_altar",
	"tc_darkassembler_lvl2_ai",		
}


local pyramidAI = {
	"tc_restless",
	"tc_skeleton",
	"tc_skeleton",
	"tc_skeleton",
	"tc_skeleton",
	"tc_restless",
	"tc_skeleton",	
	"tc_skeleton",
	"tc_gunner",
	"tc_gunner",
	"tc_gunner",
	"tc_enforcer",
	"tc_enforcer",
	"tc_skeleton",
	"tc_witch",
}

local Pitt = {
	"tc_lich_ai",
	"tc_lich_ai",	
	"tc_rictus",
	"tc_rictus",
	"tc_mancubus",
	"tc_mancubus",
	"tc_mancubus",
	"tc_belial",
}

local altar = {
	"tc_dragon",
}

local Darkassembler = {
	"tc_seeker",
	"tc_blade",
	"tc_redeemer",
	"tc_redeemer",
	"tc_redeemer",
	"tc_blade",	
}

local Darkassembler2 = {
	"tc_seeker",
	"tc_blade",
	"tc_acranius",
	"tc_sledgehammer",
	"tc_sledgehammer",
	"tc_acranius",	
}

local Constructor1 = {
	"euf_metalextractor_lvl1",
	"euf_metalextractor_lvl1",
	"euf_solar",
	"euf_solar",
	"euf_metalextractor_lvl1",
	"euf_solar",
	"euf_radar_lvl1",
	"euf_metalextractor_lvl1",
	"euf_metalextractor_lvl1",	
	"euf_solar",	
	"euf_metalextractor_lvl1",
	"euf_barracks_ai",	
	"euf_plasmatower",
	"euf_aatower",	
	"euf_solar",
	"euf_factory_ai",
	"euf_solar",
	"euf_metalextractor_lvl1",	
	"euf_plasmatower",
	"euf_aatower",
	"euf_artytower",
	"euf_airport",
	"euf_church",
	"euf_metalextractor_lvl1",
	"euf_metalextractor_lvl1",
	"euf_solar",
	"euf_solar",	
}

local Constructor2 = {
	"euf_metalextractor_lvl2",
	"euf_powerplant",
	"euf_powerplant",
	"euf_lasertower",
	"euf_radar_lvl2",	
	"euf_metalextractor_lvl2",
	"euf_powerplant",
	"euf_powerplant",
	"euf_lasertower",
	"euf_sanctum",	
	"euf_techcenter",
	"euf_metalextractor_lvl2",
	"euf_powerplant",
	"euf_lasertower",	
}

local Barracks = {
	"euf_constructor_ai",
	"euf_marine",
	"euf_marine",	
	"euf_marine",
	"euf_pyro",
	"euf_bazooka",
	"euf_bazooka",
	"euf_constructor",	
	"euf_marine",
	"euf_marine",		
	"euf_marine",	
	"euf_pyro",	
	"euf_sniper",		
}

local WarFactory = {
	"euf_raider",
	"euf_raider",
	"euf_constructor_lvl2",
	"euf_aatank",	
	"euf_tank",
	"euf_aatank",	
	"euf_tank",	
	"euf_mlrs",	
	"euf_scorpion",		
	"euf_constructor_lvl2",
	"euf_tank",	
	"euf_tank",		
}

local Church = {
	"euf_priest",
	"euf_priest",
	"euf_paladin",	
}

local Airport = {
	"euf_scout",
	"euf_scout",
	"euf_scout",	
	"euf_interceptor",
	"euf_interceptor",	
	"euf_bomber",
	"euf_bomber",
	"euf_bomber",	
}

taskqueues = {
	tc_pitt = Pitt,
	tc_restless = restless,
	tc_lich_ai = lich,	
	tc_pyramid_ai = pyramidAI,
	tc_altar = altar,
	tc_darkassembler = Darkassembler,
	tc_darkassembler_lvl2 = Darkassembler2,	
	euf_constructor_ai = Constructor1,
	euf_constructor_lvl2 = Constructor2,
	euf_barracks_ai = Barracks,
	euf_factory = WarFactory,
	euf_church = Church,	
	euf_airport = Airport,		
}
