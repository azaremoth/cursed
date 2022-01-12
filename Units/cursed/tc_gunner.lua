-- UNITDEF -- TC_GUNNER --
--------------------------------------------------------------------------------

local unitName = "tc_gunner"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 170, --was 190
  buildCostMetal     = 170,
  buildPic           = "tc_gunner.png",
  buildTime          = 170,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = true,
  cantBeTransported  = false, 
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname	= "cursed",
	isinfantry = "true",
	isbones = "true",	
	canburrow      = "true",	
    helptext 	= "Gunner have a moderate range and deal good damage against light armored units."
  },
  defaultmissiontype = "Standby",
  description        = "Basic Combat Unit",
  --  energyMake         = "-0.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1100, --was 1200
  maxSlope           = 20,
  maxVelocity        = 1.8, --was 1.7
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Gunner",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Gunner.s3o",
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  repairable         = false,     
  resurrectSpeed     = 0,
  script             = 'tc_gunner.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "tc_gunner",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING",
      "custom:ElectroGunflare",
      "custom:GunGroundFlash_Small",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "skeleton3",
    arrived = {
      "skeleton2",
    },
    cant = {
      "skeleton3",
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
      "skeleton2",
    },
    select = {
      "skeleton1",
    },
  },
  weapons = {
    [1]  = {
      def                = "GUNNER_LIGHTNING",
      badTargetCategory  = "HEAVYARMOR AIR",	  
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      def                = "GUNNER_LIGHTNING_BUNKER",
      badTargetCategory  = "HEAVYARMOR AIR",	  
      onlyTargetCategory = "LAND",
    },	
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GUNNER_LIGHTNING = {
    areaOfEffect       = 64,
    avoidFeature       = false,
    avoidFriendly      = true,
    avoidneutral       = "0",
    beamTime           = 2.5,
    collideFeature     = true,
    collideFriendly    = true,
    collideneutral     = "1",
    collisionSize      = 8,
    coreThickness      = 0.8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:LIGHTNINGEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 0,
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 0.8,
    interceptedByShieldType = 1,
    -- lineofsight        = true,
    minIntensity       = 1.0,
    name               = "Soul Beam",
    --noSelfDamage       = true,
    range              = 350, --was 400
    reloadtime         = 1.6, --was 1.5
    rgbColor           = "0.5 1 0.16",
    rgbColor2          = "1 1 1",
    soundStart         = "EGun",
	soundHit           = "null",	  	
    soundStartVolume   = 20,
    targetBorder       = 0,
    texture1           = "soullightning",
    texture2           = "soullightning_flare",
    texture3           = "null_texture",
    thickness          = 3,
    tolerance          = 500,
    turret             = true,
    weaponType         = "LightningCannon",
    damage = {
      default            = 120,
      flyer              = 120,
      heavy              = (120*0.75),
      light              = 120,
    },
  },
  GUNNER_LIGHTNING_BUNKER = {
    areaOfEffect       = 64,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    beamTime           = 2.5,
    collideFeature     = false,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    coreThickness      = 0.8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:LIGHTNINGEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 0,
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 0.8,
    interceptedByShieldType = 1,
    -- lineofsight        = true,
    minIntensity       = 1.0,
    name               = "Soul Beam",
    --noSelfDamage       = true,
    range              = 350, --was 400
    reloadtime         = 1.6, --was 1.5
    rgbColor           = "0.5 1 0.16",
    rgbColor2          = "1 1 1",
    soundStart         = "EGun",
	soundHit           = "null",
    soundStartVolume   = 20,
    targetBorder       = 0,
    texture1           = "soullightning",
    texture2           = "soullightning_flare",
    texture3           = "null_texture",
    thickness          = 3,
    tolerance          = 500,
    turret             = true,
    weaponType         = "LightningCannon",
    damage = {
      default            = 120,
      flyer              = 120,
      heavy              = (120*0.75),
      light              = 120,
    },
  }, 
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_gunner",	
		featuredecaytime	= "60"		
	},  
    damage             = 300,
	mass               = 1000,	
    description        = "Gunner Skeleton",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "TC_Gunner_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
