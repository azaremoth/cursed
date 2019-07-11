-- UNITDEF -- TC_ALTAR --
--------------------------------------------------------------------------------

local unitName = "tc_altar"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 800,
  buildCostMetal     = 800,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_altar.png",
  buildTime          = 800,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_altar_normal.png",
	normalmaps = "yes",
	ProvideTech         = "Cursed Technology",	
    helptext 	= "Skeleton Dragons can be summoned here. The altar enables the witch's shield spell. It can be improved to be able to spawn hell storms."
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
  maxDamage          = 4800,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Altar of Evil",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_altar.s3o",
  radarDistance      = 64,
  selfDestructAs     = "BIG_EXPLOSION_GREEN_HD",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_altar",
  useBuildingGroundDecal = true,
  workerTime         = 50,
  yardMap            = "ooooooo ooooooo oocccoo oocccoo oocccoo ooooooo ooooooo",
  buildoptions = {
    "tc_dragon",
  },
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
}


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
    metal              = 400,
    object             = "TC_altar_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 325,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
