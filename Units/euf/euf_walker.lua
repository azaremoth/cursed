-- UNITDEF -- euf_walker --
--------------------------------------------------------------------------------

local unitName = "euf_walker"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 1500,
  buildCostMetal     = 1500,
  buildPic           = "euf_walker.png",
  buildTime          = 1500,
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
		factionname	= "imperials",
		normaltex = "unittextures/normalmaps/euf_walker_normal.png",
		normalmaps = "yes",
		RequireTech         = "Advanced Technology",		
		helptext = "The heavy walker is a perfect damage dealer against ground units and buildings."
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
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = true,
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
  unitname           = "euf_walker",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:Greycloud",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:PLasmaTowerGunFlare",
      "custom:PLasmaTowerGunGroundflash",
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
	    { file = 'voices_dark_enemyeng.wav', volume = 4.0 },
    },
    select = {
		{ file = 'voices_dark_sysrdy.wav', volume = 4.0 },
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
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 200,
    areaOfEffect       = 55,
    energypershot      = 0,	
    explosionGenerator = "custom:smallblueexp",
    cegTag             = "PLasmaTowerGunProjectileGroundflash",	
    interceptedByShieldType = 1,
    name               = "Plasma Cannon",
    range              = 550,
    reloadtime         = 0.33,
    renderType         = 0,
    rgbColor           = "0.55 0.58 0.94",
    soundHit           = "mediumexplosion",
    soundStart         = "plasma",
    soundStartVolume   = 75,
 --   targetBorder       = 1,	
    texture1           = "blueflare",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 10.00,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "LaserCannon",
    weaponVelocity     = 750, 
    damage = {
      default            = 75,
      flyer              = 75*0.33,
      heavy              = 75,
      light              = 75,
    },
  },
  WALKERHEAVY = {
	accuracy           = 600,
    areaOfEffect       = 150,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    burnblow           = false,
    cegTag             = "PLasmaTowerGunProjectileGroundflash",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
    energypershot      = 0,
    explosionGenerator = "custom:Walker_Hit_Explosion",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    flightTime         = 10,
    guided             = "0",
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "plasma.s3o",
    myGravity          = 1,
    name               = "HeavyPlasma",
    --noSelfDamage       = true,
    pitchtolerance     = "1500",
    range              = 500,
    reloadtime         = 4.5,
    selfprop           = false,
    soundHit           = "mediumexplosion",
    soundStart         = "hellstorm_fire",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = false,
    startVelocity      = 450,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    tracks             = false,
    trajectoryHeight   = 0.3,
    turret             = true,
    weaponAcceleration = 0,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 450,
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
