-- UNITDEF -- TC_SOULCAGE --
--------------------------------------------------------------------------------

local unitName = "tc_soulcage"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildTime          = 1000,
  
  buildingGroundDecalDecaySpeed = 0.001,
  buildingGroundDecalSizeX = 16,
  buildingGroundDecalSizeY = 16,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_soulcage.png",
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	growingcreep = true,	
	normaltex = "unittextures/normalmaps/tc_soulcage_normal.png",
	normalmaps = "yes",		
    helptext = "This is the advanced energy supply."	
	},
  description        = "Creates more soul energy",
  energyMake         = 150,
  energyStorage      = 0,
  explodeAs          = "BIG_EXPLOSION_GREEN",
  footprintX         = 8,
  footprintZ         = 5,
  iconType           = "bigenergy",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3000,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  name               = "Soul Cage",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Soulcage.s3o",
  onoffable          = false,
  radarDistance      = 64,
  selfDestructAs     = "BIG_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "ENERGY",
  unitname           = "tc_soulcage",
  useBuildingGroundDecal = true,
  yardMap            = "oooooooooooooooooooooooooooooooooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Soulcage_Groundflash",
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
    damage             = 8000,
    description        = "Wrecked Soulcage",
    footprintX         = 8,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 1000,
    object             = "TC_Soulcage_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 500,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
