-- UNITDEF -- TC_SUICIDE --
--------------------------------------------------------------------------------

local unitName = "euf_wolf"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 100,
  buildCostMetal     = 100,
  buildPic           = "euf_wolf.png",
  buildTime          = 100,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  customParams          = {	
	factionname		   = "imperials",
	isinfantry = "true",
	canbetransported = "true",
	helptext = "A priest in wolf form."
	},
  defaultmissiontype = "Standby",
  description        = "A wolf - quick guy",
  --  energyMake         = "-1",  
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  kamikaze           = false,
  mass               = 1100,
  maxDamage          = 500,
  maxSlope           = 25,
  maxVelocity        = 4.5,
  maxWaterDepth      = 5,
  mobilestandorders  = "1",
  movementClass      = "Trooper1X1",
  name               = "Wolf",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_wolf.s3o",
  onlytargetcategory1 = "LAND",
  radarDistance      = 512,
  script             = "euf_wolf.lua",  
  selfDestructAs     = "BLOOD_EXPLOSION",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1750,
  unitname           = "euf_wolf",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONDRAGON",	
      "custom:SUMMONDRAGON2",
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
      "wolf_select",
    },
    select = {
      "wolf_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
