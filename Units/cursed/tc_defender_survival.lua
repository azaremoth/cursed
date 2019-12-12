-- UNITDEF -- TC_DEFENDER --
--------------------------------------------------------------------------------

local unitName = "tc_defender_survival"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 270,
  buildCostMetal     = 270,
  buildPic           = "tc_defender.png",
  buildTime          = 270,
  
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 12,
  buildingGroundDecalSizeY = 12,
  buildingGroundDecalType = "tc_groundplatesm.png",
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
	normaltex = "unittextures/normalmaps/tc_defender_normal.png",
	normalmaps = "yes",	
    helptext 	= "Defense Tower. Perfect against air targets and light armored ground units."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Light Defense Tower",
  energyMake         = "5",
  explodeAs          = "MEDIUM_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1600,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Defender",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_defender.s3o",
  script			 = "tc_defender.lua",  
  selfDestructAs     = "MEDIUM_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "tc_defender_survival",
  yardMap            = "ooooooooo",
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
      def                = "DEFENDERGUN_NOCOST",
	  badTargetCategory = "HEAVYARMOR LAND",
      onlyTargetCategory = "LAND AIR",
    },
  },
}

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
