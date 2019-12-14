-- UNITDEF -- TC_AGARES --
--------------------------------------------------------------------------------

local unitName = "tc_agares"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.75,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.83105,
  buildCostEnergy    = 940,
  buildCostMetal     = 940,
  buildPic           = "tc_agares.png",
  buildTime          = 940,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext	= "With the precise long-range tachyon beams the Agares is the perfect choice against all armored targets. It isn't very stable though."	
	},
  defaultmissiontype = "Standby",
  description        = "Heavy Laser Bot",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1000,
  maxDamage          = 1100,
  maxSlope           = 14,
  maxVelocity        = 1.5,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "HEAVYWALKER2X2",
  name               = "Agares",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Agares.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 768,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 9,
  trackStretch           = 1,
  trackType              = [[Pointy]],
  trackWidth             = 40,  
  
  turnRate           = 350,
  unitname           = "tc_agares",
  sfxtypes = {
    explosiongenerators = {
      "custom:MEDIUM_EXPLOSION_GREEN",
      "custom:GunGroundFlash_Medium_long",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
    working            = "",
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
      "agares_move",
    },
    select = {
      "agares_select",
    },
  },
  weapons = {
    [1]  = {
      name               = "AGARES_TACHYON",
      badTargetCategory  = "LIGHTARMOR AIR", 
      onlyTargetCategory = "LAND",
    },
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "60"
	}, 	
    damage             = 8000,
    description        = "Former Agares",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "TC_agares_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------
return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
