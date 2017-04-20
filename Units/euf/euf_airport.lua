-- UNITDEF -- euf_airport --
--------------------------------------------------------------------------------

local unitName = "euf_airport"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 750,
  buildCostMetal     = 750,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.0,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 14,
  buildingGroundDecalType = "euf_groundplate.png",
  buildPic           = "euf_airport.png",
  buildTime          = 750,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
--  collisionVolumeOffsets 	= "0 0 0",
--  collisionVolumeScales 	= "140 175 140",
--  collisionVolumeType 		= "box",
  useFootPrintCollisionVolume = true,
  -- collisionVolumeTest 		= 1,  
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_airport_normal.png",
	normalmaps = "yes",			
    helptext = "Various aircrafts can be build here."	
	},
  description        = "Produces Aircrafts",
  explodeAs          = "BIG_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 10,
  footprintZ         = 10,
  iconType           = "bigsquare",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1850,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Airport",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_airport.s3o",
  radarDistance      = 64,
  script             = "euf_airport.cob",  
  selfDestructAs     = "BIG_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "euf_airport",
  useBuildingGroundDecal = true,
  workerTime         = 24,
  yardMap            = "oooooooooo oooooooooo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo oooooooooo oooooooooo",
  buildoptions = {
    "euf_scout",
    "euf_interceptor",
    "euf_bomber",
	"euf_transport",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Big_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Big",
      "custom:SPARKLES",
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
      "airport_select",
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
    description        = "Wrecked Airport",
    footprintX         = 10,
    footprintZ         = 10,
    height             = "60",
    hitdensity         = "100",
    metal              = 375,
    object             = "euf_airport_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 188,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
