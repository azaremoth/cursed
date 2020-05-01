-- UNITDEF -- euf_heavytower --
--------------------------------------------------------------------------------

local unitName = "euf_heavytower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_heavytower.png",
  buildTime          = 500,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 5,
  buildingGroundDecalType = "euf_groundplate3.png",
  useBuildingGroundDecal = true, 
  canAttack          = true,
  canGuard           = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 50 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
  corpse             = "dead",
  customParams          = {
		factionname			= "imperials",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
		helptext 			= "Defense Tower. Perfect against heavily armored targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Heavy Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 2500,
  maxSlope           = 25,
  maxVelocity        = 0,  
  maxWaterDepth      = 0,
  name               = "Heavy cannon tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_heavytower.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  script			 = "euf_heavytower.lua",  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  unitname           = "euf_heavytower",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:CANNONGUNFLARE",
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
      "custom:CANNONGROUNDFLASH",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_baseattacked",
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
      def                = "HEAVYTOWERGUN",
      badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  HEAVYTOWERGUN = {
    name                    = [[Heavy Cannon]],
    areaOfEffect            = 120,
    accuracy           = 920,	  
      avoidFeature            = true,
      avoidFriendly           = true,
    burnblow                = false,
      craterBoost             = 1,
      craterMult              = 0.5,
      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:Smoke_MLRS]],
      impulseBoost            = 30,
      impulseFactor           = 0.6,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 500, --350
      reloadtime              = 2.8,
    soundHit           = "cannon_hit2",
    soundStart         = "tank_cannon",
    soundStartVolume   = 75,
      turret                  = true,
      weaponVelocity          = 600,
--  Standard Visuals	------------------------------------
	RGBColor		   = "1.0 0.9 0.30",		  
--	Weaponspecial ------------------------------------------ 
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 8,
	stages 			   = 5,
	weaponType         = "Cannon",
------------------------------------------------------------
		damage = {
		  default            = 565,
		  flyer              = 565,
		  heavy              = 565,
		  light              = (565*0.75),
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
    description        = "Wrecked Heavy Tower",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "400",
    metal              = 250,
    object             = "euf_heavytower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
