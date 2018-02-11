--------------------------------------------------------------------------------

local unitName = "bug_med"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "bug_med.png",
  buildTime          = 500,
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
    canjump        = [[1]],
	canburrow      = "true",
	jumpclass = [[ghoul]],	
	factionname		   = "neutral",
    helptext = "It is a space bug."			
  },
  defaultmissiontype = "Standby",
  description        = "Melee Unit",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1000,
  maxSlope           = 14,
  maxVelocity        = 3.5,
  maxWaterDepth      = 15,
  mobilestandorders  = "1",
  movementClass      = "WALKER3X3",
  name               = "Xenosect",
  nanoColor          = "0.3 0.3 0.0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "bug_med.s3o",
  radarDistance      = 0,
  repairable         = false,  
  script             = 'bug_melee.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = true,
  fireState = "2",
  moveState = "2",
  turnRate           = 2500,
  unitname           = "bug_med",
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
      "bug_med_growl",
    },
    select = {
      "bug_med_growl",
    },
  },
  weapons = {
    [1]  = {
      name               = "MEDBUGMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory  = "HEAVYARMOR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------


local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = true,
	customParams          = {
		resurrectintounit	= "bug_med_undead",
		normaltex = "unittextures/normalmaps/bug_library_normal.png",		
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
    metal              = 200,
    object             = "bug_med_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
