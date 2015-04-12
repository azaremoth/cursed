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
  buildPic           = "TC_Rictus.jpg",
  buildTime          = 700,
  canAttack          = true,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
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
  movementClass      = "TANKHOVER2x2",
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
    underattack        = "skeleton2",
    arrived = {
      "skeleton1",
    },
    cant = {
      "skeleton2",
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
      "skeleton1",
    },
    select = {
      "skeleton1",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR AIR",
      def                = "RictusFlamethrower",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  RictusFlamethrower = {
    accuracy           = 50,
    areaOfEffect       = 60,
    beamWeapon         = true,
    burnblow           = true,
    cegTag             = "RICTUSFLAMETHROWER",
    coreThickness      = 0,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.03,
      energypershot           = 0,	
    explosionGenerator = "custom:RICTUSFLAMEEXPLOSION",
    guidance           = false,
    impulseBoost       = 0,
    intensity          = 0.5,
    lineOfSight        = true,
    name               = "Hellfire",
    range              = 300,
    reloadtime         = 0.2,
    renderType         = 0,
    rgbColor           = "0.6 1 0.1568",
    selfprop           = true,
    soundStart         = "Rictus_Fire",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startsmoke         = "0",
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
    damage = {
      default            = 44,
      flyer              = 44*0.33,
      heavy              = (44*0.75),
      light              = 44,
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
