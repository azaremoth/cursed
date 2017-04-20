-- UNITDEF -- EUF_BUNKER --
--------------------------------------------------------------------------------

local unitName = "euf_bunker"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildTime          = 400,
  
--  buildingGroundDecalDecaySpeed = 0.0,
--  buildingGroundDecalSizeX = 9,
--  buildingGroundDecalSizeY = 9,
--  buildingGroundDecalType = "euf_bunker_aoplane.png",
--  useBuildingGroundDecal = true,

  buildPic           = "euf_bunker.png",    
  category           = "EUF LAND HEAVYARMOR",
  
  useFootPrintCollisionVolume = true,
  corpse             = "dead",
  customParams       = {
	transportcapa		= 4,  
	factionname		 	= "imperials",
	normaltex 			= "unittextures/normalmaps/euf_bunker_normal.png",
	normalmaps 			= "yes",		
    helptext 			= "The bunker is a heavily fortified structure that can be used as a firebase for up to 4 soldiers."	
	},
  description        = "Firebase for soldiers",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigrhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  script             = "euf_bunker.lua",
  levelGround        = true,
  maxDamage          = 4000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Bunker",
  nanoColor          = "0 0 0",
  objectName         = "euf_bunker.s3o",
  radarDistance      = 0,
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  unitname           = "euf_bunker",
  yardMap            = "oooooo oooooo oooooo oooooo oooooo oooooo",
------------- transport ---------  
  isfirePlatform     = true,
  loadingRadius 	 = 300,
  releaseHeld        = false,
  transportCapacity  = 8,
  transportMass      = 100000000,
  transportSize      = 10,
  transportunloadmethod = 2,
  unloadSpread       = 0,
-------------------------------
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Medium",
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
    damage             = 8000,
    description        = "Wrecked Bunker",
    footprintX         = 6,
    footprintZ         = 6,
    height             = "30",
    hitdensity         = "100",
    metal              = 150,
    object             = "euf_bunker_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 500,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
