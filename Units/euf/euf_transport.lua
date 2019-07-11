-- UNITDEF -- euf_transport --
--------------------------------------------------------------------------------

local unitName = "euf_transport"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "euf_transport", 
  name               = "Dropship",
  description        = "Troop transport",
  objectName         = "euf_transport.s3o",
  script             = "euf_transport.lua", 
  buildPic           = "euf_transport.png",
  category           = "EUF AIR",
  armortype          = "FLYER",   
  side               = "imperials",
  iconType           = "triangle",
  customParams       = {
	transportcapa		= 8,
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
  airStrafe          = false, 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,
  upright            = true,
  dontland           = "1",  
  acceleration       = 0.20,
  airHoverFactor     = 0,
  brakeRate          = 0.15,
  cruiseAlt          = 75,
  maxVelocity        = 125,
  turnRate           = 512,
-- Collision
  collide                = false,
  collisionSphereScale   = 0.05,
  collisionVolumeOffsets = [[0 10 0]],
  collisionVolumeScales  = [[85 35 85]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[Box]],
-- misc --
  canAttack           = false,
  canGuard            = true,
  canload                = [[1]],  
  canMove             = true,
  canPatrol           = true,
  canstop            = true,
  cantBeTransported  = true, 
  defaultmissiontype  = "VTOL_standby",
  fireState           = 2,
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0.01,
  idleTime           = 400,
  mass                = 600,
  noChaseCategory     = "AIR",
  seismicSignature    = 0,
  sightDistance       = 512,
  smoothAnim          = true,
-- Effects and Explosions
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  nanoColor          = "0 0 0",
  showNanoFrame      = false,
------------- transport ---------  
  isfirePlatform     = false,
  isTransport        = true, 
  loadingRadius		 = 300,
  releaseHeld        = false,
  transportCapacity  = 12,
  transportMass      = 100000000,
  transportSize      = 10,
  transportUnloadMethod = 1,
  unloadSpread       = 2.0, 
--  fallSpeed          = 24,
--  unitFallSpeed		 = 0.2,
-------------------------------
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_YELLOW",
	  "custom:EUF_Structurebuilding_Small",
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
