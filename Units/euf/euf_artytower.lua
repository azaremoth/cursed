--------------------------------------------------------------------------------

local unitName = "euf_artytower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 950,
  buildCostMetal     = 950,
  buildPic           = "euf_artytower.png",
  buildTime          = 950,
  
  buildingGroundDecalDecaySpeed = 1,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = "euf_lasertower_aoplane.dds",
  useBuildingGroundDecal = true,  
  
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "50 75 50",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	factionname	= "imperials",
    helptext 	= "Defense Tower. Perfect for area control."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Artillery Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 5,
  footprintZ         = 5,
--  highTrajectory     = 2,  
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2500,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Artillery tower",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "euf_artytower.s3o",
  script             = "euf_artytower.lua",    
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "euf_artytower",
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_Yellow",
      "custom:EUF_Structurebuilding_Small",
      "custom:BERTHAFLARE",
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
      badTargetCategory  = "HEAVYARMOR FLYER",
      def                = "Artillery",
      badTargetCategory = "LIGHTARMOR",	  
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Artillery = {
	accuracy           = 1250,
    areaOfEffect       = 192,
    avoidFeature       = false,
    avoidFriendly      = true,
    burnblow           = false,
    collisionSize      = 8,
    edgeEffectiveness  = 1,
    energypershot      = 20,
    explosionGenerator = "custom:ArtyImpact",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 100,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    myGravity          = 0,
    name               = "Artillery Plasma Cannon",
    pitchtolerance     = "1500",
    range              = 1800,
    reloadtime         = 2.5,
    startVelocity      = 550,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    turret             = true,
    weaponAcceleration = 0,
    weaponType         = "Cannon",
    weaponVelocity     = 550,  
	noSelfDamage       = true,
	minbarrelangle     = "-35",	
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "CannHvy3Remake",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
--    cegtag			   = "MLRSRocketTrail",	
	RGBColor		   = "1.0 1.0 0.35",	
--	Weaponspecial ------------------------------------------ 
--    model              = "plasma_yellow.s3o",
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 12,
	stages 			   = 5,
	weaponType         = "Cannon",
------------------------------------------------------------
    damage = {
      default            = 188,
      flyer              = 188*0.33,
      heavy              = 188,
      light              = 188,
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
    description        = "Wrecked Arty",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "60",
    hitdensity         = "100",
    metal              = 400,
    object             = "euf_artytower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 100,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
