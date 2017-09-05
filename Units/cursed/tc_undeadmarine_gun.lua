--------------------------------------------------------------------------------

local unitName = "tc_undeadmarine_gun"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 150,
  buildCostMetal     = 150,
  buildPic           = "tc_undeadmarine_gun.png",
  buildTime          = 150,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canBeCloaked       = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	canburrow      = "true",
	isinfantry = "true",
	isbones = "true",
	factionname	= "cursed",
    helptext 	= "Basic risen combat unit. It can shoot airborne targets."
  },
  defaultmissiontype = "Standby",
  description        = "Combat unit and AA",  
  --  energyMake         = "-0.5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1300,
  maxSlope           = 20,
  maxVelocity        = 1.6,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Risen marine",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_undeadmarine.s3o",
  radarDistance      = 512,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  repairable         = false,     
  resurrectSpeed     = 0,
  script             = 'tc_undeadmarine_gun.lua',
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "tc_undeadmarine_gun",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:blood_spray",
      "custom:BURROWING",	  
    },
  },
	sounds = {
    canceldestruct     = "",
    underattack        = "bell",
    arrived = {
      "",
    },
    cant = {
      "zombie_moan.ogg",
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
      "zombie_moan.ogg",
    },
    select = {
      "zombie_moan.ogg",
    },
  },  
  weapons = {
	[1]  = {
      def                = "ASSAULT_RIFLE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",	  
    },
    [2]  = {
      def                = "ASSAULT_RIFLE_BUNKER",
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",	    	  
	},
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ASSAULT_RIFLE = {
    avoidFriendly      = true,
    burnblow = 0,
	collideFriendly    = true,
    accuracy           = 256,
    areaOfEffect       = 16,
	cylinderTargeting = 1,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,
    interceptedByShieldType = 1,
    name               = "Marine Gun",
    range              = 300,
    reloadtime         = 1.6,
    soundStart         = "marine_gunshot",
	soundHit           = "null",		
    soundStartVolume   = 15,
    soundTrigger       = true,
	sweepFire = true,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	burst --------------------------------------------------
	burst = 5,
	burstrate = 0.075,
	sprayangle = 2048,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	  
    damage = {
      default            = 28,
      flyer              = (28*0.75),
      heavy              = (28*0.75),
      light              = 28,
    },
  },
  ASSAULT_RIFLE_BUNKER = {
    avoidFriendly      = false,
	burnblow = 0,
	collideFriendly    = false,
    accuracy           = 256,
    areaOfEffect       = 16,
	cylinderTargeting = 1,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,	
    interceptedByShieldType = 1,
    name               = "Marine Gun Bunkered",
    range              = 300,
    reloadtime         = 1.6,
    soundStart         = "marine_gunshot",
	soundHit           = "null",	
    soundStartVolume   = 15,
    soundTrigger       = true,
	sweepFire = true,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	burst --------------------------------------------------
	burst = 5,
	burstrate = 0.075,
	sprayangle = 2048,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	  
    damage = {
      default            = 28,
      flyer              = (28*0.75),
      heavy              = (28*0.75),
      light              = 28,
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
		resurrectintounit	= "tc_undeadmarine_gun",
		featuredecaytime	= "60"		
	},  
    damage             = 300,
    mass               = 1100,	
    description        = "Dead Marine",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_marine_dead.s3o",
    reclaimable        = false,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

