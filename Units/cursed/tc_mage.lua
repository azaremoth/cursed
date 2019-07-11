-- UNITDEF -- tc_mage --
--------------------------------------------------------------------------------

local unitName = "tc_mage"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  brakeRate          = 1.5,
  buildCostEnergy    = 200,
  buildCostMetal     = 200,
  buildPic           = "tc_mage.png",
  buildTime          = 200,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = true,
  cantBeTransported  = false, 
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	isinfantry = "true",
	isbones = "true",	
    canjump        = [[1]],
	canburrow      = "true",	
	jumpclass = [[mage]],	
	factionname		   = "cursed",
    helptext = "The skeletal mage is useful for devasting surprises due to its teleport spell. It can teleport and has AA abilities. The magic bolts can penetrate shields and pass through allied units, water and obstacles."
  },
  defaultmissiontype = "Standby",
  description        = "AA, can penetrate shields, can teleport",
  --  energyMake         = "-0.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 880,
  maxSlope           = 20,
  maxVelocity        = 2,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Skeletal Mage",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_mage.s3o",
  repairable         = false,     
  script             = 'tc_mage.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "tc_mage",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING",
      "custom:SPIKES_MAGE",
      "custom:BALL_MAGE",
      "custom:zapimpact",	  
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "skeleton3",
    arrived = {
      "skeleton2",
    },
    cant = {
      "skeleton3",
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
      "skeleton2",
    },
    select = {
      "skeleton1",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "MAGICBOLTS",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  MAGICBOLTS = {
    accuracy           = 1200,
    areaOfEffect       = 50,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    burnblow           = false,
    cegTag             = "SPIKES_MAGE",
    collideFeature     = false,
    collideFriendly    = false,
    collideneutral     = "0",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 128,
    dance              = 75,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:Black_explosion",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    flightTime         = 3,
    heightmod	     = 0,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 2,
    model              = "empty.s3o",
    myGravity          = 0.4,
    name               = "Rockets",
    --noSelfDamage       = true,
    projectiles	     = 2,
    range              = 325,
    reloadtime         = 4,
    soundHit           = "weirdbreath",
    soundHitVolume     = 50,
    soundStart         = "magicboltboom",
    soundStartVolume   = 50,
    soundTrigger       = false,
    startVelocity      = 250,
    targetBorder       = 0,
    targetMoveError    = 0.1,
    tolerance          = 20,
    tracks             = true,
    trajectoryHeight   = 0.4,
    turnRate           = 8000,
    turret             = true,
    waterweapon        = true,	
    weaponAcceleration = 350,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 500,
    damage = {
      default            = 120,
      flyer              = 120,
      heavy              = 120,
      light              = (120*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_ghoul",
		featuredecaytime		= "60"
	},  
    damage             = 300,
    mass               = 1100,	
    description        = "Mage Skeleton",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "tc_mage_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
