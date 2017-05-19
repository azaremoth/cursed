--------------------------------------------------------------------------------

local unitName = "bug_larva_undead"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 300,
  buildCostMetal     = 300,
  buildPic           = "bug_med_undead.png",
  buildTime          = 300,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	normaltex = "unittextures/normalmaps/bug_library_normal.png",
	normalmaps = "yes",		  
	canburrow      = "true",
	factionname		   = "neutral",
    helptext = "It is a space bug larva."			
  },
  defaultmissiontype = "Standby",
  description        = "Melee Unit",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1200,
  maxSlope           = 14,
  maxVelocity        = 1.8,
  maxWaterDepth      = 15,
  mobilestandorders  = "1",
  movementClass      = "WALKER2X2",
  name               = "Undead Xenosect Larva",
  nanoColor          = "0.3 0.3 0.0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "bug_larva_undead.s3o",
  radarDistance      = 0,
  repairable         = false,  
  script             = 'bug_larva.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = true,
  fireState = "2",
  moveState = "2",
  turnRate           = 2500,
  unitname           = "bug_larva_undead",
  upright            = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:BLOOD_EXPLOSION_GREEN",
      "custom:BURROWING_BIGGER",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "",
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
      "bug_larva",
    },
    select = {
      "bug_larva",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory = "HEAVYARMOR",	  	
	  def                = "BUGSPIT",
      mainDir            = "0 0 1",
      maxAngleDif        = 140,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BUGSPIT = {
	  name					= [[Spiting]],
	  areaOfEffect			= 128,
	  avoidFriendly      	= true,
	  burst					= 5,
	  burstRate				= 0.05,
	  cegTag				= [[Spiting_trail]],
	  CollideFriendly		= true,   
	  edgeEffectiveness		= 0.5,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:BLOOD_EXPLOSION_GREEN]],
	  explosionSpeed		= 5,
	  fireStarter			= 100,
	  groundBounce			= false,
	  impulseFactor			= 1e-06,
	  -- lineofsight			= 1,
      noSelfDamage            = true,	  
	  range					= 400,
	  reloadTime			= 2.5,
	  -- rendertype			= 1,
	  size					= 0.01,
	  soundStart			= [[bug_larva_spit]],
	  soundTrigger			= true,
	  sprayAngle			= 1024,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 370,
	  weaponType         = "Cannon",
    damage = {
		default            = 50,
		flyer              = (50*0.75),
		heavy              = (50*0.75),
		light              = 50,
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
		resurrectintounit	= "bug_larva",
		featuredecaytime	= "150"
	},  
    damage             = 500,
    mass               = 5000,
    description        = "Dead Xenosect",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "20",
    hitdensity         = "100",
    metal              = 150,
    object             = "bug_larva_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
