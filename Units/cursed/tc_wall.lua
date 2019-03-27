-- UNITDEF -- TC_TEETH --
--------------------------------------------------------------------------------

local unitName = "tc_teeth"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 10,
  buildCostMetal     = 10,
  buildPic           = "tc_teeth.png",
  buildTime          = 10,
  category           = "CURSED LAND HEAVYARMOR",
  customParams          = {	factionname		   = "cursed",  },
  description        = "Perimeter Defense",
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = false,
  maxDamage          = 2400,
  maxSlope           = 45,
  maxWaterDepth      = 35,
  name               = "Teeth",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "features/tc_wall_lvl1_1.s3o",
  script             = "tc_wall.lua",   
  radarDistance      = 16,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "tc_teeth",
  yardMap            = "f",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",  
  sfxtypes = {
    explosiongenerators = {
      "custom:Greycloud",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
