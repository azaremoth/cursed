-- UNITDEF -- euf_wall_rotated --
--------------------------------------------------------------------------------

local unitName = "euf_wall_rotated"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildPic           = "euf_wall.png",
  buildTime          = 0,
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "euf_wall_rotated_dead",  
    customParams          = {	factionname		   = "imperials",  },
  description        = "Perimeter Defense",
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = false,
  maxDamage          = 2400,
  maxSlope           = 45,
  maxWaterDepth      = 35,
  name               = "Perimeter Defense",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_wall_rotated.s3o",
  radarDistance      = 16,
  script             = 'euf_wall_rotated.lua',  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "euf_wall_rotated",
  yardMap            = "f",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALLRANDOMSMOKECLOUD",
    },
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  euf_wall_rotated_dead = {	
    resurrectable	   = 0,  
    category         = [[dragonteeth]],
    nodrawundergray  = true,  
    autoreclaimable    = "0",
    blocking           = true,
	mass			   = 1500,
    damage             = 2400,
    description        = "Perimeter Defense",
    footprintX         = 1,
    footprintZ         = 1,
    height             = "30",
    hitdensity         = "1000",
    metal              = 8,
    object             = "euf_wall_rotated.s3o",
    reclaimable        = true,
    world              = "allworld",
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
