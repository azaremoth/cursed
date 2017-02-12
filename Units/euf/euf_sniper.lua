-- UNITDEF -- euf_sniper --
--------------------------------------------------------------------------------

local unitName = "euf_sniper"

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
  cloakCost          = 0, --was 30
  cloakCostMoving    = 0, --was 60
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
	manaregeneration = 2,
	manacloakcosts = 2.25,
	RequireTech         = "Factory",
	helptext = "Cloakable long ranged anti-infantry. Very effective against light units and light artillery. Needs a factory to be build."
  },    
  defaultmissiontype = "Standby",
  description        = "Cloakable long ranged anti-infantry. Prerequisite: War Factory",
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
  unitname           = "euf_sniper",
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
      name                = "SNIPER_RIFLE",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      badTargetCategory  = "AIR HEAVYARMOR",
      onlyTargetCategory = "LAND",
    },
	[2]  = {
      name                = "SNIPER_RIFLE_BUNKER",
      badTargetCategory  = "AIR HEAVYARMOR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_enforcer",
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
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
