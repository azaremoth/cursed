-- UNITDEF -- euf_lasertower --
--------------------------------------------------------------------------------

local unitName = "euf_lasertower_survival"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 900,
  buildCostMetal     = 900,
  buildPic           = "euf_lasertower.png",
  buildTime          = 900,
  
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = "euf_groundplate3.png",
  useBuildingGroundDecal = true,  
  
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "50 100 50",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
  customParams          = {
		factionname			= "imperials",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
		helptext 			= "Heavy Defense Tower. Perfect against all sorts of GROUND targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Heavy Defense Tower",
  --  energyMake         = "5",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 4000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Laser tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_lasertower.s3o",
  script			 = "euf_lasertower.lua",  
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "euf_lasertower_survival",
  yardMap            = "ooooo ooooo ooooo ooooo ooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
      "custom:LaserTowerGunFlare",	  
      "custom:LaserTowerGunGroundflash",
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
      def                = "LASERTOWERGUN",
      badTargetCategory  = "LIGHTARMOR AIR",	  
      onlyTargetCategory = "LAND",
	},
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  LASERTOWERGUN = {
    accuracy           = 100,
    areaOfEffect       = 40,
    beamTime           = 0.33,
    burnblow           = true,
    coreThickness      = 0.66,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 10,
    explosionGenerator = "custom:LaserTowerGunImpact",
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Agares Laser",
    range              = 800,
    reloadtime         = 1,
    -- rendertype         = 0,
    rgbColor           = "0.2 1.0 0.4",
    soundHit           = "AgaresLaserHit",
    soundStart              = "heavylaser",
    soundTrigger       = true,
    targetMoveError    = 0.4,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 5,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 1500,
    damage = {
      default            = 330,
      flyer              = 330*0.33,
      heavy              = 330,
      light              = 330,
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
    description        = "Wrecked Laser Tower",
    footprintX         = 5,
    footprintZ         = 5,
    height             = "60",
    hitdensity         = "100",
    metal              = 450,
    object             = "euf_lasertower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
