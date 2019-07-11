-- UNITDEF -- TC_PURGATORY --
--------------------------------------------------------------------------------

local unitName = "tc_purgatory_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.1,
  buildCostEnergy    = 950,
  buildCostMetal     = 950,
  buildPic           = "tc_purgatory.png",
  buildTime          = 950,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  capturable         = false, 
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "55 40 70",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext = "The is the cursed long range artillery."			
  },
  defaultmissiontype = "Standby",
  description        = "Moving Artillerie",
  --  energyMake         = "-3.5",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  highTrajectory     = 1,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1020,
  maxSlope           = 10,
  maxVelocity        = 1.5,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK3X3",
  name               = "Purgatory (AI)",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_purgatory.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
      
  leavetracks            = 1,
  trackOffset            = 20,
  trackStrength          = 10,
  trackStretch           = 1,
  trackType              = [[StdTank]],
  trackWidth             = 40, 
  
  turnRate           = 200,
  unitname           = "tc_purgatory_ai",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:TRACKED_FX",
      "custom:MEDIUM_EXPLOSION_GREEN",
      "custom:DOORSPIKES",
      "custom:ARTYAIM",
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
      "purgatory_move",
    },
    select = {
      "purgatory_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "PURGATORY_ARTY",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PURGATORY_ARTY = {
    accuracy           = 300,
    areaOfEffect       = 75,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "1",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:BIGLIGHTNINGEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 10,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "purg_shot.s3o",
    myGravity          = 0.275,
    name               = "Purgatory Artillery",
    --noSelfDamage       = true,
    range              = 1800,
    reloadtime         = 2,
    soundHit           = "BoneArtiBoom",
    soundHitVolume     = 25,
    soundStart         = "BoneArti",
    soundStartVolume   = 25,
    targetMoveError    = 0.2,
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 900,
    damage = {
      default            = 180,
      flyer              = "135",
      heavy              = "180",
      light              = "135",
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
    description        = "Former Purgatory",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "tc_purgatory_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
