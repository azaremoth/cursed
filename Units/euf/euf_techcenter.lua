-- UNITDEF -- euf_techcenter --
--------------------------------------------------------------------------------

local unitName = "euf_techcenter"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildingGroundDecalDecaySpeed = 0.0,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 9,
  buildingGroundDecalType = "euf_groundplate.png",  
  buildTime          = 700,
  buildPic           = "euf_techcenter.png",  
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {
	factionname		   = "imperials",
	ProvideTech         = "Advanced Technology",
	normaltex = "unittextures/normalmaps/euf_techcenter_normal.png",
	normalmaps = "yes",				
    helptext = "Enables diggers, walkers and MLRS. Can be upgraded with a shield generator or nuke launch base."
  },
  description        = "Enables advanced Technology for diggers, walkers and MLRS",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 5000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Technology Center",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_techcenter.s3o",
  onoffable          = false,
  radarDistance      = 1500,
  script             = "euf_techcenter.lua",  
  selfDestructAs     = "BIG_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_techcenter",
  useBuildingGroundDecal = true,  
  yardMap            = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
  sfxtypes = {
  explosiongenerators = {
      "custom:Big_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Medium",
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
    description        = "Wrecked Technology Center",
    footprintX         = 8,
    footprintZ         = 8,
    height             = "30",
    hitdensity         = "100",
    metal              = 350,
    object             = "euf_techcenter_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
