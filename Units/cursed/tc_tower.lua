--------------------------------------------------------------------------------

local unitName = "tc_tower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  buildCostEnergy    = 850,
  buildCostMetal     = 850,
  buildPic           = "tc_tower.png",
  buildTime          = 850,
  
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 14,
  buildingGroundDecalType = "tc_groundplatesm.png",
  useBuildingGroundDecal = true,
  
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "50 140 50",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {
	factionname	= "cursed",
	isbones = "true",
    helptext 	= "Heavy Defense Tower. Perfect against all sorts of ground targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Heavy Defense Tower",
  --  energyMake         = "-10",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3200,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Defender Demon",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_tower.s3o",
  script             = 'tc_tower.lua',
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 1024,
  smoothAnim         = false,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "tc_tower",
  yardMap            = "ooo ooo ooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_Green",
      "custom:Structurebuilding_Small",
      "custom:Greycloud",
	  "custom:MERMEOTH_FLARE",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "bell",
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
      "",
    },
    select = {
      "cursed_hand_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "CURSEDSKULLS",
      badTargetCategory  = "LIGHTARMOR AIR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CURSEDSKULLS = {
      name               = "Damned Skulls",  
      areaOfEffect            = 64,
      avoidFriendly           = true,
      collideFriendly         = true,
      craterBoost             = 0,
      craterMult              = 0,
    cegTag             = "SPIKES_MAGE",	  
      dance                   = 50,
    energypershot           = 10,	
    explosionGenerator = "custom:Black_Explosion",
      fireStarter             = 0,
      fixedlauncher           = 1,
      flightTime              = 3,
      heightmod               = 0.5,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      -- lineofsight             = true,
      metalpershot            = 0,
    model              = "Skull.s3o",
      --noSelfDamage            = true,
    range                   = 900,
    reloadtime         = 1.75,
      -- rendertype              = 1,
      smokeTrail              = true,
    soundHit           = "mediumexplosion",
    soundStart         = "cursedHand_shot",	  
      startVelocity           = 400,
      texture1                = [[]],
      texture2                = [[sporetrail]],
      tolerance               = 10000,
      tracks                  = true,
      turnRate                = 24000,
      turret                  = true,
      waterweapon             = false,
      weaponAcceleration      = 100,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 700,
      wobble                  = 32000,
   damage = {
      default            = 333,
      flyer              = (333*0.33),
      heavy              = 333,
      light              = (333*0.75),
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
		featuredecaytime		= "300"
	},  		
    damage             = 2000,
    description        = "Dead Guardian",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "30",
    hitdensity         = "100",
    metal              = 425,
    object             = "tc_tower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 212,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
