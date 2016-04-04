-- UNITDEF -- TC_BONEBEAST --
--------------------------------------------------------------------------------

local unitName = "tc_bonebeast"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 230,
  buildCostMetal     = 230,
  buildPic           = "TC_Bonebeast.jpg",
  buildTime          = 230,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   = "cursed",
	isbones = "true",
    helptext 	= "The bonebeast is the cursed light artillery. It is the perfect choice against buildings and slow moving heavy armored targets."
	},
  defaultmissiontype = "Standby",
  description        = "Turret Killer",
  --  energyMake         = "-1",
  explodeAs          = "NONE",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  highTrajectory     = 1,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 3000,
  maxDamage          = 720,
  maxSlope           = 14,
  maxVelocity        = 1.5,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "TANK2X2_AMP",
  name               = "Bone Beast",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Bonebeast.s3o",
  onoffable          = false,
  repairable         = false,     
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 640,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1005,
  unitname           = "tc_bonebeast",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGEST",
      "custom:Greycloud",
      "custom:MERMEOTH_FLARE",
      "custom:GunGroundFlash_Medium",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "bonebeast",
    arrived = {
      "bonebeast",
    },
    cant = {
      "bonebeast",
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
      "bonebeast",
    },
    select = {
      "bonebeast",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "AIR LIGHTARMOR",
      def                = "Bone_Artillery",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Bone_Artillery = {
    accuracy           = 800,
    areaOfEffect       = 45,
    avoidFeature       = false,
    avoidFriendly      = true,
    avoidneutral       = "0",
    burnblow           = false,
    cegTag             = "BONEARTI_CEG",
    collideFeature     = true,
    collideFriendly    = true,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:MERMEOTH_GUNEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    flightTime         = 3,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "Skull_glow.s3o",
    myGravity          = 0.15,
    name               = "Bone Artillery",
    --noSelfDamage       = true,
    range              = 650,
    reloadtime         = 3,
    soundHit           = "BoneArtiBoom",
    soundHitVolume     = 40,
    soundStart         = "BoneArti",
	soundStartVolume   = 40,	
    soundTrigger       = true,
    startVelocity      = 700,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    tracks             = true,
    trajectoryHeight   = 0.65,
    turret             = true,
    weaponAcceleration = 2000,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 700,
    damage = {
      default            = 150,
      flyer              = 150,
      heavy              = 150,
      light              = (150*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = true,
	customParams          = {
		resurrectintounit	= "tc_bonebeast",
		featuredecaytime	= "60"
	},  
    damage             = 2000,
    description        = "Beast Skeleton",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "10",
    hitdensity         = "300",
    metal              = 0,
    object             = "TC_bonebeast_dead.s3o",
    reclaimable        = false,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
