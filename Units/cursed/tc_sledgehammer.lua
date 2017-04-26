-- UNITDEF -- TC_SLEDGEHAMMER --
--------------------------------------------------------------------------------

local unitName = "tc_sledgehammer"

--------------------------------------------------------------------------------
local unitDef = {
  name               = "Sledgehammer",
  category           = "CURSED AIR HEAVYARMOR",
  buildPic           = "tc_sledgehammer.png",
  objectName         = "TC_Sledgehammer.s3o",
  unitname           = "tc_sledgehammer",
  iconType           = "triangle",
  armortype          = "FLYER",
  side               = "cursed",  
  customParams          = {  
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext = "The sledgehammer gunship is perfect against groups of ground targets."
	},
  description        = "Good against ground swarms.",
-- Costs and HPs, Sight distance
  buildCostEnergy    = 750,
  buildCostMetal     = 750,
  buildTime          = 750,
  maxDamage          = 1500,
  sightDistance      = 512,
--  Flyer/Movement specifics 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,  
  airStrafe          = true,
  upright            = true,
  dontland           = "1", 
  acceleration       = 1.0,
  airHoverFactor     = 0.1,
  brakeRate          = 0.66,
  cruiseAlt          = 150,
  maxVelocity        = 6.0,
  turnRate           = 500,
-- Collision
  collide            = true,
  collisionSphereScale = 1.0,
--
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  --  energyMake         = "-10",
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 400,
  mass               = 200,
  smoothAnim         = false,
-- Effects and Explosions  
  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = false,
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",  
  explodeAs          = "SMALL_EXPLOSION_GREEN",
-- 
  sfxtypes = {
    explosiongenerators = {
      "custom:DefenderGunFlare",
      "custom:Small_Explosion_Green",
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
      "gunship_move",
    },
    select = {
      "gunship_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",	
      def                = "CHAINLIGHTROCKET",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR AIR",	
      def                = "CHAINLIGHTROCKET",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CHAINLIGHTROCKET = {
    accuracy           = 128,  
	name			=	"unguided rocket",
	weapontype		=	"MissileLauncher",
	-- rendertype		=	1,
	model			=	"rocket.s3o",
	turret		=	1,
	tolerance		=	2000,
    gravityAffected          = true,
	CanAttackGround = true,
	trajectoryheight	=	0.66,
    energypershot           = 0,	
	firestarter		=	0,
	range			=	500,
	flighttime		=	5,
	reloadtime		=	12,
	burst			=	4,
	burstrate		=	0.25,
	wobble		=	5000,
	startvelocity	=	100,
	weaponacceleration=	100,
	weaponvelocity	=	400,
	areaofeffect	=	224,
	edgeeffectiveness	=	0.1,
	weapontimer		=	1,
	targetmoveerror	=	0.075,
	soundtrigger	=	0,
	soundstart		=	"MRLS_rocket",
	soundhit		=	"mediumexplosion_2",
	cegtag			=	"MLRSRocketTrail",
	explosiongenerator = "custom:Smoke_MLRS",
	explosionspeed	=	100,
	cratermult		=	0.5,
	craterboost		=	0,
	impulsefactor	=	0,
	impulseboost	=	0,
	interceptedByShieldType = 1,
    damage = {
      default            = 120,
      flyer              = 120,
      heavy              = 120,
      light              = 120,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
