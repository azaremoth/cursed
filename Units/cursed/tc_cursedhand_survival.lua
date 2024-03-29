-- UNITDEF -- TC_CURSEDHAND --
--------------------------------------------------------------------------------

local unitName = "tc_cursedhand_survival"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  buildCostEnergy    = 1500,
  buildCostMetal     = 1500,
  buildPic           = "tc_cursedhand.png",
  buildTime          = 1500,
  
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 14,
  buildingGroundDecalType = "tc_groundplatesm.png",
  useBuildingGroundDecal = true,
  
  canAttack          = true,
  canGuard           = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "50 140 50",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {
	factionname	= "cursed",
    helptext 	= "Heavy Defense Tower. Perfect against all sorts of ground targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Heavy Defense Tower",
  energyMake         = 20,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 12000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Cursed Hand",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_cursedhand.s3o",
  script			 = "tc_cursedhand.cob",   
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 1024,
  smoothAnim         = false,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "tc_cursedhand_survival",
  yardMap            = "ooo ooo ooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:BLACKFIRE",
      "custom:Small_Explosion_Green",
      "custom:Structurebuilding_Small",
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
      badTargetCategory  = "LIGHTARMOR",
      def                = "CURSEDSKULLS",
	  badTargetCategory = "LAND",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CURSEDSKULLS = {
    areaOfEffect       = 50,
    avoidFriendly      = true,
    gravityAffected          = false,
    cegTag             = "BLACKFIRE",
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    dance		     = 97,
      energypershot           = 0,	
    explosionGenerator = "custom:Black_Explosion",
    fixedLauncher      = true,
    flightTime         = 5,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    -- lineofsight        = true,
    model              = "Skull.s3o",
    name               = "Skull Rocket",
    range              = 1000,
    reloadtime         = 0.66,
    -- rendertype         = 1,
    smokeTrail         = false,
    soundHit           = "mediumexplosion",
    soundStart         = "cursedHand_shot",
    startVelocity      = 100,
    texture1           = "null_texture",
    texture2           = "null_texture",
    texture3           = "null_texture",
    tolerance          = 3000,
    tracks             = true,
    turnRate           = 60000,
    turret             = true,
    weaponAcceleration = 200,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 700,
    damage = {
      default            = 350,
      flyer              = 350,
      heavy              = 350,
      light              = (350*0.75),
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
    description        = "Wrecked Cursed Hand",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "30",
    hitdensity         = "100",
    metal              = 425,
    object             = "tc_cursedhand_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 212,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
