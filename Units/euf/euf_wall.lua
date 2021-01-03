-- UNITDEF -- euf_wall --
--------------------------------------------------------------------------------

local unitName = "euf_wall"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 10,
  buildCostMetal     = 10,
  buildPic           = "euf_wall.png",
  buildTime          = 10,
  category           = "EUF LAND HEAVYARMOR",
  canstop            = true,
    customParams          = {	factionname		   = "imperials",  },
  description        = "Light walls",
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2400,
  maxSlope           = 45,
  maxWaterDepth      = 35,
  name               = "Sandbags",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "features/euf_wall_lvl1_1.s3o",
  radarDistance      = 16,
  script             = "euf_wall.lua",  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "euf_wall",
  yardMap            = "f",
  explodeAs          = "SMOKE_EXPLOSION",
  selfDestructAs     = "SMOKE_EXPLOSION", 
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALLRANDOMSMOKECLOUD",
    },
  },
}

-------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
