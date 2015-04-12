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
    customParams          = {	factionname		   = "imperials",  },
  description        = "Perimeter Defense",
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = true,
  maxDamage          = 2400,
  maxSlope           = 45,
  maxWaterDepth      = 35,
  name               = "Perimeter Defense",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_wall.s3o",
  radarDistance      = 16,
  script             = 'euf_wall.lua',  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "euf_wall",
  yardMap            = "f",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",  
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALLRANDOMSMOKECLOUD",
    },
  },
}

-------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
