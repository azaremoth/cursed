-- UNITDEF -- euf_aatank --
--------------------------------------------------------------------------------

local unitName = "euf_aatank"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  brakeRate          = 0.1,
  buildCostEnergy    = 900,
  buildCostMetal     = 900,
  buildPic           = "euf_aatank.png",
  buildTime          = 900,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "55 40 80",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,    
  corpse             = "dead",
  customParams          = {
	factionname	= "imperials",
	normaltex = "unittextures/normalmaps/euf_aatank_normal.png",
	normalmaps = "yes",				
    helptext 	= "The Anti-Air Tank is very effective against air targets and light armored units."
  },
  defaultmissiontype = "Standby",
  description        = "Anti-Air",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 2800,
  maxSlope           = 10,
  maxVelocity        = 2,
  maxReverseVelocity = 1.6,
  turnInPlace        = true,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK3X3",
  name               = "K1A3-AA",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_aatank.s3o",
  radarDistance      = 768,
  script             = "euf_aatank.cob",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 550,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 10,
  trackStretch           = 1,
  trackType              = [[StdTank]],
  trackWidth             = 40, 
  
  turnRate           = 200,
  unitname           = "euf_aatank",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:MEDIUM_EXPLOSION_YELLOW",
      "custom:AATankGunFlare",
      "custom:GunGroundFlash_Small_Yellow",
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
      def                = "AATANK_GUN",
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR LAND",	
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AATANK_GUN = {
    avoidFriendly      = true,
	burnblow		   = 1,
	collideFriendly    = true,
    accuracy           = 64,
    areaOfEffect       = 32,
	cylinderTargeting = 128,		
    energypershot           = 0,	
    explosionGenerator = "custom:FLAKImpact",
	explosionScar      = false,
    interceptedByShieldType = 1,
    name               = "FLAK",
    range              = 550,
    reloadtime         = .05,
    soundStart         = "flakgun",
	soundHit           = "null",		
    soundStartVolume   = 15,
    soundTrigger       = true,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 1800,
	sweepFire 		   = true,
--	burst ------------------------------------------
	burst = 2,
	burstrate = 0.075,
	sprayangle = 1024,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	
    damage = {
      default            = 42,
      flyer              = 42,
      heavy              = 19*0.33,
      light              = 42*0.5,
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
    object             = "euf_aatank_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
