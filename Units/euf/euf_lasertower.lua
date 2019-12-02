-- UNITDEF -- euf_lasertower --
--------------------------------------------------------------------------------

local unitName = "euf_lasertower"

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
  canstop            = true,
  cantBeTransported  = true, 
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
  --  energyMake         = "-10",
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
  name               = "Tachyon tower",
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
  unitname           = "euf_lasertower",
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
    name               = "Tachyon Gun",
    areaOfEffect       = 40,	
    accuracy           = 100,
    burnblow           = true,	
    cegTag             = "LaserTowerGunProjectile",
    coreThickness      = 0.5,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.03,
    energypershot      = 10,	
    explosionGenerator = "custom:LaserTowerGunImpact",
	fallOffRate        = 0.25,
    fireStarter        = 20,	
	hardStop           = false,
    impulseBoost       = 0,
    intensity          = 0.5,
    interceptedByShieldType = 1,
    range              = 800,
    reloadtime         = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    rgbColor           = "0 1 0",
    rgbColor2           = "0.8 1 0.35",
    soundHit           = "AgaresLaserHit",
    soundStart         = "heavylaser",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 1250,
    targetMoveError    = 0.4,	
    texture1           = "megaparticle",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "null_texture",	
    thickness          = 14,
    tolerance          = 1500,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 1250,
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
