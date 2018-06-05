--------------------------------------------------------------------------------

local unitName = "tc_spiderdemon"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.75,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.83105,
  buildCostEnergy    = 600,
  buildCostMetal     = 600,
  buildPic           = "tc_spiderdemon.png",
  buildTime          = 600,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext	= "XXXX"	
	},
  defaultmissiontype = "Standby",
  description        = "XXX",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1000,
  maxDamage          = 1100,
  maxSlope           = 14,
  maxVelocity        = 3.0,
  maxWaterDepth      = 24,
  mobilestandorders  = "1",
  movementClass      = "HEAVYWALKER2X2",
  name               = "Spiderdemon",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_spiderdemon.s3o",
  script             = "tc_spiderdemon.lua",  
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 768,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 9,
  trackStretch           = 1,
  trackType              = [[Pointy]],
  trackWidth             = 60,  
  
  turnRate           = 640,
  unitname           = "tc_spiderdemon",
  sfxtypes = {
    explosiongenerators = {
      "custom:MEDIUM_EXPLOSION_GREEN",
      "custom:GunGroundFlash_Medium_long",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
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
      "agares_move",
    },
    select = {
      "agares_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "PSI_BLAST",
      mainDir            = "0 0 1",
      maxAngleDif        = 60,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PSI_BLAST = {
      name                    = [[PSI Blast]],
	accuracy           = 128,
    areaOfEffect       = 64,
    avoidFeature       = false,
    avoidFriendly      = true,
    burnblow           = true,
    collisionSize      = 8,
    edgeEffectiveness  = 1,
    energypershot      = 20,
    explosionGenerator = "custom:MERMEOTH_GUNEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 100,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    gravityAffected          = false,
    range              = 600,
    reloadtime         = 3,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 550,
    turret             = true,
    startVelocity      = 275,
    weaponAcceleration = 0,
    weaponVelocity     = 275,  
	noSelfDamage       = true,
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "hellstorm_fire",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
    cegtag			   = "MERMEOTH_SHELLFLARE",	
	colorMap 			= "0.8745 1 0.16 1.0 1.0 0.75 0.16 1.0",
--	Weaponspecial ------------------------------------------ 
	size               = 12,
	weaponType         = "Cannon",
------------------------------------------------------------
    damage = {
      default            = 300,
      flyer              = 300*0.33,
      heavy              = 300,
      light              = 300,
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
		featuredecaytime		= "60"
	}, 	
    damage             = 8000,
    description        = "Former Agares",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 0,
    object             = "tc_spiderdemon_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------
return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
