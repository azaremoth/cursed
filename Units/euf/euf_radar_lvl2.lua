-- UNITDEF -- euf_radar_lvl2 --
--------------------------------------------------------------------------------

local unitName = "euf_radar_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 350,
  buildCostMetal     = 350,
  buildTime          = 350,

--buildingGroundDecalDecaySpeed = 0.2,
--  buildingGroundDecalSizeX = 3,
--  buildingGroundDecalSizeY = 3,
--  buildingGroundDecalType = "euf_radar_lvl1_aoplane.dds",
--  useBuildingGroundDecal = true,     
  
  buildPic           = "euf_radar_lvl2.png",    
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",   
  customParams          = {	
		factionname		   	= "imperials",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
		helptext 			= "Advanced radar with increased range."	
	},
  description        = "Detektion Technology",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 250,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Advanced Radar Tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_radar_lvl2.s3o",
  onoffable          = false,
  radarDistance      = 3840, -- was 3072
  script             = "euf_radar_lvl2.cob",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  sonarDistance      = 3840,
  unitname           = "euf_radar_lvl2",
  yardMap            = "o",
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
      "radar_select",
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
    description        = "Wrecked Advanced Radar",
    footprintX         = 1,
    footprintZ         = 1,
    height             = "50",
    hitdensity         = "100",
    metal              = 175,
    object             = "euf_radar_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 88,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
