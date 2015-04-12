-- UNITDEF -- euf_barracks --
--------------------------------------------------------------------------------

local unitName = "euf_barracks_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 13,
  buildingGroundDecalType = "euf_barracks_aoplane.dds",
  buildPic           = "euf_barracks.png",
  buildTime          = 400,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "120 100 160",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
--  corpse             = "dead",
    customParams          = {	
		blinking = 0.8,		
		factionname		   = "imperials",
		ProvideTech         = "Barracks",
		normaltex = "unittextures/normalmaps/euf_barracks_normal.png",
		normalmaps = "yes",			
		helptext = "Various soldiers and the builderoids can be build here."			
		},
  description        = "Produces Soldiers",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 8,
  footprintZ         = 12,
  iconType           = "bigsquare",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2690,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Barracks",
  nanoColor          = "0.27 1 1",
  noAutoFire         = false,
  objectName         = "euf_barracks.s3o",
  radarDistance      = 64,
  script             = 'euf_barracks.cob',  
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
  yardMap            = "oooooooo oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo",
  buildoptions = {
    "euf_constructor_ai",
    "euf_scoutdrone",	
    "euf_marine",
    "euf_bazooka",
    "euf_pyro",
    "euf_sniper_ai",
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

--[[local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},  		
    damage             = 40000,
    description        = "Wrecked Barracks",
    footprintX         = 8,
    footprintZ         = 12,
    height             = "50",
    hitdensity         = "100",
    metal              = 175,
    object             = "euf_barracks_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 88,
  },
}
unitDef.featureDefs = featureDefs]]--


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
