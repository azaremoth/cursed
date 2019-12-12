-- UNITDEF -- euf_bazooka --
--------------------------------------------------------------------------------

local unitName = "euf_bazooka"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 240,
  buildCostMetal     = 240,
  buildPic           = "euf_bazooka.png",
  buildTime          = 240,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canBeCloaked       = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
    helptext = "The Ripper bazooka trooper is very effective against heavily armored units and buildings. His long range makes him the ideal choice against light defenses."	
	},  
  defaultmissiontype = "Standby",
  description        = "Building Killer",  
  --  energyMake         = "-1",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 550,
  maxDamage          = 700,
  maxSlope           = 20,
  maxVelocity        = 1.8,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Ripper",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_bazooka.s3o",
  radarDistance      = 512,
  repairable         = false,   
  script             = "euf_bazooka.lua",
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
  unitname           = "euf_bazooka",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:RIPPERGUNFLARE",
      "custom:RIPPERGROUNDFLASH",
      "custom:blood_spray",
      "custom:FLAKImpact",
    },
  },
	sounds = {
		canceldestruct     = "",
		underattack        = "voices_emergency",
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
		  "marine_move",
		},
		select = {
		  "marine_select",
		},
	  },  
  weapons = {
    [1]  = {
      def                = "RIPPER",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND",
      badTargetCategory = "AIR LIGHTARMOR",	  
    },
    [2]  = {
      def                = "RIPPER_BUNKER",
      onlyTargetCategory = "LAND",
      badTargetCategory = "AIR LIGHTARMOR",	  
    },	
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  RIPPER = {
    name               = "Ripper Plasma Cannon",  
    avoidFeature       = false,
    avoidFriendly      = true,
    collideFeature     = true,
    collideFriendly    = true,
--  General	----------------------------------------------		
	accuracy           = 800,
    areaOfEffect       = 45,
    range              = 650,
    reloadtime         = 2,	
    burnblow           = false,
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
    energypershot           = 0,
    explosionGenerator = "custom:SMALL_EXPLOSION_PURPLE",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 0,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    myGravity          = 0.15,
    startVelocity      = 600,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    turret             = true,
    weaponAcceleration = 0,
    weaponVelocity     = 600,
	noSelfDamage       = false,
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "heatray_fire5",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
    cegtag			   = "RIPPERTrail",	
	RGBColor		   = "1.00 0.25 0.47",	
--	Weaponspecial ------------------------------------------ 
    flightTime         = 1.5,
    model              = "plasma_purple.s3o",
    heightBoostFactor  = 0,
    tracks             = false,
    trajectoryHeight   = 0.65,
    weaponType         = "MissileLauncher",	
------------------------------------------------------------
    damage = {
      default            = 115,
      flyer              = 115*0.33,
      heavy              = 115,
      light              = 115*0.75,
    },
  },  
  RIPPER_BUNKER = {
    name               = "Ripper Plasma Cannon (Bunker)",  
    avoidFeature       = false,
    avoidFriendly      = true,
    collideFeature     = true,
    collideFriendly    = true,
--  General	----------------------------------------------		
	accuracy           = 800,
    areaOfEffect       = 45,
    range              = 650,
    reloadtime         = 2,	
    burnblow           = false,
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
    energypershot           = 0,
    explosionGenerator = "custom:SMALL_EXPLOSION_PURPLE",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 0,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    myGravity          = 0.15,
    startVelocity      = 600,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    turret             = true,
    weaponAcceleration = 0,
    weaponVelocity     = 600,
	noSelfDamage       = false,
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "heatray_fire5",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
    cegtag			   = "RIPPERTrail",	
	RGBColor		   = "1.00 0.25 0.47",	
--	Weaponspecial ------------------------------------------ 
    flightTime         = 1.5,
    model              = "Skull_glow.s3o",
    heightBoostFactor  = 0,
    tracks             = false,
    trajectoryHeight   = 0.65,
    weaponType         = "MissileLauncher",	
------------------------------------------------------------
    damage = {
      default            = 170,
      flyer              = 170*0.33,
      heavy              = 170,
      light              = (170*0.75),
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
		resurrectintounit	= "tc_undeadmarine_melee",
		featuredecaytime	= "60"		
	},  
    damage             = 300,
    description        = "Dead Ripper",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_bazooka_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------