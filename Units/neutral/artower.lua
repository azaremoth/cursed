--------------------------------------------------------------------------------

local unitName = "artower"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildTime          = 700,
  buildPic           = "NULL.png",  
  category           = "EUF LAND HEAVYARMOR",
  canstop            = true,
  cantBeTransported  = true,  
  useFootPrintCollisionVolume = true,  
  customParams          = {
		factionname		   	= "neutral",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",		
		helptext 			= "Noone will tell you what this tower was built for."
  },
  description        = "An experimental tower",
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
  name               = "Argent Tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "features/artower.s3o",
  onoffable          = false,
  radarDistance      = 1500,
  script             = "artower.lua",  
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
      "custom:NUKE_150",
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

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
