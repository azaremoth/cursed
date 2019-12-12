--------------------------------------------------------------------------------

local unitName = "tc_hellfire"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 950,
  buildCostMetal     = 950,
  buildPic           = "tc_hellfire.png",
  buildTime          = 950,
  
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 16,
  buildingGroundDecalSizeY = 16,
  buildingGroundDecalType = "tc_groundplate1.png",
  useBuildingGroundDecal = true,    
  
  canAttack          = true,
  canGuard           = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 60 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/tc_hellfire_normal.png",
	normalmaps = "yes",		
    helptext 	= "Defense Tower. Perfect for area control."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Artillery Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "MEDIUM_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 5,
  footprintZ         = 5,
  highTrajectory     = 2,  
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2500,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Hellfire artillery tower",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_hellfire.s3o",
  script             = "tc_hellfire.lua",    
  selfDestructAs     = "MEDIUM_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "tc_hellfire",
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_Green",
      "custom:Structurebuilding_Small",
      "custom:BelialBigGunFlare",
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
      "guntower_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "Hellfire_Artillery",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Hellfire_Artillery = {
	accuracy           = 1250,
    areaOfEffect       = 224,
    avoidFeature       = false,
    avoidFriendly      = true,
    burnblow           = false,
    collisionSize      = 8,
    edgeEffectiveness  = 1,
    energypershot      = 20,
    explosionGenerator = "custom:hellfire",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 100,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    myGravity          = 0,
    name               = "Artillery Cannon",
    range              = 1800,
    reloadtime         = 5,
    startVelocity      = 500,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 550,
    turret             = true,
    weaponAcceleration = 0,
    weaponVelocity     = 550,  
	noSelfDamage       = true,
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "hellstorm_fire",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
--    cegtag			   = "MERMEOTH_SHELLFLARE",	
	RGBColor		   = "0.45 1 0.1",			
--	Weaponspecial ------------------------------------------ 
--    model              = "plasma_green.s3o",
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 12,
	stages 			   = 5,
	weaponType         = "Cannon",
------------------------------------------------------------
    damage = {
      default            = 375,
      flyer              = 375,
      heavy              = 375,
      light              = (375*0.75),
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
    damage             = 2500,
    description        = "Wrecked Hellfire Arty",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "60",
    hitdensity         = "100",
    metal              = 400,
    object             = "tc_hellfire_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 100,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
