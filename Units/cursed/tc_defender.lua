-- UNITDEF -- TC_DEFENDER --
--------------------------------------------------------------------------------

local unitName = "tc_defender"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 270,
  buildCostMetal     = 270,
  buildPic           = "TC_Defender.jpg",
  buildTime          = 270,
  
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 12,
  buildingGroundDecalSizeY = 12,
  buildingGroundDecalType = "tc_groundplatesm.png",
  useBuildingGroundDecal = true,    
  
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 60 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
    helptext 	= "Defense Tower. Perfect against air targets and light armored ground units."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Light Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "MEDIUM_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1800,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Defender",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Defender.s3o",
  script			 = "tc_defender.lua",
  selfDestructAs     = "MEDIUM_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "tc_defender",
  yardMap            = "ooo ooo ooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:DefenderGunFlare",
      "custom:Small_Explosion_Green",
      "custom:Structurebuilding_Small",
      "custom:GunGroundFlash_Small",
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
      def                = "DEFENDERGUN",
	  badTargetCategory = "HEAVYARMOR LAND",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  DEFENDERGUN = {
    avoidFriendly      = true,
	collideFriendly    = true,  
    accuracy           = 50,
    areaOfEffect       = 16,
    -- beamweapon         = true,
    burnblow           = true,
    coreThickness      = 1,
    craterBoost        = 0,
    craterMult         = 0,
	cylinderTargeting = 128,		
    energypershot      = 5,	
    explosionGenerator = "custom:GunImpact",
    interceptedByShieldType = 2,
    -- lineofsight        = true,
    name               = "Defender Gun",
    range              = 550,
    reloadtime         = .13,
    rgbColor           = "0.8745 1 0.1568",
    soundHit           = "defender_hit",
    soundStart         = "defender_shot",
    soundStartVolume   = 40,
    soundTrigger       = true,
	sweepFire		   = false,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	Weaponspecial ------------------------------------------
    beamlaser          = 1,
    beamTime           = 0.05,
    coreThickness      = 0.1,
    largeBeamLaser     = 1,
    laserFlareSize     = 2,
    rgbColor           = "0.45 1 0.45",
    texture1           = "greengunshot_longdelay",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 2,
	tileLength         = 400,
    weaponType         = "BeamLaser",
------------------------------------------------------------		
	damage = {
      default            = 22,
      flyer              = (22*1.5),
      heavy              = (22*0.75),
      light              = 22,
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
    description        = "Wrecked Defender",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "100",
    metal              = 135,
    object             = "TC_Defender_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
