-- UNITDEF -- euf_bazooka --
--------------------------------------------------------------------------------

local unitName = "euf_bazooka_missile"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 240,
  buildCostMetal     = 240,
  buildPic           = "euf_bazooka_missile.png",
  buildTime          = 240,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canBeCloaked       = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  corpse             = "dead",
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
    helptext = "The missile trooper is effective against heavily armored units, buildings and air targets."	
	},  
  defaultmissiontype = "Standby",
  description        = "Building Killer",  
  --  energyMake         = "-1",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 550,
  maxDamage          = 700,
  maxSlope           = 20,
  maxVelocity        = 1.8,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Missile Trooper",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_bazooka_missile.s3o",
  radarDistance      = 512,
  repairable         = false,   
  script             = "euf_bazooka.lua",
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "euf_bazooka_missile",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:blood_spray",
      "custom:FLAKImpact",
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
		  "marine_move",
		},
		select = {
		  "marine_select",
		},
	  },  
  weapons = {
    [1]  = {
      name                = "AA_TROOPER",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "LIGHTARMOR",	  
    },
    [2]  = {
      name                = "AA_TROOPER_BUNKER",
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "LIGHTARMOR",	  
    },	
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_undeadmarine_melee",
		featuredecaytime	= "60"		
	},  
    damage             = 300,
    description        = "Dead Ripper",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_bazooka_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------