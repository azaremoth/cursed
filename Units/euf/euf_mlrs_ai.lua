-- UNITDEF -- euf_mlrs --
--------------------------------------------------------------------------------

local unitName = "euf_mlrs_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.9,
  buildCostEnergy    = 950,
  buildCostMetal     = 950,
  buildPic           = "euf_mlrs.png",
  buildTime          = 950,
  canAttack          = true,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
  	factionname		= "imperials",
	normaltex 		= "unittextures/normalmaps/euf_mlrs_normals.png",
	normalmaps 		= "yes",				
    helptext 		= "A hovering long ranged artillery that is very effective against structures."	
  },      
  defaultmissiontype = "Standby",
  description        = "Hovering MLRS",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 3000,
  maxDamage          = 1500,
  maxSlope           = 16,
  maxVelocity        = 3.0,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  movementClass      = "TANKHOVER3x3",
  name               = "mlrs",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_mlrs.s3o",
  script             = "euf_mlrs.cob",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1000,
  unitname           = "euf_mlrs_ai",
  sfxtypes = {
    explosiongenerators = {
      "custom:FLAKImpact",
      "custom:HOVER_WATERCLOUD",
      "custom:GunGroundFlash_Small_Yellow",
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
      "mlrs_move",
    },
    select = {
      "mlrs_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",
      def                = "MLRS",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  MLRS = {
	name			=	"unguided rocket",
	weapontype		=	"MissileLauncher",
	-- rendertype		=	1,
	model			=	"rocket2.s3o",
	turret		=	1,
	tolerance		=	2000,
    gravityAffected          = true,
	CanAttackGround = true,
	trajectoryheight	=	0.66,
    energypershot           = 0,	
	firestarter		=	0,
	range			=	1800,
	flighttime		=	5,
	reloadtime		=	20,
	burst			=	8,
	burstrate		=	0.25,
	wobble		=	5000,
	startvelocity	=	10,
	weaponacceleration=	2000,
	weaponvelocity	=	750,
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
      default            = 200,
      flyer              = 200,
      heavy              = 200,
      light              = 200,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "60"
	}, 		
    damage             = 8000,
    description        = "Wrecked MLRS",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "20",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_mlrs_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
