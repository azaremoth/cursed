-- UNITDEF -- TC_PESTILENCE --
--------------------------------------------------------------------------------

local unitName = "tc_pestilence"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "tc_pestilence.png",
  buildTime          = 500,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  customParams          = {
	isinfantry = "true",  
	factionname	= "cursed",
	canburrow      = "true",
	cankamakazi = "true",
	normaltex = "unittextures/normalmaps/tc_pestilence_normal.png",
	normalmaps = "yes",	
    helptext 	= "Generates 3 devastating suicide blobs after death and has a decaying aura."	
  },
  defaultmissiontype = "Standby",
  description        = "Generates suicide blobs after death",
  --  energyMake         = "-2.5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "bigcircle",
  idleAutoHeal       = 6,
  idleTime           = 300,
  mass               = 3000,
  maxDamage          = 1200,
  maxSlope           = 14,
  maxVelocity        = 1.75,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Pestilence",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_pestilence.s3o",
  repairable         = false,       
  script             = 'tc_pestilence.lua',
  selfDestructAs     = "NULL",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 384,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1005,
  unitname           = "tc_pestilence",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING_BIGGER",
      "custom:REDGREENBLOOD_EXPLOSION",
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
      "pestilence_select",
    },
    select = {
      "pestilence_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
