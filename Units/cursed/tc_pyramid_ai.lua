-- UNITDEF -- TC_PYRAMID --
--------------------------------------------------------------------------------

local unitName = "tc_pyramid_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 350,
  buildCostMetal     = 350,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  useBuildingGroundDecal = true,
  buildPic           = "tc_pyramid.png",
  buildTime          = 350,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  capturable         = false, 
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_pyramid_normal.png",
	normalmaps = "yes",
    helptext = "Necromancers, witches and skeletons can be produced here."			
  },
  description        = "Produces Undead",
  explodeAs          = "MEDIUM_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3800, --2960
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Pyramid (AI)",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Pyramid.s3o",
  radarDistance      = 64,
  selfDestructAs     = "MEDIUM_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_pyramid_ai",
  workerTime         = 8,
  yardMap            = "oooooo oooooo occcco occcco ooccoo ooccoo",
  buildoptions = {
    "tc_restless",
    "tc_witch",
    "tc_skeleton",
    "tc_enforcer",
    "tc_gunner",
	"tc_mage",
	"tc_ghoul",
	"tc_undeadmarine_gun",
	"tc_bonebeast",	
	"tc_shade",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:NULL",
      "custom:DOORSPIKES",
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
    damage             = 40000,
    description        = "Wrecked Pyramid",
    footprintX         = 6,
    footprintZ         = 6,
    height             = "50",
    hitdensity         = "100",
    metal              = 175,
    object             = "TC_Pyramid_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 88,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
