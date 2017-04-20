-- UNITDEF -- EUF_storage --
--------------------------------------------------------------------------------

local unitName = "euf_storage"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildingGroundDecalDecaySpeed = 0.0,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 10,
  buildingGroundDecalType = "euf_groundplate.png",  
  buildTime          = 400,
  buildPic           = "euf_storage.png",  
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",   
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_storage_normal.png",
	normalmaps = "yes",		
    helptext = "This building stores energy and metal."
	},
  description        = "Storage building",
--  energyMake         = 0,
  energyStorage      = 500,
  metalStorage       = 250,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 9,
  footprintZ         = 9,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Storage",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_storage.s3o",
  onoffable          = false,
  radarDistance      = 0,
  script             = "euf_storage.lua",    
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_storage",
  useBuildingGroundDecal = true,  
  yardMap            = "ooooooooo ooooooooo ooooooooo ooooooooo ooooooooo ooooooooo ooooooooo ooooooooo ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:EUF_Structurebuilding_Medium",
      "custom:Medium_Explosion_YELLOW",	  
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
      "solar_select",
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
    description        = "Wrecked Storage",
    footprintX         = 9,
    footprintZ         = 9,
    height             = "30",
    hitdensity         = "100",
    metal              = 200,
    object             = "euf_storage_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
