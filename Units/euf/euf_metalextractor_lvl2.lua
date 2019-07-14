-- UNITDEF -- EUF_metalextractor_lvl2 --
--------------------------------------------------------------------------------

local unitName = "euf_metalextractor_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildTime          = 700,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = "euf_groundplate3.png",
  useBuildingGroundDecal = true,    
  buildPic           = "euf_metalextractor_lvl2.png",    
  category           = "EUF LAND HEAVYARMOR",
  canstop            = false,
  cantBeTransported  = true,  
  corpse             = "dead",
  customParams          = {
		factionname			= "imperials",
		metal_extractor 	= true,	
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
		helptext 			= "Advanced metal extractor."
  },
  description        = "Extracts Metal",
  energyUse          = 250,
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  extractsMetal      = 0.003, -- 0.0055
  extractSquare		 = false,  
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = "bigmetal",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2500,
  maxSlope           = 20,
  maxWaterDepth      = 500,
  metalStorage       = 0,
  name               = "Advanced Metal Extractor",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_metalextractor_lvl2.s3o",
  onoffable          = true,
  radarDistance      = 0,
  script             = "euf_metalextractor_lvl2.lua",    
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "METAL",
  unitname           = "euf_metalextractor_lvl2",
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
    explosiongenerators = {
        "custom:EUF_Structurebuilding_Medium",
		"custom:MLRSRocketTrail",	 
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
    damage             = 2000,
    description        = "Wrecked Extractor",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 475,
    object             = "euf_metalextractor_lvl2_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 238,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------


return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
