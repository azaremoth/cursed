-- UNITDEF -- euf_walker --
--------------------------------------------------------------------------------

local unitName = "euf_walker_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 1300,
  buildCostMetal     = 1300,
  buildPic           = "euf_walker.png",
  buildTime          = 1300,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "66 100 66",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
    customParams          = {	
		factionname		   = "imperials",
		normaltex = "unittextures/normalmaps/euf_walker_normal.png",
		normalmaps = "yes",		
		helptext = "The heavy walker is a perfect damage dealer against armored ground units and buildings."
	},
  defaultmissiontype = "Standby",
  description        = "Heavily armed Walker",
  --  energyMake         = "-5",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 30000,
  maxDamage          = 7000,
  maxSlope           = 10,
  maxVelocity        = 1.15,
  maxWaterDepth      = 25,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Walker",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_walker.s3o",
  script             = "euf_walker.cob",    
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 896,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
   
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[Walker]],
  trackWidth             = 55,   
  
  turnRate           = 750,
  unitname           = "euf_walker_ai",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:Greycloud",
      "custom:MEDIUM_EXPLOSION_YELLOW",
      "custom:WALKERGUNFLARE",
      "custom:WALKERGROUNDFLASH",
      "custom:BERTHAFLARE",	  
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_emergency",
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
      "voices_dark_enemyeng",
    },
    select = {
      "voices_dark_sysrdy",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",
      def                = "WALKERLIGHT",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND AIR",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR AIR",
      def                = "WALKERHEAVY",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  WALKERLIGHT = {
      name                    = [[Walker Cannon]],
      areaOfEffect            = 55,
    accuracy           = 512,	  
      avoidFeature            = true,
      avoidFriendly           = true,
      burnblow                = true,
      craterBoost             = 1,
      craterMult              = 0.5,
      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:walker_burn]],
      impulseBoost            = 30,
      impulseFactor           = 0.6,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 550,
      reloadtime              = 0.17,
    soundHit           = "mediumexplosion",
    soundStart         = "cannon_fire4",
    soundStartVolume   = 75,
      turret                  = true,
      weaponVelocity          = 600,
--  Standard Visuals	------------------------------------
	RGBColor		   = "1.0 0.9 0.30",		  
--	Weaponspecial ------------------------------------------ 
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 5,
	stages 			   = 3,
	weaponType         = "Cannon",
------------------------------------------------------------
		damage = {
		  default            = 38,
		  flyer              = 38*0.33,
		  heavy              = 38,
		  light              = 38,
		},
	},

  WALKERHEAVY = {
  
      name                    = [[Walker Artillery]],
    accuracy                = 512,
      areaOfEffect            = 150,
	  avoidFeature            = false,
	  avoidGround             = false,
      craterBoost             = 1,
      craterMult              = 2,
      edgeEffectiveness       = 0.5,
      explosionGenerator = "custom:ArtyImpact",
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
 --     minbarrelangle          = [[-10]],
    myGravity               = 1,
      noSelfDamage            = true,
      range                   = 500,
      reloadtime              = 4.5,
      renderType              = 4,
    soundHit           = "mediumexplosion",
    soundStart         = "cannon_fire7",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = false,
      startsmoke              = [[1]],
    trajectoryHeight   = 0.3,	  
      turret                  = true,
      weaponVelocity          = 300,
--  Standard Visuals	------------------------------------
	RGBColor		   = "1.0 1.0 0.35",		  
--	Weaponspecial ------------------------------------------ 
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 10,
	stages 			   = 5,
	weaponType         = "Cannon",
------------------------------------------------------------
		damage = {
		  default            = 500,
		  flyer              = 500*0.33,
		  heavy              = 500,
		  light              = (500*0.75),
		},
	},
 }
unitDef.weaponDefs = weaponDefs



--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "60"
	}, 		
    damage             = 16000,
    description        = "Wrecked Walker",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_walker_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
