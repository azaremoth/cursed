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
  canstop            = "1",
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
      def                = "FLAK_CRAWLER",
      badTargetCategory = "LAND",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
FLAK_CRAWLER = {
    avoidFriendly      = true,
	collideFriendly    = true,  
    accuracy           = 64,
    areaOfEffect       = 128,
    -- beamweapon         = true,
    burnblow           = true,
    coreThickness      = 1,
    craterBoost        = 0,
    craterMult         = 0,
	cylinderTargeting = 128,		
    energypershot      = 5,	
    explosionGenerator = "custom:FLAKImpact",
    interceptedByShieldType = 2,
    -- lineofsight        = true,
    name               = "Flak Gun",
    range              = 700,
    reloadtime         = .4,
    rgbColor           = "0.8745 1 0.1568",
    soundHit           = "defender_hit",
    soundStart         = "flakgun",
    soundStartVolume   = 40,
    soundTrigger       = true,
	sweepFire		   = false,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 1800,
--	Weaponspecial ------------------------------------------
    beamTime           = 0.05,
    coreThickness      = 0.1,
    largeBeamLaser     = 1,
    laserFlareSize     = 2,
    rgbColor           = "0.45 1 0.45",
    texture1           = "greengunshot_longdelay",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 2,
	tileLength         = 400,
    weaponType         = "BeamLaser",
------------------------------------------------------------		
	damage = {
      default            = 40,
      flyer              = 170,
      heavy              = 40,
      light              = 75,
    },
  },
}
unitDef.weaponDefs = weaponDefs


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
