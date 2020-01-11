--[[
defenceQuota = how much of each level of defence the unit wants
	defence demand in an area is additive

minFacCount = min other facs that must exist for factory to be built
minTime = not used yet
	
factory job indexes:
	1 = con
	2 = scout
	3 = raider
	4 = arty
	5 = assault
	6 = skirm
	7 = riot
	8 = AA
	
	1 = con
	2 = scout
	3 = fighter
	4 = bomber
	5 = gunship
--]]

factionBuildConfig = {
	cursed = {
		airDefenceRange = {
			[1] = 600,
			[2] = 800,
			[3] = 700,
		},

		factoryIds = {
			count = 4,
			[1] = {ID = UnitDefNames['tc_pyramid_ai'].id},
			[2] = {ID = UnitDefNames['tc_darkassembler'].id},
			[3] = {ID = UnitDefNames['tc_pitt'].id},
			[4] = {ID = UnitDefNames['tc_damnedportal_ai'].id},				
		},
		factoryByDefId = {	
			[UnitDefNames['tc_pyramid_ai'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.6,
				BPQuota = 100,
				minFacCount = 0,
				[1] = { -- con
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_restless'].id, chance = 1},
				},
				[2] = { -- scout
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['tc_skeleton'].id, chance = 1},
				},
				[3] = { -- raider
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_ghoul'].id, chance = 1},
				},
				[4] = { -- arty
					importanceMult = 1,
					count = 2,
					[1] = {ID = UnitDefNames['tc_enforcer'].id, chance = 0.75},
					[2] = {ID = UnitDefNames['tc_bonebeast'].id, chance = 0.25},
				},
				[5] = { --assault
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_gunner'].id, chance = 1},
--					[2] = {ID = UnitDefNames['bug_med_undead'].id, chance = 0.3},					
				},
				[6] = { -- skirm
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_mage'].id, chance = 1},
				},
				[7] = { -- riot
					importanceMult = 0.5,
					count = 2,
					[1] = {ID = UnitDefNames['tc_undeadmarine_gun'].id, chance = 0.7},
					[2] = {ID = UnitDefNames['bug_larva_undead'].id, chance = 0.3},
				},	
				[8] = { -- aa
					importanceMult = 0.8,
					count = 1,
					[1] = {ID = UnitDefNames['tc_mage'].id, chance = 1},
				},	
			},
			[UnitDefNames['tc_darkassembler'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				airFactory = true,
				importance = 0.2,
				BPQuota = 70,
				minFacCount = 1,
				
				[1] = { -- con
					importanceMult = 0,
					count = 0,
				},
				
				[2] = { -- scout
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['tc_seeker'].id, chance = 1},
				},
				
				[3] = { -- fighter
					importanceMult = 0.7,
					count = 1,
					[1] = {ID = UnitDefNames['tc_blade'].id, chance = 1},
				},
				
				[4] = { -- bomber
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['tc_acranius'].id, chance = 1},
				},
				
				[5] = { -- gunship
					importanceMult = 1.4,
					count = 1,
					[1] = {ID = UnitDefNames['tc_redeemer'].id, chance = 1},
				},	
			},
			[UnitDefNames['tc_pitt'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.3,
				BPQuota = 100,
				minFacCount = 1,
				[1] = { -- con
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_lich_ai'].id, chance = 1},
				},
				[2] = { -- scout
					importanceMult = 0,
					count = 0,
				},
				[3] = { -- raider
					importanceMult = 1,
					count = 2,
					[1] = {ID = UnitDefNames['tc_rictus'].id, chance = 0.6},
					[2] = {ID = UnitDefNames['bug_med_undead'].id, chance = 0.4},					
				},
				[4] = { -- arty
					importanceMult = 0.2,
					count = 1,
					[1] = {ID = UnitDefNames['tc_bonebeast'].id, chance = 0.6},					
				},
				[5] = { --assault
					importanceMult = 0.75,
					count = 3,
					[1] = {ID = UnitDefNames['tc_belial'].id, chance = 0.25},
					[2] = {ID = UnitDefNames['tc_spiderdemon'].id, chance = 0.50},
					[3] = {ID = UnitDefNames['bug_big_undead'].id, chance = 0.25},							
				},
				[6] = { -- skirm
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_rictus'].id, chance = 1},			
				},
				[7] = { -- riot
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_mancubus'].id, chance = 1},	
				},	
				[8] = { -- aa
					importanceMult = 0.8,
					count = 1,
					[1] = {ID = UnitDefNames['tc_crawler'].id, chance = 1},
				},	
			},
			[UnitDefNames['tc_damnedportal_ai'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.2,
				BPQuota = 100,
				minFacCount = 1,
				[1] = { -- con
					importanceMult = 0,
					count = 0,
				},
				[2] = { -- scout
					importanceMult = 0.2,
					count = 1,
					[1] = {ID = UnitDefNames['tc_kaboom'].id, chance = 1},					
				},
				[3] = { -- raider
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_mermeoth'].id, chance = 1},
				},
				[4] = { -- arty
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_purgatory_ai'].id, chance = 1},
				},
				[5] = { --assault
					importanceMult = 0,
					count = 0,
				},
				[6] = { -- skirm
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['tc_agares'].id, chance = 1},					
				},
				[7] = { -- riot
					importanceMult = 0,
					count = 0,
				},	
				[8] = { -- aa
					importanceMult = 0,
					count = 0,
				},	
			},			
		},

		radarIds = {
			count = 1,
			[1] = {ID = UnitDefNames['tc_seer'].id, chance = 0.25},
		},

		mexIds = {
			count = 2,
			[1] = {ID = UnitDefNames['tc_metalextractor_lvl1'].id, chance = 0.70},
			[2] = {ID = UnitDefNames['tc_metalextractor_lvl2'].id, chance = 0.30},			
		},

		energyIds = {
			count = 2,
			[1] = {ID = UnitDefNames['tc_soulstone'].id},
			[2] = {ID = UnitDefNames['tc_soulcage'].id}, 
		},
		econByDefId = {
			[UnitDefNames['tc_soulstone'].id] = {
				energyGreaterThan = 0, 
				whileStall = true,
				makeNearFactory = false,
				energySpacing = 0,
				chance = 0.9,
				minEtoMratio = 1.5,
				defenceQuota = {0.5,0.3,0.07},
				defenceRange = 200,
				airDefenceQuota = {0,0.3,0.1},
				index = 2,
				energy = true,
			},
				
			[UnitDefNames['tc_soulcage'].id] = {
				energyGreaterThan = 30, 
				whileStall = false,
				makeNearFactory = false,
				energySpacing = 0,
				chance = 0.1,
				minEtoMratio = 0,
				defenceQuota = {0.5,0.3,0.07},
				defenceRange = 200,
				airDefenceQuota = {0,0.3,0.1},
				index = 2,
				energy = true,
			},
			[UnitDefNames['tc_metalextractor_lvl1'].id] = {
				defenceQuota = {1,0.4,0.15},
				defenceRange = 100,
				airDefenceQuota = {0,0,0},
				index = 1,
				energy = false,
			},

			[UnitDefNames['tc_metalextractor_lvl2'].id] = {
				defenceQuota = {1,0.4,0.15},
				defenceRange = 100,
				airDefenceQuota = {0,0,0},
				index = 1,
				energy = false,
			},
		},

		defenceIdCount = 2,
		airDefenceIdCount = 1,
		defenceIds = {
			[1] = {
				count = 2,
				[1] = {ID = UnitDefNames['tc_hellfire'].id, chance = 0.3},
				[2] = {ID = UnitDefNames['tc_defender'].id, chance = 0.7},
			},
			[2] = {
				count = 1,
				[1] = {ID = UnitDefNames['tc_tower'].id, chance = 1},
			},
		},

		defenceByDefId = {
			[UnitDefNames['tc_defender'].id] = {
				level = 1,
				index = 1,
			},
			[UnitDefNames['tc_hellfire'].id] = {
				level = 1,
				index = 1,
			},
			[UnitDefNames['tc_tower'].id] = {
				level = 2,
				index = 1,
			},
		},

		airDefenceIds = {
			[1] = {
				count = 1,
				[1] = {ID = UnitDefNames['tc_defender'].id, chance = 1.0},
			},
		},

		airDefenceByDefId = {
			[UnitDefNames['tc_defender'].id] = {
				level = 1,
				index = 1,
			},
		},
--		airpadDefID = UnitDefNames['armasp'].id,
--		nanoDefID = UnitDefNames['armnanotc'].id,
--		metalStoreDefID = UnitDefNames['armmstor'].id,
	},

	imperials = {
		airDefenceRange = {
			[1] = 600,
			[2] = 800,
			[3] = 700,
		},

		factoryIds = {
			count = 4,
			[1] = {ID = UnitDefNames['euf_barracks_ai'].id},
			[2] = {ID = UnitDefNames['euf_airport'].id},
			[3] = {ID = UnitDefNames['euf_factory_ai'].id},
			[4] = {ID = UnitDefNames['euf_church_ai'].id},
		},
		factoryByDefId = {	
			[UnitDefNames['euf_barracks_ai'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.40,
				BPQuota = 100,
				minFacCount = 0,
				[1] = { -- con
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_constructor_ai'].id, chance = 1},
				},
				[2] = { -- scout
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_scoutdrone'].id, chance = 1},
				},
				[3] = { -- raider
					importanceMult = 1,
					count = 2,
					[1] = {ID = UnitDefNames['euf_marine'].id, chance = 1},
					[2] = {ID = UnitDefNames['euf_marine_laser'].id, chance = 0.5},					
				},
				[4] = { -- arty
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_bazooka'].id, chance = 1},
				},
				[5] = { --assault
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_pyro'].id, chance = 1},
				},
				[6] = { -- skirm
					importanceMult = 1,
					count = 2,
					[1] = {ID = UnitDefNames['euf_pyro'].id, chance = 1},
					[2] = {ID = UnitDefNames['euf_bazooka_missile'].id, chance = 0.33},					
				},
				[7] = { -- riot
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_sniper_ai'].id, chance = 1},
				},	
				[8] = { -- aa
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_marine'].id, chance = 1},
				},	
			},
			[UnitDefNames['euf_airport'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				airFactory = true,
				importance = 0.2,
				BPQuota = 70,
				minFacCount = 1,
				
				[1] = { -- con
					importanceMult = 0,
					count = 0,
				},
				
				[2] = { -- scout
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_scout'].id, chance = 1},
				},
				
				[3] = { -- fighter
					importanceMult = 0.7,
					count = 1,
					[1] = {ID = UnitDefNames['euf_interceptor'].id, chance = 1},
				},
				
				[4] = { -- bomber
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_bomber'].id, chance = 1},
				},
				
				[5] = { -- gunship
					importanceMult = 1.4,
					count = 1,
					[1] = {ID = UnitDefNames['euf_scout'].id, chance = 1},
				},	
			},
			[UnitDefNames['euf_factory_ai'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.30,
				BPQuota = 100,
				minFacCount = 1,
				[1] = { -- con
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_constructor_lvl2_ai'].id, chance = 1},
				},
				[2] = { -- scout
					importanceMult = 0,
					count = 0,
				},
				[3] = { -- raider
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_raider'].id, chance = 1},
				},
				[4] = { -- arty
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_mlrs_ai'].id, chance = 1},
				},
				[5] = { --assault
					importanceMult = 1,
					count = 2,
					[1] = {ID = UnitDefNames['euf_tank'].id, chance = 0.66},
					[2] = {ID = UnitDefNames['euf_aatank'].id, chance = 0.33},
				},
				[6] = { -- skirm
					importanceMult = 1,
					count = 1,
					[1] = {ID = UnitDefNames['euf_scorpion'].id, chance = 1},
				},
				[7] = { -- riot
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_walker_ai'].id, chance = 1},
				},	
				[8] = { -- aa
					importanceMult = 0.8,
					count = 1,
					[1] = {ID = UnitDefNames['euf_aatank'].id, chance = 1},
				},	
			},
			[UnitDefNames['euf_church_ai'].id] = {
				defenceQuota = {2,0.6,0.3},
				defenceRange = 400,
				airDefenceQuota = {2,1,0.1},
				importance = 0.10,
				BPQuota = 100,
				minFacCount = 1,
				[1] = { -- con
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_priest'].id, chance = 1},
				},
				[2] = { -- scout
					importanceMult = 0,
					count = 0,
				},
				[3] = { -- raider
					importanceMult = 0.5,
					count = 1,
					[1] = {ID = UnitDefNames['euf_paladin_ai'].id, chance = 1},
				},
				[4] = { -- arty
					importanceMult = 0,
					count = 0,
				},
				[5] = { --assault
					importanceMult = 0,
					count = 0,
				},
				[6] = { -- skirm
					importanceMult = 0,
					count = 0,
				},
				[7] = { -- riot
					importanceMult = 0,
					count = 0,
				},	
				[8] = { -- aa
					importanceMult = 0,
					count = 0,
				},
			},
		},

		radarIds = {
			count = 2,
			[1] = {ID = UnitDefNames['euf_radar_lvl1'].id, chance = 0.75},
			[2] = {ID = UnitDefNames['euf_radar_lvl2'].id, chance = 0.25},			
		},

		mexIds = {
			count = 2,
			[1] = {ID = UnitDefNames['euf_metalextractor_lvl1'].id, chance = 0.7},
			[2] = {ID = UnitDefNames['euf_metalextractor_lvl2'].id, chance = 0.3},			
		},

		energyIds = {
			count = 2,
			[1] = {ID = UnitDefNames['euf_solar'].id},
			[2] = {ID = UnitDefNames['euf_powerplant'].id}, 
		},
		econByDefId = {
			[UnitDefNames['euf_solar'].id] = {
				energyGreaterThan = 0, 
				whileStall = true,
				makeNearFactory = false,
				energySpacing = 0,
				chance = 0.9,
				minEtoMratio = 1.5,
				defenceQuota = {0.5,0.3,0.07},
				defenceRange = 200,
				airDefenceQuota = {0,0.3,0.1},
				index = 2,
				energy = true,
			},
				
			[UnitDefNames['euf_powerplant'].id] = {
				energyGreaterThan = 30, 
				whileStall = false,
				makeNearFactory = false,
				energySpacing = 0,
				chance = 0.1,
				minEtoMratio = 0,
				defenceQuota = {0.5,0.3,0.07},
				defenceRange = 200,
				airDefenceQuota = {0,0.3,0.1},
				index = 2,
				energy = true,
			},

			[UnitDefNames['euf_metalextractor_lvl1'].id] = {
				defenceQuota = {1,0.4,0.15},
				defenceRange = 100,
				airDefenceQuota = {0,0,0},
				index = 1,
				energy = false,
			},

			[UnitDefNames['euf_metalextractor_lvl2'].id] = {
				defenceQuota = {1,0.4,0.15},
				defenceRange = 100,
				airDefenceQuota = {0,0,0},
				index = 1,
				energy = false,
			},
		},

		defenceIdCount = 2,
		airDefenceIdCount = 1,
		defenceIds = {
			[1] = {
				count = 3,
				[1] = {ID = UnitDefNames['euf_artytower'].id, chance = 0.2},
				[2] = {ID = UnitDefNames['euf_plasmatower'].id, chance = 0.45},
				[3] = {ID = UnitDefNames['euf_bunker_ai'].id, chance = 0.35},				
			},
			[2] = {
				count = 1,
				[1] = {ID = UnitDefNames['euf_lasertower'].id, chance = 1},
			},
		},

		defenceByDefId = {
			[UnitDefNames['euf_plasmatower'].id] = {
				level = 1,
				index = 1,
			},
			[UnitDefNames['euf_lasertower'].id] = {
				level = 2,
				index = 1,
			},
			[UnitDefNames['euf_bunker_ai'].id] = {
				level = 1,
				index = 1,
			},
			[UnitDefNames['euf_artytower'].id] = {
				level = 1,
				index = 1,
			},			
		},

		airDefenceIds = {
			[1] = {
				count = 1,
				[1] = {ID = UnitDefNames['euf_aatower'].id, chance = 1.0},
			},
		},

		airDefenceByDefId = {
			[UnitDefNames['euf_aatower'].id] = {
				level = 1,
				index = 1,
			},
		},
	},
}