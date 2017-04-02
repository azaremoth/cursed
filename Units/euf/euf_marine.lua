-- UNITDEF -- EUF_MARINE --
--------------------------------------------------------------------------------

local unitName = "euf_marine"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 150,
  buildCostMetal     = 150,
  buildPic           = "euf_marine.png",
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
	factionname	= "imperials",
	isinfantry = "true",
	canbetransported = "true",
    helptext 	= "Basic combat unit. It can shoot airborne targets."
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
  maxDamage          = 900,
  maxSlope           = 20,
  maxVelocity        = 2.2,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Marine",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "",
  objectName         = "euf_marine.s3o",
  radarDistance      = 512,
  repairable         = false,
  script             = "euf_marine.lua",
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
  unitname           = "euf_marine",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:blood_spray",
	  },
  },
	sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
    arrived = {
      "",
    },
    cant = {
      "cannot",
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
      "marine_move",
    },
    select = {
      "marine_select",
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
    accuracy           = 128,
    areaOfEffect       = 16,
	cylinderTargeting = 128,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,
    interceptedByShieldType = 1,
    name               = "Marine Gun",
    range              = 330,
    reloadtime         = 1.6,
    soundStart         = "marine_gunshot",
    soundStartVolume   = 15,
    soundTrigger       = true,
	sweepFire = true,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 1600,
--	burst --------------------------------------------------
	burst = 5,
	burstrate = 0.075,
	sprayangle = 1024,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	  
    damage = {
      default            = 30,
      flyer              = (30*0.75),
      heavy              = (30*0.75),
      light              = 30,
    },
  },
  ASSAULT_RIFLE_BUNKER = {
    avoidFriendly      = false,
	burnblow = 0,
	collideFriendly    = false,
    accuracy           = 128,
    areaOfEffect       = 16,
	cylinderTargeting = 128,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,	
    interceptedByShieldType = 1,
    name               = "Marine Gun Bunkered",
    range              = 330,
    reloadtime         = 1.6,
    soundStart         = "marine_gunshot",
    soundStartVolume   = 15,
    soundTrigger       = true,
	sweepFire = true,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 1600,
--	burst --------------------------------------------------
	burst = 5,
	burstrate = 0.075,
	sprayangle = 1024,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	  
    damage = {
      default            = 30,
      flyer              = (30*0.75),
      heavy              = (30*0.75),
      light              = 30,
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
    description        = "Dead marine",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_marine_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
