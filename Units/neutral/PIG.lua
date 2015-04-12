--------------------------------------------------------------------------------
local unitName = "pig"
--------------------------------------------------------------------------------

local unitDef = {
---------------------------FOR NEUTRAL UNITS------------------------------------
  hidedamage 		= true,
  stealth 			= true,
  gaia 				= true,
  neutral 			= true,
--------------------------------------------------------------------------------
  acceleration       = 3,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 10,
  buildCostMetal     = 10,
  buildPic           = "pig.png",
  buildTime          = 10,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "LAND LIGHTARMOR",
        customParams   = {	
		factionname	   = "neutral",
		harmlesscritter	   = "true",
		},
  defaultmissiontype = "Standby",
  description        = "It is a pig",
  energyUse          = 0,
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "neverseeme",
  idleAutoHeal       = 2.5,
  idleTime           = 200,
  kamikaze           = false,
  mass               = 3000,
  maxDamage          = 800,
  maxSlope           = 25,
  maxVelocity        = 3.5,
  maxWaterDepth      = 5,
  mobilestandorders  = 2,
  standingmoveorder  = 2,
  movementClass      = "Trooper1X1",
  name               = "Pig",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "pig.s3o",
  onlytargetcategory1 = "LAND",
  radarDistance      = 512,
  selfDestructAs     = "BLOOD_EXPLOSION",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  
  script = 'pig.lua',
  
  side               = "neutral",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1750,
  unitname           = "pig",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:BLOOD_EXPLOSION",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
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
      "pig_select",
    },
    select = {
      "pig_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
