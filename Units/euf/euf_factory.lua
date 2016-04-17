-- UNITDEF -- euf_factory --
--------------------------------------------------------------------------------

local unitName = "euf_factory"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 750,
  buildCostMetal     = 750,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 13,
  buildingGroundDecalType = "euf_factory_aoplane.dds",
  buildPic           = "euf_factory.png",
  buildTime          = 750,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
--  collisionVolumeType 		= "Box",
--  collisionVolumeScales 	= "165 100 160",
--  collisionVolumeOffsets 	= "0 0 0",
  useFootPrintCollisionVolume = true, 
  corpse             = "dead",
    customParams          = {
		blinking = 0.8,		
		factionname		   = "imperials",
		RequireTech         = "Barracks",
		ProvideTech         = "Factory",
		normaltex = "unittextures/normalmaps/euf_factory_normal.png",
		normalmaps = "yes",			
		helptext = "Various engines of destruction and advanced builderoids can be build here. In this building essential parts for high-tech devices are produced that are needed for the equipment of snipers and paladins."	
		},
  description        = "Produces Heavy Weapons. Enables snipers and paladins.",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 12,
  footprintZ         = 12,
  iconType           = "bigsquare",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2690,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "War Factory",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_factory.s3o",
  radarDistance      = 64,
  script             = "euf_factory.cob",  
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "euf_factory",
  useBuildingGroundDecal = true,
  workerTime         = 25,
  yardMap            = "oooooooooooo oooooooooooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo",
  buildoptions = {
    "euf_constructor_lvl2", 
    "euf_sensorbot",
    "euf_raider",
	"euf_hover",
    "euf_aatank",
    "euf_tank",
    "euf_scorpion",
    "euf_mlrs",	
    "euf_walker",		
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Big",
      "custom:FactorySmoke",
      "custom:SPARKLES",		  
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
      "war_factory_select",
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
    description        = "Wrecked Factory",
    footprintX         = 12,
    footprintZ         = 12,
    height             = "50",
    hitdensity         = "100",
    metal              = 375,
    object             = "euf_factory_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 375,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
