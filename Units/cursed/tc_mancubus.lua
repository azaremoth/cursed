-- UNITDEF -- TC_MANCUBUS --
--------------------------------------------------------------------------------

local unitName = "tc_mancubus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.75,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.83105,
  buildCostEnergy    = 550,
  buildCostMetal     = 550,
  buildPic           = "tc_mancubus.png",
  buildTime          = 550,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	isinfantry = "true",	
	normaltex = "unittextures/normalmaps/tc_mancubus_normal.png",
	normalmaps = "yes",
    helptext 	= "The Moloch demon is a slow but enduring combat unit with a dual plasma gun."
  },
  defaultmissiontype = "Standby",
  description        = "Combat",
  --  energyMake         = "-2",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  -- highTrajectory     = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 8,
  idleTime           = 300,
  mass               = 3000,
  maxDamage          = 4500, --4500
  maxSlope           = 14,
  maxVelocity        = 1.7,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "WALKER2X2",
  name               = "Moloch",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Mancubus.s3o",
  repairable         = false,
  script             = 'tc_mancubus.lua',  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 640,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 350,
  unitname           = "tc_mancubus",
  upright            = true,

  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGER",
      "custom:BLOOD_EXPLOSION_BIG",
      "custom:GunGroundFlash_Small",
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
      "gatekeeper",
    },
    select = {
      "gatekeeper",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory = "LIGHTARMOR",
      def                = "Mancubus_Cannon",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory = "LIGHTARMOR",
      def                = "Mancubus_Cannon",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Mancubus_Cannon = {
    accuracy           = 920,
    areaOfEffect       = 128, --75
	burnblow           = true,	
    gravityAffected          = false,
    energypershot           = 0,	
    explosionGenerator = "custom:hellfire",
    interceptedByShieldType = 1,	
    movingAccuracy     = 1620,
    name               = "Hellfire PLasma",
    range              = 300, --450
    reloadtime         = 1.5,
    soundHit           = "mediumexplosion",
    soundStart         = "mancubus_shot",
    targetMoveError    = 0.2,	
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 450, --240
	-----------
    size               = 8.0, --0.1
	colorMap 			= "0.8745 1 0.16 1.0 1.0 0.75 0.16 1.0",
	cegTag				= [[DRAGONFLAMETRAIL]],	
	model              = "plasma_green.s3o",
	-----------
    damage = {
      default            = 180, --150
      flyer              = 180,
      heavy              = 180,
      light              = 180,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,
    blocking           = true,
	customParams          = {
		featuredecaytime	= "120",	
		resurrectintounit	= "tc_mancubus"	
	},  
    damage             = 8000,
    description        = "Former Mancubus",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "tc_mancubus_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
