-- UNITDEF -- euf_scorpion --
--------------------------------------------------------------------------------

local unitName = "euf_scorpion_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  brakeRate          = 0.1,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_scorpion.png",
  buildTime          = 500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   		= "imperials",
	normaltex 				= "unittextures/normalmaps/euf_scorpion_normal.png",
	normalmaps 				= "yes",		
	helptext 				= "This unit can dig into the ground and move very slowly but hidden from the enemy. The laser gun is effective against light armor."	
	},
  defaultmissiontype = "Standby",
  description        = "Digger",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1900,
  maxSlope           = 10,
  maxVelocity        = 1.9,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK2X2_AMP",
  name               = "Scorpion",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_scorpion.s3o",
  script             = "euf_scorpion.cob",   
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
       
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 5,
  trackStretch           = 1,
  trackType              = [[StdTank_small]],
  trackWidth             = 29,   
  
  turnRate           = 200,
  unitname           = "euf_scorpion_ai",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:RaiderLaserFlare",
      "custom:ScorpionGroundflash",
      "custom:BURROWING",	  
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_emergency",
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
      "tank_move",
    },
    select = {
      "tank_select",
    },
  },
  weapons = {
    [1]  = {
      name                = "SCORPIONLASER",
      onlyTargetCategory  = "LAND",
      badTargetCategory   = "HEAVYARMOR",
    },
  },
}

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "60"
	}, 		
    damage             = 8000,
    description        = "Wrecked Scorpion",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_scorpion_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
