-- UNITDEF -- EUF_SOLAR --
--------------------------------------------------------------------------------

local unitName = "euf_solar"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 160,
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 7,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = "euf_groundplate3.png",  
  buildTime          = 160,
  buildPic           = "euf_solar.png",  
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",   
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_solar_normal.png",
	normalmaps = "yes",			
    helptext = "This is the basic energy supply."
	},
  description        = "Generates Energy",
  energyMake         = 10,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "energy",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 800,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Solar Collector",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_solar.s3o",
  onoffable          = true,
  radarDistance      = 0,
  script             = "euf_solar.cob",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_solar",
  useBuildingGroundDecal = true,  
  yardMap            = "oooo oooo oooo oooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
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
    description        = "Wrecked Solar",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "30",
    hitdensity         = "100",
    metal              = 80,
    object             = "euf_solar_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
