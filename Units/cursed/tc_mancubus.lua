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
  buildPic           = "TC_Mancubus.jpg",
  buildTime          = 550,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	isinfantry = "true",	
	normaltex = "unittextures/normalmaps/tc_mancubus_normal.png",
	normalmaps = "yes",
    helptext 	= "The mancubus is a slow but enduring combat unit with a dual plasma gun."
  },
  defaultmissiontype = "Standby",
  description        = "Combat",
  --  energyMake         = "-2",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  highTrajectory     = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 8,
  idleTime           = 300,
  mass               = 3000,
  maxDamage          = 4500,
  maxSlope           = 14,
  maxVelocity        = 1.7,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "WALKER2X2",
  name               = "Mancubus",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Mancubus.s3o",
  repairable         = false,     
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
      onlyTargetCategory = "LAND AIR",
    },
    [2]  = {
      badTargetCategory = "LIGHTARMOR",
      def                = "Mancubus_Cannon",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Mancubus_Cannon = {
    accuracy           = 920,
    alphaDecay         = 0.5,
    areaOfEffect       = 75,
    gravityAffected          = true,
    energypershot           = 0,	
    explosionGenerator = "custom:Mancubus_Hit_Explosion",
    interceptedByShieldType = 1,
    model              = "plasma_green.s3o",	
    movingAccuracy     = 1620,
    name               = "Plasma Cannon",
    range              = 450,
    reloadtime         = 1.7,
    -- rendertype         = 4,
    rgbColor           = "0.8745 1 0.1568",
    separation         = 0.44,
    size               = 0.1,
    sizeDecay          = -0.55,
    soundHit           = "mediumexplosion",
    soundStart         = "mancubus_shot",
    stages             = 0,
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 260,
    damage = {
      default            = 140,
      flyer              = 140*0.33,
      heavy              = 140,
      light              = (140*0.75),
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
