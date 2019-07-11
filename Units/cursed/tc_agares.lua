-- UNITDEF -- TC_AGARES --
--------------------------------------------------------------------------------

local unitName = "tc_agares"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.75,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.83105,
  buildCostEnergy    = 940,
  buildCostMetal     = 940,
  buildPic           = "tc_agares.png",
  buildTime          = 940,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext	= "With the precise long-range laserguns the Agares is the perfect choice against all ground targets. It isn't very stable though."	
	},
  defaultmissiontype = "Standby",
  description        = "Heavy Laser Bot",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1000,
  maxDamage          = 1100,
  maxSlope           = 14,
  maxVelocity        = 1.5,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "HEAVYWALKER2X2",
  name               = "Agares",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Agares.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 768,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 9,
  trackStretch           = 1,
  trackType              = [[Pointy]],
  trackWidth             = 40,  
  
  turnRate           = 350,
  unitname           = "tc_agares",
  sfxtypes = {
    explosiongenerators = {
      "custom:MEDIUM_EXPLOSION_GREEN",
      "custom:GunGroundFlash_Medium_long",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
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
      "agares_move",
    },
    select = {
      "agares_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "AGARES_LASER",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AGARES_LASER = {
    avoidFriendly      = true,
	collideFriendly    = true,  
    accuracy           = 100,
    areaOfEffect       = 32,
    beamtime           = 0.75,
    burnblow           = true,
    coreThickness      = 0.4,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot           = 0,
    explosionGenerator = "custom:AGARES_LASER",
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Agares Laser",
	noSelfDamage     = true,
    range              = 800,
    reloadtime         = 7,
    -- rendertype         = 0,
	rgbColor           = {0.45, 1, 0.1},
	rgbColor2 		   = {1, 1, 1},
    soundHit           = "AgaresLaserHit",
    soundStart         = "AgaresLaser",
    soundTrigger       = true,
	sweepFire		   = false,		
    targetMoveError    = 0.33,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 4,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 1500,
    damage = {
      default            = 1300,
      flyer              = 1300*0.33,
      heavy              = 1300,
      light              = 1300,
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
    description        = "Former Agares",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "TC_agares_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------
return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
