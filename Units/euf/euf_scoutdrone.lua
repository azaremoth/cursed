--------------------------------------------------------------------------------

local unitName = "euf_scoutdrone"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 100,
  buildCostMetal     = 100,
  buildPic           = "euf_scoutdrone.png",
  buildTime          = 100,
  canAssist          = false,
  canAttack          = false,
  canBeAssisted      = false,
  canBeCloaked       = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
--  corpse             = "dead",
  customParams          = {
	factionname	= "imperials",
    helptext 	= "Basic scouting unit."
  },
  defaultmissiontype = "Standby",
  description        = "Scout drone",  
  --  energyMake         = "-0.5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 500,
  maxSlope           = 20,
  maxVelocity        = 4.0,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "TANKHOVER2x2",
  name               = "Scout droid",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_scoutdrone.s3o",
  radarDistance      = 768,
  repairable         = true,
  script             = "euf_scoutdrone.lua",
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 768,
  smoothAnim         = false,
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "euf_scoutdrone",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:TINY_EXPLOSION_YELLOW",
	  },
  },
	sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
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
      "voices_yes",
    },
    select = {
      "voices_engrdy",
    },
  },  
  weapons = {  },
}

-------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
