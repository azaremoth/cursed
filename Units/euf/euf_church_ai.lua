-- UNITDEF -- euf_church --
--------------------------------------------------------------------------------

local unitName = "euf_church_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 15,
  buildingGroundDecalSizeY = 15,
  buildingGroundDecalType = "euf_church_aoplane.png",
  useBuildingGroundDecal = true,  
  buildPic           = "euf_church.png",
  buildTime          = 400,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  capturable         = false, 
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true, 
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_church_normal.png",
	normalmaps = "yes",		
    helptext = "Priests and paladins can be build here."	
	},
  description        = "Produces priests and paladins",
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
  name               = "Church",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_church.s3o",
  radarDistance      = 64,
  script             = "euf_church.cob",  
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "euf_church_ai",
  workerTime         = 10,
  yardMap            = "oooooooooooo oooooooooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo oooooccooooo",
  buildoptions = {
    "euf_priest",
    "euf_paladin_ai",		
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Big",
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
      "priest_select",
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
    description        = "Wrecked Church",
    footprintX         = 12,
    footprintZ         = 12,
    height             = "50",
    hitdensity         = "100",
    metal              = 175,
    object             = "euf_church_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 88,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
