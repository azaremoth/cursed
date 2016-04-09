-- UNITDEF -- TC_ENFORCER --
--------------------------------------------------------------------------------

local unitName = "euf_pyro"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "light",
  brakeRate          = 1.5,
  buildCostEnergy    = 270,
  buildCostMetal     = 270,
  buildPic           = "euf_pyro.png",
  buildTime          = 270,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  corpse             = "dead",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
	canbetransported = "true",
    canjump        = [[1]],
	jumpclass = [[baseclass]],		
    helptext = "Pyros are very effective against light armored units. The jump ability can be used to counter light artillery and for deadly surprise attacks."		
  },
  defaultmissiontype = "Standby",
  description        = "Antiswarm",
  --  energyMake         = "-0.5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 900,
  maxSlope           = 20,
  maxVelocity        = 2,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Pyro",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_pyro.s3o",
  repairable         = false,   
  script             = "euf_pyro.lua",  
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1500,
  unitname           = "euf_pyro",
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:JUMPBURST",
      "custom:FLAMERGROUNDFLASH",
      "custom:blood_spray",
      "custom:Greycloud",
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
      badTargetCategory = "AIR HEAVYARMOR",	  	
	  def                = "Flamer",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND",
    },
    [2]  = {
	  badTargetCategory = "AIR HEAVYARMOR",      
	  def                = "Flamer_Bunker",
      onlyTargetCategory = "LAND",	  
    },	
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
Flamer = {
	  name					= [[Flamer]],
	  areaOfEffect			= 128,
	  avoidFeature			= false,	  
	  avoidFriendly      	= true,
	  burst					= 8,
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
	  lineofsight			= 1,
      noSelfDamage            = true,	  
	  range					= 250,
	  reloadTime			= 2.5,
	  rendertype			= 1,
	  size					= 0.01,
	  soundStart			= [[flamer]],
	  soundTrigger			= false,
	  sprayAngle			= 1024,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 240,
	  weaponType         = "Cannon",	  
	 damage = {
				default            = 45, --56
				flyer              = (45*0.75),
				heavy              = (45*0.75),
				light              = 45,
		},
	},
Flamer_Bunker = {
	  name					= [[Flamer_Bunker]],
	  areaOfEffect			= 128,
	  avoidFeature			= false,  
	  avoidFriendly      	= false,
	  burst					= 8,
	  burstRate				= 0.05,
	  cegTag				= [[Flametrail]],
	  CollideFriendly		= false,   
	  edgeEffectiveness		= 0.0,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:Flamethrower]],
	  explosionSpeed		= 5,
	  fireStarter			= 100,
	  groundBounce			= true,
	  impulseFactor			= 1e-06,
	  lineofsight			= 1,
	  range					= 250,
	  reloadTime			= 2.5,
	  rendertype			= 1,
	  size					= 0.01,
	  soundStart			= [[flamer]],
	  soundTrigger			= false,
	  sprayAngle			= 1024,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 240,
	 damage = {
				default            = 45,
				flyer              = (45*0.75),
				heavy              = (45*0.75),
				light              = 45,
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
		resurrectintounit	= "tc_undeadmarine_melee",
		featuredecaytime	= "60"		
	},  
    damage             = 300,
    mass               = 1100,	
    description        = "Dead Pyro",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_pyro_dead.s3o",
    reclaimable        = false,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
