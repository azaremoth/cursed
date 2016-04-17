-- UNITDEF -- euf_sniper --
--------------------------------------------------------------------------------

local unitName = "euf_sniper_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.5,
  armortype          = "LIGHT",
  brakeRate          = 1.5,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "euf_sniper.png",
  buildTime          = 400,
  canAttack          = true,
  canCloak           = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  cloakCost          = 0,
  cloakCostMoving    = 0,
  corpse             = "dead", 
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
	canbetransported = "true",	
	mana = 100,
	manaregeneration = 3,
	manacloakcosts = 3.33,
	helptext = "Cloakable long ranged anti-infantry. Very effective against light units and light artillery. Needs a factory to be build."
  },    
  defaultmissiontype = "Standby",
  description        = "cloakable long ranged anti-infantry",
  decloakDistance    = 100,
--  energyMake         = "-1",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 630,
  maxSlope           = 14,
  maxVelocity        = 2.2,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Sniper",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_sniper.s3o",
  radarDistance      = 512,
  repairable         = false,   
  script             = "euf_sniper.lua",
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  unitname           = "euf_sniper_ai",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:BLOOD_EXPLOSION",
      "custom:blood_spray",	  
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
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
      "sniper",
    },
    select = {
      "sniper",
    },
  },
  weapons = {
    [1]  = {
      def                = "SNIPER_RIFLE",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      badTargetCategory  = "AIR HEAVYARMOR",
      onlyTargetCategory = "LAND AIR",
    },
	[2]  = {
      def                = "SNIPER_RIFLE_BUNKER",
      badTargetCategory  = "AIR HEAVYARMOR",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SNIPER_RIFLE = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 20,
    areaOfEffect       = 20,
    beamTime           = 0.10,
    burnblow           = true,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
      energypershot           = 0,
    explosionGenerator = "custom:AGARES_LASER",
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Sniper Laser Rifle",
    range              = 800,
    reloadtime         = 7,
    -- rendertype         = 0,
    rgbColor           = "0.45 1 0.45",
    soundHit           = "",
    soundStart         = "sniper_gunshot",
	soundStartVolume  	= 100,	
    soundTrigger       = true,
	sweepFire		   = false,	
    targetMoveError    = 0.4,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 4,
    tolerance          = 120,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 900,
    damage = {
      default            = 800,
      flyer              = 800*0.15,
      heavy              = 800*0.15,
      light              = 800,
    },
  },
  SNIPER_RIFLE_BUNKER = {
    avoidFriendly      = false,
	collideFriendly    = false,
	accuracy           = 20,
    areaOfEffect       = 20,
    beamTime           = 0.10,
    burnblow           = true,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
      energypershot           = 0,
    explosionGenerator = "custom:AGARES_LASER",
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Sniper Laser Rifle",
    range              = 800,
    reloadtime         = 7,
    -- rendertype         = 0,
    rgbColor           = "0.45 1 0.45",
    soundHit           = "",
    soundStart         = "sniper_gunshot",
	soundStartVolume  	= 100,	
    soundTrigger       = true,
	sweepFire		   = false,	
    targetMoveError    = 0.4,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 4,
    tolerance          = 120,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 900,
    damage = {
      default            = 800,
      flyer              = 800*0.15,
      heavy              = 800*0.15,
      light              = 800,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1, 
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_skeleton",
		featuredecaytime	= "60"			
	},  
    damage             = 300,
    mass               = 1100,	
    description        = "Dead Sniper",
    energy             = 0,
    footprintX         = 1,
    footprintZ         = 1,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_sniper_dead.s3o",
    reclaimable        = false,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
