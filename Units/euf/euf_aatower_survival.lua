-- UNITDEF -- euf_aatower --
--------------------------------------------------------------------------------

local unitName = "euf_aatower_survival"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 220,
  buildCostMetal     = 220,
  
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 5,
  buildingGroundDecalType = "euf_aatower_aoplane.dds",
  useBuildingGroundDecal = true,  
  
  buildPic           = "euf_aatower.png",
  buildTime          = 220,
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 50 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
  corpse             = "dead",
  customParams          = {
	factionname	= "imperials",
	normaltex = "unittextures/normalmaps/euf_aatower_normal.png",
	normalmaps = "yes",			
    helptext 	= "Anti-Air Tower. Perfect against air targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Light Defense Tower",
  --  energyMake         = "5",
  explodeAs          = "MEDIUM_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1800,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "AA Tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_aatower.s3o",
  script             = "euf_aatower.cob",
  selfDestructAs     = "MEDIUM_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "euf_aatower_survival",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:FLAKImpact",
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
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
      def                = "AA_MISSILE",
      onlyTargetCategory = "AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AA_MISSILE = {
      name                    = "Rockets",
      areaOfEffect            = 24,
      canattackground         = false,
      cegTag                  = "MLRSRocketTrail",
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting      = 128,
		energypershot           = 0,
      explosionGenerator      = "custom:FLAKImpact",
      fireStarter             = 20,
      flightTime              = 4,
      impactOnly              = true,
      impulseBoost            = 0.123,
      impulseFactor           = 0.0492,
      interceptedByShieldType = 2,
      -- lineofsight             = true,
      metalpershot            = 0,
      model                   = "ROCKET.s3o",
      --noSelfDamage            = true,
      range                   = 900,
      reloadtime              = 1.4,
      -- rendertype              = 1,
      smokeTrail              = false,
      soundHit                = "mediumexplosion",
      soundStart              = "launchrocket",
      soundTrigger            = true,
      startVelocity           = 550,
      texture2                = "none",
      tolerance               = 16000,
      tracks                  = true,
      turnRate                = 55000,
      turret                  = true,
      waterweapon             = true,
      weaponAcceleration      = 550,
      weaponTimer             = 3,
      weaponType              = "MissileLauncher",
      weaponVelocity          = 800,
    damage = {
      default            = 400,
      flyer              = 400,
      heavy              = 400,
      light              = 400,
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
    description        = "Wrecked AA Tower",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "100",
    metal              = 135,
    object             = "euf_tower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
