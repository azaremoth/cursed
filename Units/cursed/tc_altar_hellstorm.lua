-- UNITDEF -- TC_ALTAR --
--------------------------------------------------------------------------------

local unitName = "tc_altar_hellstorm"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 2300,
  buildCostMetal     = 2300,
  buildingGroundDecalDecaySpeed = 0.001,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_altar.png",
  buildTime          = 2300,
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
    helptext 	= "The altar enables the witch's shield spell. It was improved to be able to spawn hell storms."
	},
  description        = "Mighty bonedragons can be summoned here",
  explodeAs          = "HELLSTORM_DEATH",
  fireState          = 0,
  footprintX         = 7,
  footprintZ         = 7,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 4000,
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
      def                = "EPIC_HELLSTORM",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND",
    },
  },	  
}
--------------------------------------------------------------------------------

local weaponDefs = {
  EPIC_HELLSTORM = {
    name                    = [[Epic Hellstorm]],

    burst              = 30,
    burstrate          = 0.5,
	projectiles        = 20,
	dance = 2500, -- 3000
    sprayAngle = 45, --50
	
    commandfire             = true,
	
	weapontype		=	"MissileLauncher",
	turret		=	1,
	tolerance		=	2000,
    gravityAffected          = true,
	CanAttackGround = true,
    energypershot           = 0,	
	firestarter		=	0,
	range			=	9999999,
	flighttime		=	0,
    reloadtime              = 400,
	startvelocity	=	2000,
	weaponvelocity	=	2000,
	areaofeffect	=	350,
	edgeeffectiveness	=	0.1,
	targetmoveerror	=	0.075,
	soundtrigger	=	0,
	explosionspeed	=	100,
	cratermult		=	0.5,
	craterboost		=	0,
	impulsefactor	=	0,
	impulseboost	=	0,
	interceptedByShieldType = 1,
	
--	cegTag                  = [[HELLSTORM]],	  
	explosionGenerator = "custom:napalm_green",
	soundHit           = "hellstorm_hit",
	soundHitVolume     = 160,

------------------------------------------------------------
		damage = {
		  default            = 100,
		  flyer              = 100,
		  heavy              = 100,
		  light              = 100,
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
    metal              = 1150,
    object             = "TC_altar_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 325,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
