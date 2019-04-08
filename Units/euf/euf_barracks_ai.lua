-- UNITDEF -- euf_barracks --
--------------------------------------------------------------------------------

local unitName = "euf_barracks_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 380,
  buildCostMetal     = 380,
  builder            = true,
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 13,
  buildingGroundDecalType = "euf_groundplate.png",
  buildPic           = "euf_barracks.png",
  buildTime          = 380,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  capturable         = false, 
  category           = "EUF LAND HEAVYARMOR", 
--  collisionVolumeType 		= "Box",
--  collisionVolumeScales 	= "120 100 160",
--  collisionVolumeOffsets 	= "0 0 0",
  useFootPrintCollisionVolume = true,
    corpse             = "dead",
    customParams          = {	
		blinking = 0.8,		
		factionname		   	= "imperials",
		ProvideTech         = "Barracks",
		normaltex 			= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 			= "yes",			
		helptext 			= "Various soldiers and the builderoids can be build here."			
		},
  description        = "Produces Soldiers",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 9,
  footprintZ         = 12,
  iconType           = "bigsquare",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2690,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Barracks (AI)",
  nanoColor          = "0.27 1 1",
  noAutoFire         = false,
  objectName         = "euf_barracks.s3o",
  radarDistance      = 64,
  script             = "euf_barracks.lua",   
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "euf_barracks_ai",
  useBuildingGroundDecal = true,
  workerTime         = 20,
  yardMap            = "ooooooooo ooooooooo ooooooooo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo",
  buildoptions = {
    "euf_constructor_ai",
    "euf_scoutdrone",	
    "euf_marine",
    "euf_bazooka",
    "euf_pyro",
    "euf_sniper_ai",
--    "euf_sarge",	
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Big",
      "custom:light_red",	 
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
    damage             = 40000,
    description        = "Wrecked Barracks",
    footprintX         = 9,
    footprintZ         = 12,
    height             = "50",
    hitdensity         = "100",
    metal              = 190,
    object             = "euf_barracks_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 88,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
