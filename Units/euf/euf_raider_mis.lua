-- UNITDEF -- euf_raider_mis --
--------------------------------------------------------------------------------

local unitName = "euf_raider_mis"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.1,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "euf_raider.png",
  buildTime          = 400,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 40 80",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,   
  corpse             = "dead",  
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_raider_normal.png",
	normalmaps = "yes",	
	unitaiupdate = "10",
    helptext = "Fast scouting and attack car. It is appropriate for hit and run tactics."	
	},
  defaultmissiontype = "Standby",
  description        = "fast scout",
  --  energyMake         = "-3.5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1500,
  maxSlope           = 10,
  maxVelocity        = 0.00000001,
  maxReverseVelocity = 2.0,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "LIGHTTANK3X3",
  name               = "Raider",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_raider.s3o",
  script             = "euf_raider.cob",
  selfDestructAs     = "NULL",
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
  trackType              = [[tracks]],
  trackWidth             = 40, 

  turnInPlace        = false,
  turnInPlaceSpeedLimit = 0.1,
  turnRate           = 0.1,
  
  unitname           = "euf_raider_mis",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:RaiderLaserFlare",
      "custom:RaiderLaserGroundflash",
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
      "raider_move",
    },
    select = {
      "raider_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR",
      name                = "RAIDER_LASER",	  
      onlyTargetCategory = "LAND",
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
    damage             = 6000,
    description        = "Wrecked Raider",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_raider_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
