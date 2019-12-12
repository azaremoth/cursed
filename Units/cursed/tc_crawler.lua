-- UNITDEF -- TC_CRAWLER --
--------------------------------------------------------------------------------

local unitName = "tc_crawler"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.75,
  armortype          = "HEAVY",
  badTargetCategory  = "LAND",
  brakeRate          = 1.83105,
  buildCostEnergy    = 900,
  buildCostMetal     = 900,
  buildPic           = "tc_crawler.png",
  buildTime          = 900,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
    normaltex = "unittextures/normalmaps/tc_crawler_normal.png",
	normalmaps = "yes",		
    helptext 	= "The Crawler is the perfect choice against air targets and light armored units. It also can climp ANYWHERE."
	},
  defaultmissiontype = "Standby",
  description        = "all terrain anti-air",
  --  energyMake         = "-3",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "bigcircle",
  idleAutoHeal       = 6,
  idleTime           = 300,
  mass               = 2500,
  maxDamage          = 2300,
  maxSlope           = 14,
  maxVelocity        = 1.0,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "CLIMBER3X3",
  name               = "Crawler",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "LAND",
  objectName         = "tc_Crawler.s3o",
  script             = "tc_crawler.lua",
  repairable         = false,   
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 640,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 350,
  unitname           = "tc_crawler",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGER",
      "custom:DefenderGunFlare",
      "custom:BLOOD_EXPLOSION_BIG",	  
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
      "monstergrowl",
    },
    select = {
      "monstergrowl",
    },
  },
  weapons = {
    [1]  = {
      name                = "CRAWLER_AA",
      badTargetCategory = "LAND",
      onlyTargetCategory = "LAND AIR",
    },
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_crawler",
		featuredecaytime	= "60"
	},  
    damage             = 8000,
    mass               = 2500,	
    description        = "Former Crawler",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "10",
    hitdensity         = "1000",
    metal              = 0,
    object             = "TC_Crawler_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
