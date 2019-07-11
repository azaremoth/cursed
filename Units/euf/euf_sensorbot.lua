-- UNITDEF -- euf_sensorbot --
--------------------------------------------------------------------------------

local unitName = "euf_sensorbot"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.05,
  activateWhenBuilt   = true,  
  armortype          = "HEAVY",
  brakeRate          = 0.1,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "euf_sensorbot.png",
  buildTime          = 400,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	helptext = "Mobile radar and detection device. It can see everything, even cloaked and borrowed units. It will cloak when not moving."	
	},
  defaultmissiontype = "Standby",
  description        = "Radar and Detection",
  decloakDistance    = 100,  
--  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 800,
  maxSlope           = 10,
  maxVelocity        = 1.5,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK2X2",
  name               = "Sensorbot",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
--  onoffable           = true,  
  objectName         = "euf_sensorbot.s3o",
  radarDistance      = 2432,  -- was 2048
  script             = "euf_sensorbot.cob",    
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 2432,  
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 200,
  unitname           = "euf_sensorbot",
  workerTime          = 0,  
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:MEDIUM_EXPLOSION_YELLOW",
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
      "cloaker_select",
    },
    select = {
      "cloaker_select",
    },
  },
}

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "60"
	}, 		
    damage             = 8000,
    description        = "Wrecked Sensorbot",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "20",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_sensorbot_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
