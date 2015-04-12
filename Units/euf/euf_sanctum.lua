-- UNITDEF -- euf_sanctum --
--------------------------------------------------------------------------------

local unitName = "euf_sanctum"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 800,
  buildCostMetal     = 800,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 7,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = "euf_sanctum_aoplane.png",  
  useBuildingGroundDecal = true,
  buildTime          = 800,
  buildPic           = "euf_sanctum.png",  
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	ProvideTech         = "Divine Help",
	factionname		   = "imperials",
    helptext = "This statue will ensure divine support. Enables angels."
  },
  description        = "Enables angels",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 5000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Sanctum",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_sanctum.s3o",
  onoffable          = false,
  radarDistance      = 0,
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_sanctum",
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
  explosiongenerators = {
      "custom:EUF_Structurebuilding_Medium",
      "custom:Small_Explosion_YELLOW",	  
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
    damage             = 1000,
    description        = "Wrecked Sanctum",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 400,
    object             = "euf_sanctum_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
