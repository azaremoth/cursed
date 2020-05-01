-- UNITDEF -- euf_pyrotower --
--------------------------------------------------------------------------------

local unitName = "euf_pyrotower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 350,
  buildCostMetal     = 350,
  buildPic           = "euf_pyrotower.png",
  buildTime          = 350,
--  buildingGroundDecalDecaySpeed = 0.2,
--  buildingGroundDecalSizeX = 5,
--  buildingGroundDecalSizeY = 5,
--  buildingGroundDecalType = "euf_groundplate3.png",
--  useBuildingGroundDecal = true, 
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
		helptext 			= "Defense Tower. Perfect against packs of GROUND targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Cloakable light defense tower",
  --  energyMake         = "-5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1500,
  maxSlope           = 25,
  maxVelocity        = 0,  
  maxWaterDepth      = 0,
  name               = "Flamer tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_pyrotower.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  script			 = "euf_pyrotower.lua",  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  unitname           = "euf_pyrotower",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
      "custom:FLAMERGROUNDFLASH",
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
      def                = "PYROTOWERGUN",
      badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PYROTOWERGUN = {
	  name					= [[Flame Thrower]],
	  areaOfEffect			= 128,
	  avoidFeature			= false,	  
	  avoidFriendly      	= true,
	  burst					= 10,
	  burstRate				= 0.05,
	  cegTag				= [[Flametrail]],
	  CollideFriendly		= true,   
	  edgeEffectiveness		= 0.5,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:Flamethrower]],
	  explosionSpeed		= 5,
	  fireStarter			= 100,
	  groundBounce			= false,
	  impulseFactor			= 1e-06,
	  -- lineofsight			= 1,
      noSelfDamage            = true,	  
	  range					= 300,
	  reloadTime			= 2.50,
	  -- rendertype			= 1,
	  size					= 0.01,
	  soundStart			= [[flamer]],
	  soundHit           = "null",
	  soundTrigger			= false,
	  sprayAngle			= 1024,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 240,
	  weaponType         = "Cannon",

	  customParams            = {
				flamethrower = "1",
      },
	  
	 damage = {
				default            = 22,
				flyer              = 22,
				heavy              = 22,
				light              = (22*2),
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
    description        = "Wrecked Pyro Tower",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "100",
    metal              = 175,
    object             = "euf_pyrotower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
