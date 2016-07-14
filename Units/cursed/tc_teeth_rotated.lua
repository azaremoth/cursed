-- UNITDEF -- TC_TEETH_ROTATED --
--------------------------------------------------------------------------------

local unitName = "tc_teeth_rotated"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildPic           = "tc_teeth.png",
  buildTime          = 0,
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "tc_teeth_dead",
    customParams          = {	factionname		   = "cursed",  },
  description        = "Perimeter Defense",
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = false,
  maxDamage          = 3500,
  maxSlope           = 45,
  maxWaterDepth      = 35,
  name               = "Teeth",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_teeth.s3o",
  radarDistance      = 16,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "tc_teeth_rotated",
  yardMap            = "f",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",  
  sfxtypes = {
    explosiongenerators = {
      "custom:Greycloud",
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  tc_teeth_dead = {	
	resurrectable	   = 0,  
    autoreclaimable    = "0",
    category         = [[dragonteeth]],
    nodrawundergray  = true,  	
    blocking           = true,
	mass			   = 1500,
    damage             = 3500,
    description        = "Teeth",
    footprintX         = 1,
    footprintZ         = 1,
    height             = "30",
    hitdensity         = "100",
    metal              = 8,
    object             = "tc_teeth.s3o",
    reclaimable        = true,
    world              = "allworld",
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------