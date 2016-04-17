-- UNITDEF -- euf_raider --
--------------------------------------------------------------------------------

local unitName = "euf_raider"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.1,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "euf_raider.png",
  buildTime          = 400,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 40 80",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,   
  corpse             = "dead",  
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_raider_normal.png",
	normalmaps = "yes",	
    helptext = "Fast scouting and attack car. It is appropriate for hit and run tactics."	
	},
  defaultmissiontype = "Standby",
  description        = "fast scout",
  --  energyMake         = "-3.5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1500,
  maxSlope           = 10,
  maxVelocity        = 4.5,
  maxReverseVelocity = 2.0,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "LIGHTTANK3X3",
  name               = "Raider",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_raider.s3o",
  selfDestructAs     = "NULL",
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
  trackType              = [[tracks]],
  trackWidth             = 40, 

  turnInPlace        = false,
  turnInPlaceSpeedLimit = 4.5,
  turnRate           = 350,
  unitname           = "euf_raider",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:RaiderLaserFlare",
      "custom:RaiderLaserGroundflash",
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
      "raider_move",
    },
    select = {
      "raider_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR",
      def                = "RAIDER_LASER",
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  RAIDER_LASER = {
      name                    = [[Raider Laser]],
      areaOfEffect            = 8,
      -- beamweapon              = true,
      coreThickness           = 0.5,
      craterBoost             = 1,
      craterMult              = 2,
      duration                = 0.02,
		energypershot           = 0,
      explosionGenerator      = [[custom:RaiderLaserImpact]],
      fireStarter             = 50,
	  heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      -- lineofsight             = true,
      --noSelfDamage            = true,
      range                   = 400,
      reloadtime              = 0.125,
      -- rendertype              = 0,
      rgbColor                = [[1 0.1 0.1]],
 --     soundHit                = [[AgaresLaserHit]],
      soundStart              = [[raiderlaser]],
	  soundStartVolume   = 50,
      soundTrigger            = true,
	  sweepFire		          = true,		  
      targetMoveError         = 0.15,
      thickness               = 2.54950975679639,
      tolerance               = 10000,
      turret                  = true,
      weaponType              = [[LaserCannon]],
      weaponVelocity          = 880,
      damage = {
      default            = 25,
      flyer              = 25*0.33,
      heavy              = (25*0.75),
      light              = 25,
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
    damage             = 6000,
    description        = "Wrecked Raider",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_raider_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
