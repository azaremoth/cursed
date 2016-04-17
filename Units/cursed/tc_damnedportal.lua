-- UNITDEF -- TC_DAMNEDPORTAL --
--------------------------------------------------------------------------------

local unitName = "tc_damnedportal"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 750,
  buildCostMetal     = 750,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "TC_DamnedPortal.jpg",
  buildTime          = 750,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  useFootPrintCollisionVolume = true,  
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/tc_damnedportal_normal.png",
	normalmaps = "yes",	
    helptext = "Mechanic demons can be summoned here."
	},
  description        = "Produces mechanic demons",
  explodeAs          = "BIG_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "bigspuare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 4200,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Damned Portal",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_DamnedPortal.s3o",
  radarDistance      = 64,
  selfDestructAs     = "BIG_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_damnedportal",
  useBuildingGroundDecal = true,
  workerTime         = 30,
  yardMap            = "oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo",
  buildoptions = {
    "tc_kaboom",
    "tc_agares",
    "tc_mermeoth",
    "tc_purgatory",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:PORTALGLOW",
      "custom:PORTALSPIKES",
      "custom:Big_Explosion_Green",
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
    description        = "Wrecked Portal",
    footprintX         = 8,
    footprintZ         = 8,
    height             = "60",
    hitdensity         = "100",
    metal              = 625,
    object             = "TC_DamnedPortal_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 625,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
