-- UNITDEF -- euf_scorpion --
--------------------------------------------------------------------------------

local unitName = "euf_scorpion_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  brakeRate          = 0.1,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_scorpion.png",
  buildTime          = 500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	helptext = "This unit can dig into the ground and move very slowly but hidden from the enemy. The Gauss Gun can pass through obstacles."	
	},
  defaultmissiontype = "Standby",
  description        = "Diggeroid",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1900,
  maxSlope           = 10,
  maxVelocity        = 1.9,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK2X2_AMP",
  name               = "Scorpion",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_scorpion.s3o",
  script             = "euf_scorpion.cob",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
       
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 5,
  trackStretch           = 1,
  trackType              = [[StdTank_small]],
  trackWidth             = 29,   
  
  turnRate           = 200,
  unitname           = "euf_scorpion_ai",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:ScorpionFlare",
      "custom:ScorpionGroundflash",
      "custom:BURROWING",	  
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
      "tank_move",
    },
    select = {
      "tank_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR",
      def                = "SCORPION_GUN",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SCORPION_GUN = {
      name                    = "Gauss Gun",
      areaOfEffect            = 8,
		avoidFeature       = false,
		avoidFriendly      = false,
		avoidneutral       = "0",
		collideFeature     = false,
		collideFriendly    = false,
		collideneutral     = "0",		
      beamWeapon              = true,
	  cegTag                  = "SCORPION_CEG",
      coreThickness           = 0.5,
      craterBoost             = 1,
      craterMult              = 2,
      duration                = 0.01,
		energypershot           = 0,
      explosionGenerator      = "custom:ScorpionImpact",
      fireStarter             = 50,
	  heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      lineOfSight             = true,
      --noSelfDamage            = true,
      range                   = 400,
      reloadtime              = 0.5,
      renderType              = 0,
      rgbColor                = "1 1 1",
 --     soundHit                = "AgaresLaserHit",
      soundStart              = "scorpion_laser",
	  soundStartVolume   = 50,
      soundTrigger            = true,
      targetMoveError         = 0.15,
      thickness               = 1.5,
      tolerance               = 10000,
      turret                  = true,
      waterWeapon             = true,	  
      weaponType              = "LaserCannon",
      weaponVelocity          = 600,
      damage = {
      default            = 100,
      flyer              = 100,
      heavy              = (100*0.75),
      light              = 100,
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
    damage             = 8000,
    description        = "Wrecked Scorpion",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_scorpion_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
