-- UNITDEF -- TC_CURSEDHAND --
--------------------------------------------------------------------------------

local unitName = "tc_cursedhand_survival"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  buildCostEnergy    = 850,
  buildCostMetal     = 850,
  buildPic           = "TC_Cursedhand.jpg",
  buildTime          = 850,
  
  buildingGroundDecalDecaySpeed = 0.01,
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
    helptext 	= "Heavy Defense Tower. Perfect against all sorts of ground targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Heavy Defense Tower",
  --  energyMake         = "5",
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
    ballistic          = false,
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
    lineOfSight        = true,
    model              = "Skull.s3o",
    name               = "Skulls",
    range              = 900,
    reloadtime         = 1.75,
    renderType         = 1,
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
