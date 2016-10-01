-- UNITDEF -- TC_ALTAR --
--------------------------------------------------------------------------------

local unitName = "tc_altar_hellstorm"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 800,
  buildCostMetal     = 800,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_altar.png",
  buildTime          = 800,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_altar_normal.png",
	normalmaps = "yes",
	ProvideTech         = "Cursed Technology",	
    helptext 	= "Skeleton Dragons can be summoned here. The altar enables the witch's shield spell."
	},
  description        = "Mighty bonedragons can be summoned here",
  explodeAs          = "BIG_EXPLOSION_GREEN_HD",
  firestandorders    = "1",
  footprintX         = 7,
  footprintZ         = 7,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3600,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Altar of Evil",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_altar.s3o",
  radarDistance      = 64,
  script             = "tc_altar_hellstorm.lua",    
  selfDestructAs     = "BIG_EXPLOSION_GREEN_HD",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_altar_hellstorm",
  useBuildingGroundDecal = true,
  yardMap            = "ooooooo ooooooo oocccoo oocccoo oocccoo ooooooo ooooooo",

  sfxtypes = {
    explosiongenerators = {
      "custom:SPIKES_MAGE",
      "custom:Medium_Explosion_Green",
      "custom:Structurebuilding_Big",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "bell",
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
      "",
    },
    select = {
      "building",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",
      def                = "TC_HELLSTORM",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND",
    },
  },	  
}
--------------------------------------------------------------------------------

local weaponDefs = {
  TC_HELLSTORM = {
      name                    = [[Strategic Nuclear Missile]],
      areaOfEffect            = 1500,
      cegTag                  = [[NUCKLEARMINI]],
      collideFriendly         = false,
      collideFeature          = false,
      commandfire             = true,
      craterBoost             = 6,
      craterMult              = 6,
	  customParams        	  = {
		light_color = [[2.92 2.64 1.76]],
		light_radius = 3000,
	  },
      edgeEffectiveness       = 0.3,
      explosionGenerator      = [[custom:LONDON]],
      fireStarter             = 0,
      flightTime              = 180,
      impulseBoost            = 0.5,
      impulseFactor           = 0.2,
      interceptedByShieldType = 65,
      model                   = [[nuke.s3o]],
      noSelfDamage            = false,
      range                   = 72000,
      reloadtime              = 1, --400
      smokeTrail              = false,
      soundHit                = [[explosion\ex_ultra8]],
      startVelocity           = 100,
--      stockpile               = true,
--      stockpileTime           = 10^4,
--      targetable              = 1,
      texture1                = [[null]], --flare
      tolerance               = 4000,
      weaponAcceleration      = 100,
      weaponTimer             = 10,
      weaponType              = [[StarburstLauncher]],
      weaponVelocity          = 800,
------------------------------------------------------------
		damage = {
		  default            = 3000,
		  flyer              = 3000,
		  heavy              = 3000,
		  light              = 3000,
		},
	},
 }
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},  	
    damage             = 9000,
    description        = "Wrecked altar",
    footprintX         = 7,
    footprintZ         = 7,
    height             = "30",
    hitdensity         = "100",
    metal              = 500,
    object             = "TC_altar_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 325,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
