-- UNITDEF -- tc_ghoul --
--------------------------------------------------------------------------------

local unitName = "tc_ghoul"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "LIGHT",
  brakeRate          = 1.5,
  buildCostEnergy    = 110,
  buildCostMetal     = 110,
  buildPic           = "tc_ghoul.jpg",
  buildTime          = 110,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
--  collisionVolumeOffsets 	= "0 0 0",
--  collisionVolumeScales 	= "25 37 25",
--  collisionVolumeType 		= "box",
--  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname		   = "cursed",	
	isinfantry = "true",
--    normaltex = "unittextures/normalmaps/tc_ghoul_normal.png",
--	normalmaps = "yes",	
	canbetransported = "true",
	isbones = "true",
    canjump        = [[1]],
	canburrow      = "true",
	jumpclass = [[ghoul]],	
    helptext = "Ghouls are effective and fast melee units. The jump ability can be used to counter light artillery and to overcome obstacles."			
  },
  defaultmissiontype = "Standby",
  description        = "Fast Melee Unit",
  --  energyMake         = "-0.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 650,
  maxSlope           = 14,
  maxVelocity        = 3.2,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Ghoul",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_ghoul.s3o",
  radarDistance      = 0,
  repairable         = false,  
  script             = 'tc_ghoul.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  unitname           = "tc_ghoul",
  upright            = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING",
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
      "ghoul_move",
    },
    select = {
      "ghoul_select",
    },
  },
  weapons = {
    [1]  = {
      name                = "GHOULMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory  = "AIR HEAVYARMOR",	  
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_ghoul",
		featuredecaytime	= "60"
	},  
    damage             = 300,
    mass               = 1100,
    description        = "Ghoul",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "tc_ghoul_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
