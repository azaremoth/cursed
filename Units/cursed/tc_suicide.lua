-- UNITDEF -- TC_SUICIDE --
--------------------------------------------------------------------------------

local unitName = "tc_suicide"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 3,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildPic           = "tc_suicide.png",
  buildTime          = 0,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  customParams          = {	
	factionname		   = "cursed",
	isinfantry = "true",
	canbetransported = "true",
	cankamakazi = "true",	
    helptext = "Caution: explodes spontaneously after a random time",
	resurrectintounit	= "tc_skeleton"		
	},
  defaultmissiontype = "Standby",
  description        = "suicide blob",
  explodeAs          = "SUICIDEBALL_BLAST",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  kamikaze           = true,
  kamikazeDistance   = 70,
  mass               = 1100,
  maxDamage          = 400,
  maxSlope           = 25,
  maxVelocity        = 5,
  maxWaterDepth      = 5,
  mobilestandorders  = "1",
  movementClass      = "Trooper1X1",
  name               = "Suicide Blob",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_suicide.s3o",
  onlytargetcategory1 = "LAND",
  radarDistance      = 512,
  repairable         = false,     
  selfDestructAs     = "SUICIDEBALL_BLAST",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1750,
  unitname           = "tc_suicide",
  sfxtypes = {
    explosiongenerators = {
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:TRACKED_FX",
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
      "slime",
    },
    select = {
      "slime",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
