-- UNITDEF -- TC_DEATHWALKER--
--------------------------------------------------------------------------------

local unitName = "tc_deathwalker"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 4000,
  buildCostMetal     = 4000,
  buildPic           = "tc_deathwalker.png",
  buildTime          = 4000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "60 100 60",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {	
	factionname		   = "cursed",
	noxpgain = "1",
    normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",
    helptext = "Prepare to die."
	},
  defaultmissiontype = "Standby",
  description        = "Ultimate superwalker of death",
  --  energyMake         = "-5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "bigcircle",
  idleAutoHeal       = 12,
  idleTime           = 300,
  mass               = 30000,
  maxDamage          = 20000,
  maxSlope           = 15,
  maxVelocity        = 1.8,
  maxWaterDepth      = 50,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Deathwalker",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_deathwalker.s3o",
  repairable         = false,     
  script             = 'tc_deathwalker.lua',
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 1024,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[Walker]],
  trackWidth             = 60,  
  
  turnRate           = 750,
  unitname           = "tc_deathwalker",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGEST",
      "custom:Greycloud",
      "custom:BIG_EXPLOSION_GREEN",
      "custom:BelialBigGunFlare",
      "custom:FLAKImpact",
      "custom:GunGroundFlash_Medium",
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
      badTargetCategory  = "LIGHTARMOR",
      def                = "DWBIGGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "DWBIGGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND",
    },
    [3]  = {
      name                = "AA_DW",
      maxAngleDif        = 360,
      badTargetCategory = "LAND",	  
      onlyTargetCategory = "AIR",
    },	
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  DWBIGGUN = {
    avoidFriendly      = true,
    burnblow = 0,
	collideFriendly    = true,
    accuracy           = 320,
    areaOfEffect       = 40,
	cylinderTargeting = 1,		
    energypershot           = 0,	
    explosionGenerator = "custom:Mancubus_Hit_Explosion",
	explosionScar      = true,
    interceptedByShieldType = 2,
    name               = "Cannon",
    range              = 550,
    reloadtime         = 2,
    soundHit           = "mediumexplosion",
    soundStart         = "belial_biggun",
    soundStartVolume   = 40,
    soundTrigger       = true,
	sweepFire 			= false,
    targetMoveError    = 0.2,	
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	burst --------------------------------------------------
	burst = 10,
	burstrate = 0.001,
	sprayangle = 1536,
--	Weaponspecial ------------------------------------------
    intensity          = 1,
    coreThickness      = 1,	
    weaponType         = "LaserCannon",
	rgbColor           = "0.5 1 0.1",
    texture1           = "greengunshot",
    texture2           = "null_texture",
    thickness          = 4,	
------------------------------------------------------------	  
  damage = {
      default            = 150,
      flyer              = 150,
      heavy              = 150,
      light              = (140*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams       = {
		featuredecaytime		= "240",
		resurrectintounit		= "tc_deathwalker"
	},  
    damage             = 16000,
    description        = "Former Deathwalker",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "25",
    hitdensity         = "1000",
    metal              = 2000,
    object             = "tc_deathwalker_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------