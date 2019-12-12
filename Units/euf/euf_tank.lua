-- UNITDEF -- euf_tank --
--------------------------------------------------------------------------------

local unitName = "euf_tank"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.1,
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildPic           = "euf_tank.png",
  buildTime          = 1000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "65 45 100",
  collisionVolumeOffsets 	= "0 20 0",
  -- collisionVolumeTest 		= 1,    
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_tank_normal.png",
	normalmaps = "yes",	
	helptext = "As the core of your advanced forces the battletank takes lots of damage and can defend itself."	
	},
  defaultmissiontype = "Standby",
  description        = "Battletank",
  --  energyMake         = "-3.5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 6000,
  maxSlope           = 10,
  maxVelocity        = 1.6,
  maxReverseVelocity = 1.3,
  turnInPlace        = true,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK4X4",
  name               = "K1A5 Battletank",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_tank.s3o",
  script             = "euf_tank.cob",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 10,
  trackStretch           = 1,
  trackType              = [[StdTank]],
  trackWidth             = 50, 
    
  turnRate           = 200,
  unitname           = "euf_tank",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:MEDIUM_EXPLOSION_YELLOW",
      "custom:CANNONGUNFLARE",
      "custom:CANNONGROUNDFLASH",
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
      badTargetCategory  = "LIGHTARMOR",
      def                = "BATTLETANK_GUN",
	  badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BATTLETANK_GUN = {
    name                    = [[Battletank Cannon]],
    areaOfEffect            = 120,
    accuracy           = 920,	  
      avoidFeature            = true,
      avoidFriendly           = true,
    burnblow                = false,
      craterBoost             = 1,
      craterMult              = 0.5,
      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:Smoke_MLRS]],
      impulseBoost            = 30,
      impulseFactor           = 0.6,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 500, --350
      reloadtime              = 2.8,
    soundHit           = "cannon_hit2",
    soundStart         = "tank_cannon",
    soundStartVolume   = 75,
      turret                  = true,
      weaponVelocity          = 600,
--  Standard Visuals	------------------------------------
	RGBColor		   = "1.0 0.9 0.30",		  
--	Weaponspecial ------------------------------------------ 
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 8,
	stages 			   = 5,
	weaponType         = "Cannon",
------------------------------------------------------------
		damage = {
		  default            = 565,
		  flyer              = 565,
		  heavy              = 565,
		  light              = (565*0.75),
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
    description        = "Wrecked Tank",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_tank_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
