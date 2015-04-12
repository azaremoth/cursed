-- UNITDEF -- euf_wall_lvl2 --
--------------------------------------------------------------------------------

local unitName = "euf_wall_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 30,
  buildCostMetal     = 30,
  buildPic           = "euf_wall_lvl2.png",
  buildTime          = 30,
  category           = "EUF LAND HEAVYARMOR",
  
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "80 70 10",
  collisionVolumeOffsets 	= "0 0 5",
  -- collisionVolumeTest 		= 1,  
  
  corpse             = "euf_wall_lvl2_dead",    
    customParams          = {	factionname		   = "imperials",  },
  description        = "Defensive Wall",
  footprintX         = 5,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = false,
  maxDamage          = 6000,
  maxSlope           = 15,
  maxWaterDepth      = 35,
  name               = "Defensive Wall",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_wall_lvl2.s3o",
  radarDistance      = 16,
  script             = "euf_wall_lvl2.lua",    
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "euf_wall_lvl2",
  yardMap            = "fffff",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",  
  sfxtypes = {
    explosiongenerators = {
      "custom:EUF_Structurebuilding_Small",
    },
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  euf_wall_lvl2_dead = {	
	resurrectable	   = 0,  
    category         = [[dragonteeth]],
    nodrawundergray  = true,  
    autoreclaimable    = "0",
    blocking           = true,
	mass			   = 10000,
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "80 70 10",
  collisionVolumeOffsets 	= "0 0 5",	
    damage             = 10000,
    description        = "Defensewall",
    footprintX         = 5,
    footprintZ         = 1,
    height             = "15",
    hitdensity         = "10000",
    metal              = 20,
    object             = "euf_wall_lvl2.s3o",
    reclaimable        = true,
    upright            = true,
    world              = "allworld",
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
