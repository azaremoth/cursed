local LVL0 = {
  unitname           = "tc_shade",
  name               = "Shade (Hero)",
  maxDamage          = 1800,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "standing",
	--  canjump     = "1",
	--	jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."		
  }, 
}
local LVL1 = {
  unitname           = "tc_shade_lvl1",
  name               = "Shade (Hero Lvl. 1)",
  maxDamage          = 1800,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "standing",		
	--  canjump     = "1",
	--	jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."		
  },  
  weapons = {
    [1]  = {
      name                	= "SHADELVL1MELEE",
      mainDir            	= "0 0 1",
      maxAngleDif        	= 360,
	  badTargetCategory 	= "AIR",
      onlyTargetCategory 	= "LAND",
    },
  },  
}
local LVL2 = {
  unitname           = "tc_shade_lvl2",
  name               = "Shade (Hero Lvl. 2)",
  maxDamage          = 2250,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "standing",		
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."		
  },  
  weapons = {
    [1]  = {
      name                	= "SHADELVL2MELEE",
      mainDir            	= "0 0 1",
      maxAngleDif        	= 360,
	  badTargetCategory 	= "AIR",
      onlyTargetCategory 	= "LAND",
    },
  },  
}
local LVL3 = {
  unitname           = "tc_shade_lvl3",
  name               = "Shade (Hero Lvl. 3)",
  maxDamage          = 2800,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "standing",		
		illusions = 1,		
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."			
  },  
  weapons = {
    [1]  = {
      name                	= "SHADELVL3MELEE",
      mainDir            	= "0 0 1",
      maxAngleDif        	= 360,
	  badTargetCategory 	= "AIR",
      onlyTargetCategory 	= "LAND",
    },
  },  
}
local LVL4 = {
  unitname           = "tc_shade_lvl4",
  name               = "Shade (Hero Lvl. 4)",  
  maxDamage          = 3500,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "moving",
		illusions = 2,
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."		
  },  
  weapons = {
    [1]  = {
      name                	= "SHADELVL4MELEE",
      mainDir            	= "0 0 1",
      maxAngleDif        	= 360,
	  badTargetCategory 	= "AIR",
      onlyTargetCategory 	= "LAND",
    },
  },  
}
local LVL5 = {
  unitname           = "tc_shade_lvl5",
  name               = "Shade (Hero Lvl. 5)", 
  maxDamage          = 4400,
  customParams       = {
		factionname	= "cursed",
		isinfantry 	= "true",
		cloakedduring	= "moving",	
		illusions 	= 3,		
		canjump     = "1",
		jumpclass 	= "hero",		
		normaltex 	= "unittextures/normalmaps/tc_shade_normal.png",
		normalmaps 	= "yes",	
		RequireTech = "0 Hero",
		ProvideTech = "-Hero",
		helptext 	= "The Shade is a stealthy melee class damage dealer."		
  },  
  weapons = {
    [1]  = {
      name                	= "SHADELVL5MELEE",
      mainDir            	= "0 0 1",
      maxAngleDif        	= 360,
	  badTargetCategory 	= "AIR",
      onlyTargetCategory 	= "LAND",
    },
  },  
}
------------------------------------------------------ BASE CLASS
local BASE = {
  acceleration       = 1.0,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.0,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "tc_shade.png",
  buildTime          = 500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  capturable         = false, 
  category           = "CURSED LAND HEAVYARMOR",
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
  idleAutoHeal       = 5,
  idleTime           = 200,
  mass               = 3000,
  maxSlope           = 25,
  maxVelocity        = 3.7,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper3X3",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_shade.s3o",
  radarDistance      = 512,
  script             = 'tc_shade.lua',  
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  turnInPlace        = true,
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:blood_spray",
      "custom:SPARKLES",
      "custom:smokescreen_black_small",
	  "custom:LEVELING",   
	  "custom:GREENSPARKLE",	  
    },
  },
  sounds = {
    canceldestruct     = "",
   underattack        = "shade_underatk",
    arrived = {
      "",
    },
    cant = {
      "",
    },
    count = {
      "",
      "",
      "",
      "",
      "",
      "",
    },
    ok = {
      "shade_move",
    },
    select = {
      "shade_select",
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
	tc_shade 		= DefMergeTable(BASE, LVL0),
	tc_shade_lvl1 	= DefMergeTable(BASE, LVL1),
	tc_shade_lvl2 	= DefMergeTable(BASE, LVL2),
	tc_shade_lvl3 	= DefMergeTable(BASE, LVL3),
	tc_shade_lvl4 	= DefMergeTable(BASE, LVL4),
	tc_shade_lvl5 	= DefMergeTable(BASE, LVL5),
})