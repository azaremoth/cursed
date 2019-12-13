-- UNITDEF -- TC_MERMEOTH --
--------------------------------------------------------------------------------

local unitName = "tc_mermeoth"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.9,
  buildCostEnergy    = 850,
  buildCostMetal     = 850,
  buildPic           = "tc_mermeoth.png",
  buildTime          = 850,
  canAttack          = true,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",
    helptext 	= "The mermeoth hover tank can travel across water and is a good choice against heavily armored targets. In addition, it is equipped with a torpedo launcher."
  },
  defaultmissiontype = "Standby",
  description        = "Hovertank",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,

  crushResistance    = 2000,
  mass               = 400, 
  
  maxDamage          = 2500,
  maxSlope           = 16,
  maxVelocity        = 2.6,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  movementClass      = "TANKHOVER3x3",
  name               = "Mermeoth",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_mermeoth.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1000,
  unitname           = "tc_mermeoth",
  sfxtypes = {
    explosiongenerators = {
      "custom:MERMEOTH_FLARE",
      "custom:HOVER_WATERCLOUD",
      "custom:GunGroundFlash_Small",
      "custom:MEDIUM_EXPLOSION_GREEN",	  
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
      "mechanodemon",
    },
    select = {
      "mechanodemon",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "WAVEGUN",
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "TORPEDO",
      onlyTargetCategory = "LAND",
    },		
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  WAVEGUN = {
    accuracy           = 50,
    areaOfEffect       = 64,
    burnblow		   = true,
    cegTag             = "MERMEOTH_SHELLFLARE",
    coreThickness      = 0.5,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.03,
    energypershot           = 0,	
    explosionGenerator = "custom:MERMEOTH_GUNEXPLOSION",
	fallOffRate        = 0.25,
	hardStop           = false,
    impulseBoost       = 0,
    intensity          = 0.5,
    interceptedByShieldType = 1,
    -- lineofsight        = true,
    name               = "Hellfire Cannon",
    range              = 400,
    reloadtime         = 3,
    -- rendertype         = 0,
    rgbColor           = "0.6 1 0.16",
    rgbColor2           = "0.8 1 0.35",
    soundHit           = "cannon_hit4",
    soundStart         = "shell_gun",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 1000,
    texture1           = "waveball",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 14,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 1000,
    damage = {
      default            = 270,
      flyer              = 270,
      heavy              = 270,
      light              = (270*0.75),
    },
  },
   TORPEDO = {
      name                    = "Torpedo Launcher",
      areaOfEffect            = 16,
      avoidFriendly           = false,
      bouncerebound           = 0.5,
      bounceslip              = 0.5,
      burnblow                = true,
		cegTag             = "BUBBLE_TRAIL",	  
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
      explosionGenerator      = "custom:TORPEDOEXPLOSION",
      groundbounce            = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      model                   = "Rocket.s3o",
      numbounce               = 4,
      range                   = 400,
      reloadtime              = 1.75,
      -- rendertype              = 1,
      soundHit                = "ex_underwater",
      soundStart              = "bomb_drop",
      startVelocity           = 150,
      tracks                  = true,
      turnRate                = 22000,
      turret                  = true,
      waterWeapon             = true,
      weaponAcceleration      = 22,
      weaponTimer             = 3,
      weaponType              = "TorpedoLauncher",
      weaponVelocity          = 320,
    damage = {
      default            = 300,
      flyer              = 300,
      heavy              = 300,
      light              = 300,
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
    description        = "Former Mermeoth",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "20",
    hitdensity         = "1000",
    metal              = 0,
    object             = "TC_mermeoth_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
