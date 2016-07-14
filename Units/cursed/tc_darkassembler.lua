-- UNITDEF -- TC_DARKASSEMBLER --
--------------------------------------------------------------------------------

local unitName = "tc_darkassembler"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 730,
  buildCostMetal     = 730,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_darkassembler.png",
  buildTime          = 730,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_darkassembler_normal.png",
	normalmaps = "yes",		
    helptext = "Various aircrafts can be build here."	
	},
  description        = "Produces Flying Units",
  explodeAs          = "BIG_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1850,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Dark Assembler",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Darkassembler.s3o",
  radarDistance      = 64,
  selfDestructAs     = "BIG_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_darkassembler",
  useBuildingGroundDecal = true,
  workerTime         = 25,
  yardMap            = "oooooooo oooooooo occcccco occcccco occcccco occcccco oooooooo oooooooo",
  buildoptions = {
    "tc_seeker",
    "tc_blade",
    "tc_redeemer",
    "tc_acranius",	
    "tc_sledgehammer",	
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Big_Explosion_Green",
      "custom:PORTALSPIKES",
      "custom:DarkAssembler_Laser",
      "custom:Structurebuilding_Big",
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
      "dark_airport_select",
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
    description        = "Wrecked Assembler",
    footprintX         = 8,
    footprintZ         = 8,
    height             = "60",
    hitdensity         = "100",
    metal              = 375,
    object             = "TC_Darkassembler_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 188,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
