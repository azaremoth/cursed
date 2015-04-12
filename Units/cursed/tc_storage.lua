--------------------------------------------------------------------------------

local unitName = "tc_storage"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 200,
  buildCostMetal     = 200,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_storage.jpg",
  buildTime          = 200,
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_storage_normal.png",
	normalmaps = "yes",	
	growingcreep = true,	
    helptext = "This is a storage for metal and energy."
	},
	
  description        = "Provides energy and metal storage",
  --  energyMake         = 0,
  energyStorage      = 250,
  metalStorage       = 125,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "square",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1500,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Puzzzle Box",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_storage.s3o",
  onoffable          = false,
  radarDistance      = 64,
  script			 = "tc_storage.lua",  
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "ENERGY",
  unitname           = "tc_storage",
  useBuildingGroundDecal = true,
  yardMap            = "oooo oooo oooo oooo",
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
    description        = "Wrecked Cube",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 100,
    object             = "tc_storage_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
