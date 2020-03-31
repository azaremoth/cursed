--------------------------------------------------------------------------------

local unitName = "bug_big"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildPic           = "bug_big.png",
  buildTime          = 1000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	normaltex = "unittextures/normalmaps/bug_library_normal.png",
	normalmaps = "yes",		  
	canburrow      = "true",
	factionname		   = "neutral",
    helptext = "It is a huge space bug. Be careful."			
  },
  defaultmissiontype = "Standby",
  description        = "Robust Melee Unit",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 3200,
  maxSlope           = 14,
  maxVelocity        = 3.0,
  maxWaterDepth      = 25,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Xenosect Goliath",
  nanoColor          = "0.33 0.33 0.0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "bug_big.s3o",
  radarDistance      = 0,
  repairable         = false,  
  script             = 'bug_melee_big.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = true,
  fireState = "2",
  moveState = "2",
  turnRate           = 2500,
  unitname           = "bug_big",
  upright            = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:BLOOD_EXPLOSION_BIG_GREEN",
      "custom:BURROWING_BIGGEST",
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
      "bug_big_growl",
    },
    select = {
      "bug_big_growl",
    },
  },
  weapons = {
    [1]  = {
      name               = "BIGBUGMELEE",
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
		resurrectintounit	= "bug_big_undead",
		normaltex = "unittextures/normalmaps/bug_library_normal.png",		
		featuredecaytime	= "180"
	},  
    damage             = 2000,
    mass               = 5000,
    description        = "Dead Xenosect",
    energy             = 0,
    footprintX         = 4,
    footprintZ         = 4,
    height             = "20",
    hitdensity         = "100",
    metal              = 400,
    object             = "bug_big_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
