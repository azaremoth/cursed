-- UNITDEF -- TC_SEEKER --
--------------------------------------------------------------------------------

local unitName = "tc_seeker"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "tc_seeker",
  name               = "Seeker",    
  description        = "Air Scout",  
  objectName         = "tc_seeker.s3o",
  script             = "tc_seeker.lua",
  buildPic           = "tc_seeker.png",
  category           = "CURSED AIR",
  armortype          = "FLYER",
  side               = "cursed",
  iconType           = "triangle", 
  customParams          = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext 	= "The Seeker is a very fast airborne scout."
	},
-- Costs
  buildCostEnergy     = 40,
  buildCostMetal      = 40,
  buildTime           = 40,
  maxDamage           = 180, -- was 900   
  sightDistance       = 1024,
--  Flyer/Movement specifics 
  airStrafe          = false, 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,
  upright            = true,
  dontland           = "1",  
  acceleration       = 1.00,
  airHoverFactor     = 0,
  brakeRate          = 0.66,
  cruiseAlt          = 100,
  maxVelocity        = 20,
  turnRate           = 1024,
-- Collision
  collide            = true,
  collisionSphereScale = 1.0,
--
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = "1",
  defaultmissiontype  = "VTOL_standby",
  fireState           = 2,
  footprintX          = 2,
  footprintZ          = 2,
  idleAutoHeal        = 0.01,
  idleTime           = 400,
  mass                = 600,
  noChaseCategory     = "AIR",
  seismicSignature    = 0,
  smoothAnim          = true,
  stealth            = true,
-- Effects and Explosions
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_GREEN",
	  "custom:MLRSRocketTrail",
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
      "interceptor_move",
    },
    select = {
      "interceptor_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
