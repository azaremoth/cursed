-- UNITDEF -- euf_paladin --
--------------------------------------------------------------------------------

local unitName = "euf_paladin_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.5,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "euf_paladin.png",
  buildTime          = 400,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = false,
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "25 33 25",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",
	normaltex = "unittextures/normalmaps/euf_paladin_normal.png",
	normalmaps = "yes",		
--	RequireTech         = "Factory",
    helptext 	= "Fast melee unit. It has the aura of thorns (hurts nearby enemies) as long as a sanctum exists."
 },  
  defaultmissiontype = "Standby",
  description        = "Fast Melee Unit. Prerequisite: War Factory",
  --  energyMake         = "-2",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1800,
  maxSlope           = 14,
  maxVelocity        = 3,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Paladin",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_paladin.s3o",
  radarDistance      = 512,
  repairable         = false,   
  script             = "euf_paladin.lua",  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  unitname           = "euf_paladin_ai",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:blood_spray",
      "custom:SPARKLES",	  
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "pala3",
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
      "pala2",
    },
    select = {
      "pala1",
    },
  },
  weapons = {
    [1]  = {
      name                = "PALADINMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
	  badTargetCategory = "AIR HEAVYARMOR",
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
		resurrectintounit	= "tc_undeadmarine_melee",
		featuredecaytime	= "60"		
	},  	
    damage             = 300,
    mass               = 1100,	
    description        = "Dead Paladin",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "euf_paladin_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
