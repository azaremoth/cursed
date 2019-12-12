-- UNITDEF -- TC_RICTUS --
--------------------------------------------------------------------------------

local unitName = "tc_rictus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildPic           = "tc_rictus.png",
  buildTime          = 700,
  canAttack          = true,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
  customParams          = {
	factionname		   = "cursed",
	isbones = "true",	
    helptext 	= "The hovering rictus can travel across water and is a good choice against light armored targets."
  },
  defaultmissiontype = "Standby",
  description        = "Hovering burning death",
  --  energyMake         = "-2.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  highTrajectory     = 0,
  iconType           = "bigsquare",
  idleAutoHeal       = 6,
  idleTime           = 300,
  crushResistance    = 2000,
  mass               = 300,
  maxDamage          = 3000,
  maxSlope           = 20,
  maxVelocity        = 3.3,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "SMALLHOVER2x2",
  name               = "Rictus",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Rictus.s3o",
  repairable         = false,     
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 384,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1005,
  unitname           = "tc_rictus",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGER",
      "custom:Greycloud",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "rictus",
    arrived = {
      "rictus",
    },
    cant = {
      "rictus",
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
      "rictus",
    },
    select = {
      "rictus",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR",
      def                = "RictusFlamethrower",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  RictusFlamethrower = {
    accuracy           = 50,
    areaOfEffect       = 60,
    -- beamweapon         = true,
    burnblow           = true,
    cegTag             = "RICTUSFLAMETHROWER",
    coreThickness      = 0,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.03,
      energypershot           = 0,	
    explosionGenerator = "custom:RICTUSFLAMEEXPLOSION",
    impulseBoost       = 0,
    intensity          = 0.5,
    -- lineofsight        = true,
    name               = "Hell Fire Breath",
    range              = 300,
    reloadtime         = 0.2,
    -- rendertype         = 0,
    rgbColor           = "0.6 1 0.1568",
    soundStart         = "Rictus_Fire",
	soundHit           = "null",	
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 200,
    texture1           = "null_texture",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 14,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 200,

	customParams            = {
				flamethrower = "1",
    },	
	
    damage = {
      default            = 22,
      flyer              = 22,
      heavy              = 22,
      light              = (22*2),
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
		resurrectintounit	= "tc_rictus",
		featuredecaytime	= "60"
	},  
    damage             = 8000,
    description        = "Former Rictus",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "tc_rictus_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
