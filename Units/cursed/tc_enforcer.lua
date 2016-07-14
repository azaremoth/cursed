-- UNITDEF -- tc_enforcer --
--------------------------------------------------------------------------------

local unitName = "tc_enforcer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 250,
  buildCostMetal     = 250,
  buildPic           = "tc_enforcer.png",
  buildTime          = 250,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 36 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname	= "cursed",
	isinfantry = "true",
	canbetransported = "true",
	isbones = "true",
	canburrow      = "true",	
    helptext 	= "Enforcers deal good damage against all targets."
  },
  defaultmissiontype = "Standby",
  description        = "Basic Combat Unit",
  --  energyMake         = "-0.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1100,
  maxSlope           = 20,
  maxVelocity        = 1.7,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Enforcer",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_enforcer.s3o",
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  repairable         = false,     
  resurrectSpeed     = 0,
  script             = 'tc_enforcer.lua',
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
  unitname           = "tc_enforcer",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING",
      "custom:GunGroundFlash_Small",
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
      def                = "ENFORCER_GUN",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ENFORCER_GUN = {
    name               = "Magic Missile",
      areaOfEffect            = 24,
      avoidFriendly           = false,
      burst                   = 3,
      burstrate               = 0.1,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
      dance                   = 60,
      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 0,
      fixedlauncher           = 1,
      flightTime              = 5,
      groundbounce            = 1,
      heightmod               = 0.5,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      -- lineofsight             = true,
      metalpershot            = 0,
      model              = "Skull_glow.s3o",
      --noSelfDamage            = true,
      range                   = 600,
      reloadtime              = 7,
      -- rendertype              = 1,
      smokeTrail              = true,
    soundHit           = "mediumexplosion",
    soundStart         = "launchrocket",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = false,	  
      startVelocity           = 250,
      texture1                = [[]],
      texture2                = [[sporetrail]],
      tolerance               = 10000,
      tracks                  = true,
      turnRate                = 24000,
      turret                  = true,
      waterweapon             = false,
      weaponAcceleration      = 100,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 500,
      wobble                  = 32000,
     damage = {
      default            = 100,
      flyer              = 100,
      heavy              = 100,
      light              = 100,
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
		resurrectintounit	= "tc_enforcer",
		featuredecaytime	= "60"
	},    
    damage             = 300,
    mass               = 1100,	
    description        = "Enforcer Skeleton",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "tc_enforcer_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
