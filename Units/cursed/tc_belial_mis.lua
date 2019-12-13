-- UNITDEF -- TC_BELIAL --
--------------------------------------------------------------------------------

local unitName = "tc_belial_mis"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 1500,
  buildCostMetal     = 1500,
  buildPic           = "tc_belial.png",
  buildTime          = 1500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "60 100 60",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {	
	factionname		   = "cursed",
	isinfantry = "true",
    normaltex = "unittextures/normalmaps/tc_belial_normal.png",
	normalmaps = "yes",
    helptext = "This unit is a perfect tank and damage dealer against armored ground units and buildings - it is a little unprecise at distance though."
	},
  defaultmissiontype = "Standby",
  description        = "Lord of the Pit",
  --  energyMake         = "-5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "bigcircle",
  idleAutoHeal       = 12,
  idleTime           = 300,
  mass               = 30000,
  maxDamage          = 8400,
  maxSlope           = 10,
  maxVelocity        = 0.0001,
  maxWaterDepth      = 25,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Belial",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Belial.s3o",
  repairable         = false,     
  script             = 'tc_belial.lua',
  selfDestructAs     = "NULL",
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
  trackWidth             = 60,  
  
  turnRate           = 1000,
  unitname           = "tc_belial_mis",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGEST",
      "custom:Greycloud",
      "custom:BLOOD_EXPLOSION_BIG",
      "custom:BelialBigGunFlare",
      "custom:BelialGunFlare",
      "custom:GunGroundFlash_Medium",
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
      "demoncry",
    },
    select = {
      "demoncry",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "BELIALBIGGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory  = "HEAVYARMOR",
      name                = "BELIALGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BELIALBIGGUN = {
    avoidFriendly      = true,
    burnblow = 0,
	collideFriendly    = true,
    accuracy           = 320,
    areaOfEffect       = 40,
	cylinderTargeting = 1,		
    energypershot           = 0,	
    explosionGenerator = "custom:Mancubus_Hit_Explosion",
	explosionScar      = true,
    interceptedByShieldType = 2,
    name               = "Cannon",
    range              = 550,
    reloadtime         = 5,
    soundHit           = "mediumexplosion",
    soundStart         = "belial_biggun",
    soundStartVolume   = 40,
    soundTrigger       = true,
	sweepFire 			= false,
    targetMoveError    = 0.2,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	burst --------------------------------------------------
	burst = 5,
	burstrate = 0.01,
	sprayangle = 1024,
--	Weaponspecial ------------------------------------------
    intensity          = 1,
    coreThickness      = 1,	
    weaponType         = "LaserCannon",
	rgbColor           = "0.5 1 0.1",
    texture1           = "greengunshot",
    texture2           = "null_texture",
    thickness          = 4,	
------------------------------------------------------------	  
  damage = {
      default            = 150,
      flyer              = 150*0.33,
      heavy              = 150,
      light              = (140*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams       = {
		featuredecaytime		= "240",
		resurrectintounit		= "tc_belial"
	},  
    damage             = 16000,
    description        = "Former Belial",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "tc_belial_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------