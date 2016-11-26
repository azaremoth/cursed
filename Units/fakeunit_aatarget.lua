-- UNITDEF -- FAKE UNIT FOR JUMPJETS --
--------------------------------------------------------------------------------

local unitName = "fakeunit_aatarget"

--------------------------------------------------------------------------------

local unitDef = {
 unitname           = "fakeunit_aatarget",
  name               = "Fakeunit",  
  description        = "Fakeunit",  
  
  amphibious          = false,
  armortype          = "FLYER",  
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  buildPic           = "NULL.png",
  buildTime           = 0,
  canAttack           = false,
  canDropFlare        = true,
  canFly              = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop            = "1",
  capturable         = false,  
  canSubmerge         = false,
  category           = "CURSED AIR LAND",
  collide             = false,
  cruiseAlt           = 300,
  customParams       = {	
	factionname	= "cursed",
    helptext	= "The Interceptor is the ideal choice against airborne targets."	
	},
  defaultmissiontype  = "VTOL_standby",
  energyMake         = "-1",  
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  fireState           = 2,
  floater             = true,
  footprintX          = 2,
  footprintZ          = 2,
  frontToSpeed        = 0.5,
  iconType           = "triangle",
  idleAutoHeal        = 5,
  idleTime           = 400,
  maneuverleashlength = "1280",
  mass                = 150,
  maxAcc              = 0.5,
  maxDamage           = 450,
  maxVelocity         = 13,
  noChaseCategory     = "AIR",
  objectName         = "empty.s3o",
  script             = 'empty.lua',  
  seismicSignature    = 0,
  side               = "cursed",
  sightDistance       = 512,
  smoothAnim          = true,
  speedToFront        = 0.5,
  TEDClass            = [[VTOL]], 

  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = true,

  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_GREEN",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
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
      "",
    },
    select = {
      "",
    },
  },
}


--------------------------------------------------------------------------------


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
