-- UNITDEF -- TC_SOULSTONE --
--------------------------------------------------------------------------------

local unitName = "tc_soulstone"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 160,
  buildingGroundDecalDecaySpeed = 0.001,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 10,
  buildingGroundDecalType = "tc_groundplatesm.png",
  buildPic           = "tc_soulstone.png",
  buildTime          = 160,
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,
  useFootPrintCollisionVolume = true,
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	growingcreep = true,
	normaltex = "unittextures/normalmaps/tc_soulstone_normal.png",
	normalmaps = "yes",	
    helptext = "This is the basic energy supply."
	},
  description        = "Creates soul energy",
  energyMake         = 10,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = "energy",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 800,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Soul Stone",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Soulstone.s3o",
  onoffable          = false,
  radarDistance      = 64,
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "ENERGY",
  unitname           = "tc_soulstone",
  useBuildingGroundDecal = true,
  yardMap            = "ooooooooooooooooooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Medium",
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
    description        = "Wrecked Soulstone",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 80,
    object             = "TC_Soulstone_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
