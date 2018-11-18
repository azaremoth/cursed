local LVL0 = {
  unitname           = "euf_sarge",
  name               = "Sarge (Hero)",
  maxDamage          = 2000,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
	--  canjump     = "1",
	--	jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  }, 
}
local LVL1 = {
  unitname           = "euf_sarge_lvl1",
  name               = "Sarge (Hero Lvl. 1)",
  maxDamage          = 2000,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
	--  canjump     = "1",
	--	jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL1CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL1PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL1PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL2 = {
  unitname           = "euf_sarge_lvl2",
  name               = "Sarge (Hero Lvl. 2)",
  maxDamage          = 2600,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL2CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL2PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL2PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL3 = {
  unitname           = "euf_sarge_lvl3",
  name               = "Sarge (Hero Lvl. 3)",
  maxDamage          = 3200,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL3CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL3PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL3PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL4 = {
  unitname           = "euf_sarge_lvl4",
  name               = "Sarge (Hero Lvl. 4)",  
  maxDamage          = 3800,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL4CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL4PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL4PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL5 = {
  unitname           = "euf_sarge_lvl5",
  name               = "Sarge (Hero Lvl. 5)", 
  maxDamage          = 4400,
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL5CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL5PISTOL",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL5PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL6 = {
  unitname           = "euf_sarge_lvl6",
  name               = "Sarge (Hero Lvl. 6)", 
  maxDamage          = 5000,
  canManualFire      = true,  
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL6CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL6BFG",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL6PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL7 = {
  unitname           = "euf_sarge_lvl7",
  name               = "Sarge (Hero Lvl. 7)", 
  maxDamage          = 5600,
  canManualFire      = true,  
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL7CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL7BFG",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL7PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL8 = {
  unitname           = "euf_sarge_lvl8",
  name               = "Sarge (Hero Lvl. 8)", 
  maxDamage          = 6200,
  canManualFire      = true,  
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL8CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL8BFG",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL8PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL9 = {
  unitname           = "euf_sarge_lvl9",
  name               = "Sarge (Hero Lvl. 9)", 
  maxDamage          = 6800,
  canManualFire      = true,  
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL9CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL9BFG",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL9PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
local LVL10 = {
  unitname           = "euf_sarge_lvl10",
  name               = "Sarge (Hero Lvl. 10)", 
  maxDamage          = 7400,
  canManualFire      = true,  
  customParams       = {
		factionname	= "imperials",
		isinfantry 	= "true",	
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/euf_sarge_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },  
  weapons = {
		[1] = {
			name               	= "SARGELVL10CHAINGUN",
			onlyTargetCategory 	= "LAND AIR",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[2] = {
			name               	= "SARGELVL10BFG",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
		[3] = {
			name               	= "SARGELVL10PLASMAGUN",
			mainDir            	= "0 0 1",
			maxAngleDif        	= 180,
			onlyTargetCategory 	= "LAND",
			badTargetCategory 	= "HEAVYARMOR",
		},
  },  
}
------------------------------------------------------ BASE CLASS
local BASE = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "light",
  brakeRate          = 1.0,
  buildCostEnergy    = 0, --500
  buildCostMetal     = 0, --500
  buildPic           = "euf_sarge.png",
  buildTime          = 500,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true, 
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  capturable         = false, 
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "22 35 22",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  defaultmissiontype = "Standby",
  description        = "Hero",
  energyMake         = "",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "skull",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 2000,
  maxSlope           = 20,
  maxWaterDepth      = 12,
  maxVelocity        = 2,
  mobilestandorders  = "1",
  movementClass      = "Trooper3X3",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_sarge.s3o",
  repairable         = false,
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1000,
  turnInPlace        = true,
  upright            = true,
  workerTime         = 0,
  script			 = "euf_sarge.lua",
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:blood_spray",
      "custom:Greycloud",
	  "custom:JUMPBURST",
	  "custom:NONE",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",	  
      "custom:PLasmaTowerGunFlare",
      "custom:PLasmaTowerGunGroundflash",
	  "custom:BelialBigGunFlare",
	  "custom:NONE",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "sarge_underatk.ogg",
    arrived = { "", },
    cant = { "", },
    count = { "", "", "", "", "", "", },
    ok = {
      "sarge_move.ogg",
      "sarge_move2.ogg",	  
      "sarge_move3.ogg",	  
    },
    select = {
      "sarge_select.ogg",
      "sarge_select2.ogg",	  
    },
  },
}

----------------------------------- FINALIZE ---------------------------------------------
function DefCopyTable(tableToCopy, deep)
  local copy = {}
  for key, value in pairs(tableToCopy) do
    if (deep and type(value) == "table") then
      copy[key] = DefCopyTable(value, true)
    else
      copy[key] = value
    end
  end
  return copy
end

function DefMergeTable(primary, secondary, deep)
    local new = DefCopyTable(primary, deep)
    for i, v in pairs(secondary) do
	    -- key not used in primary, assign it the value at same key in secondary
	    if not new[i] then
		    if (deep and type(v) == "table") then
			    new[i] = DefCopyTable(v, true)
		    else
			    new[i] = v
		    end
	    -- values at key in both primary and secondary are tables, merge those
	    elseif type(new[i]) == "table" and type(v) == "table"  then
		    new[i] = DefMergeTable(new[i], v, deep)
	    end
    end
    return new
end

return lowerkeys({
	euf_sarge = DefMergeTable(BASE, LVL0),
	euf_sarge_lvl1 	= DefMergeTable(BASE, LVL1),
	euf_sarge_lvl2 	= DefMergeTable(BASE, LVL2),
	euf_sarge_lvl3 	= DefMergeTable(BASE, LVL3),
	euf_sarge_lvl4 	= DefMergeTable(BASE, LVL4),
	euf_sarge_lvl5 	= DefMergeTable(BASE, LVL5),
	euf_sarge_lvl6 	= DefMergeTable(BASE, LVL6),
	euf_sarge_lvl7	= DefMergeTable(BASE, LVL7),
	euf_sarge_lvl8 	= DefMergeTable(BASE, LVL8),
	euf_sarge_lvl9 	= DefMergeTable(BASE, LVL9),
	euf_sarge_lvl10	= DefMergeTable(BASE, LVL10),		
})
