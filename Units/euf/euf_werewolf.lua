-- UNITDEF -- euf_werewolf --
--------------------------------------------------------------------------------

local unitName = "euf_werewolf"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.5,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildPic           = "euf_werewolf.png",
  buildTime          = 1000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "20 40 20",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
	canbetransported = "true",
	helptext = "Sometimes a priest in wolf form gets a second chance to live and turns into a werewolf after dying."
  },   
  defaultmissiontype = "Standby",
  description        = "Fast Melee Unit",
  --  energyMake         = "0",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 3000,
  maxDamage          = 2500,
  maxSlope           = 14,
  maxVelocity        = 3,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Werewolf",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_werewolf.s3o",
  radarDistance      = 512,
  script             = "euf_werewolf.lua",    
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  unitname           = "euf_werewolf",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
    arrived = {
      "werewolf_select",
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
      "werewolf_select",
    },
    select = {
      "werewolf_select",
    },
  },
  weapons = {
    [1]  = {
      name                = "WEREWOLFMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
	  badTargetCategory = "AIR HEAVYARMOR",
      onlyTargetCategory = "LAND",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
