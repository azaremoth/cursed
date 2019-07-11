-- UNITDEF -- TC_metalextractor_lvl1 --
--------------------------------------------------------------------------------

local unitName = "tc_metalextractor_lvl1"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 30,
  buildCostMetal     = 30,
  buildTime          = 30,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 10,
  buildingGroundDecalType = "tc_groundplatesm.png",
  buildPic           = "tc_metalextractor_lvl1.png",
  category           = "CURSED LAND HEAVYARMOR",
  cantBeTransported  = true, 
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	growingcreep = true,	
	metal_extractor = true,
	normaltex = "unittextures/normalmaps/tc_metalextractor_lvl1_normal.png",
	normalmaps = "yes",	
    helptext 	= "Basic metal extractor."
  },
  description        = "Extracts Metal",
  energyUse          = 10,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  extractsMetal      = 0.00001, -- 0.0014
  extractSquare		 = false,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "metal",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 900,
  maxSlope           = 20,
  maxWaterDepth      = 500,
  metalStorage       = 0,
  name               = "Metal Extractor",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_metalextractor_lvl1.s3o",
  onoffable          = true,
  script             = "tc_metalextractor_lvl1.lua",    
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "METAL",
  unitname           = "tc_metalextractor_lvl1",
  useBuildingGroundDecal = true,
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Small",
      "custom:MLRSRocketTrail",	    
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
    damage             = 1000,
    description        = "Wrecked Extractor",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "30",
    hitdensity         = "100",
    metal              = 0,
    object             = "TC_metalextractor_lvl1_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 13,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
