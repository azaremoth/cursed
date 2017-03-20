-- UNITDEF -- TC_metalextractor_lvl2 --
--------------------------------------------------------------------------------

local unitName = "tc_metalextractor_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildTime          = 700,
  buildingGroundDecalDecaySpeed = 0.001,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 14,
  buildingGroundDecalType = "tc_groundplatesm.png",
  buildPic           = "tc_metalextractor_lvl2.png",
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	growingcreep = true,
	metal_extractor = true,	
	normaltex = "unittextures/normalmaps/tc_metalextractor_lvl2_normal.png",
	normalmaps = "yes",	
    helptext 	= "Advanced metal extractor."
  },
  description        = "Extracts Metal",
  energyUse          = 250,
  explodeAs          = "MEDIUM_EXPLOSION_GREEN",
  extractsMetal      = 0.0052,
  extractSquare		 = false,  
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = "bigmetal",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2000,
  maxSlope           = 20,
  maxWaterDepth      = 500,
  metalStorage       = 0,
  name               = "Advanced Metal Extractor",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_metalextractor_lvl2.s3o",
  onoffable          = true,
  selfDestructAs     = "MEDIUM_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "METAL",
  unitname           = "tc_metalextractor_lvl2",
  useBuildingGroundDecal = true,
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Medium",
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
      "mining_select",
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
    damage             = 2000,
    description        = "Wrecked Extractor",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 475,
    object             = "TC_metalextractor_lvl2_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 238,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
