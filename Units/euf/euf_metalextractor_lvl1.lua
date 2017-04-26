-- UNITDEF -- EUF_METALEXTRACTOR_LVL1 --
--------------------------------------------------------------------------------

local unitName = "euf_metalextractor_lvl1"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 30,
  buildCostMetal     = 30,
  buildTime          = 30,
  
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 5,
  buildingGroundDecalType = "euf_groundplate3.png",
  useBuildingGroundDecal = true,    
  
  buildPic           = "euf_metalextractor_lvl1.png",    
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",   
  customParams          = {
	factionname	= "imperials",
	metal_extractor = true,	
	normaltex = "unittextures/normalmaps/euf_metalextractor_lvl1_normal.png",
	normalmaps = "yes",			
    helptext 	= "Basic metal extractor."
  },
  description        = "Extracts Metal",
  energyUse          = 10,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  extractsMetal      = 0.00001, -- 0.0015
  extractSquare		 = false,  
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "metal",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,  
  maxDamage          = 750,
  maxSlope           = 20,
  maxWaterDepth      = 500,
  metalStorage       = 0,
  name               = "Metal Extractor",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_metalextractor_lvl1.s3o",
  onoffable          = true,
  radarDistance      = 0,
  script             = "euf_metalextractor_lvl1.cob",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "METAL",
  unitname           = "euf_metalextractor_lvl1",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
    },
  },  
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_baseattacked",
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
    object             = "euf_metalextractor_lvl1_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 13,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
