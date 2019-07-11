-- UNITDEF -- euf_transport_mis --
--------------------------------------------------------------------------------

local unitName = "euf_transport_mis"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "euf_transport_mis", 
  name               = "Dropship",
  description        = "Troop transport",
  objectName         = "euf_transport_mis.s3o",
  script             = "euf_transport_mis.lua", 
  buildPic           = "euf_transport.png",
  category           = "EUF AIR",
  armortype          = "FLYER",   
  side               = "imperials",
  iconType           = "triangle",
  customParams       = {
--	transportcapa		= 8,
	factionname			= "imperials",
	normaltex 			= "unittextures/normalmaps/euf_transport_normal.png",
	normalmaps 			= "yes",			
	helptext 			= "An armored flying troop transporter that can hold up to 8 soldiers."	
  }, 
-- Costs and HPs
  buildCostEnergy     = 600,
  buildCostMetal      = 600,
  buildTime           = 600,
  maxDamage           = 1800,  
--  Flyer/Movement specifics 
  isImmobile          = false, 
-- Collision
  collide                = false,
  collisionSphereScale   = 0.05,
  collisionVolumeOffsets = [[0 10 0]],
  collisionVolumeScales  = [[85 35 85]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[Box]],
-- misc --
  canAttack           = false,
  canGuard            = false,
--  canload                = [[1]],  
  canMove             = false,
  canPatrol           = false,
  canstop            = false,
  cantBeTransported  = true, 
  fireState           = 2,
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0.01,
  idleTime           = 400,
  mass                = 600,
  noChaseCategory     = "AIR",
  seismicSignature    = 0,
  sightDistance       = 512,
-- Effects and Explosions
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  nanoColor          = "0 0 0",
  showNanoFrame      = false,
------------- transport ---------  
  isfirePlatform     = false,
  isTransport        = false, 
-------------------------------
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:Greycloud_Big",	  
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
      "bomber_move",
    },
    select = {
      "bomber_select",
    },
  },
 weapons = {},
}


--------------------------------------------------------------------------------


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
