-- UNITDEF -- euf_interceptor --
--------------------------------------------------------------------------------

local unitName = "euf_interceptor"


local unitDef = {
  unitname           = "euf_interceptor",
  name               = "Interceptor",  
  description        = "Fast anti-aircraft",
  buildPic           = "euf_interceptor.png",  
  objectName         = "euf_interceptor.s3o",
  script             = "euf_interceptor.lua",  
  
  acceleration       = 0.5,
  airHoverFactor     = 0,
  airStrafe          = false,
  armortype          = "FLYER",
  brakeRate          = 1.0,
  buildCostEnergy    = 220,
  buildCostMetal     = 220,
  buildTime          = 220,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF AIR",
  collide            = true,
  collisionSphereScale = 1.0,
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_interceptor_normal.png",
	normalmaps = "yes",			
    helptext = "The Interceptor is the ideal choice against airborne targets."	
	},
  cruiseAlt          = 200,
  dontland           = "1",
  --  energyMake         = "-1",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  hoverAttack        = true,
  iconType           = "triangle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 400,
  maxDamage          = 600,
  maxSlope           = 25,
  maxVelocity        = 13,
  nanoColor          = "0 0 0",
  radarDistance      = 512,
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  turnRate           = 1024,
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:MLRSRocketTrail",	  
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
      "interceptor_move",
    },
    select = {
      "interceptor_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "AALAZER",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "AIR",
    },
    [2]  = {
     	def                = "AALAZER",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "AIR",	  
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AALAZER = {
    areaOfEffect       = 32,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    burnblow           = true,
	canattackground         = false,
    cegTag             = "MLRSRocketTrail",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
      energypershot           = 0,
	explosiongenerator=	"custom:SMALL_EXPLOSION_BLUE",
    explosionSpeed     = 65536,
    fireStarter        = 70,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "Rocket.s3o",
    name               = " Missile",
    --noSelfDamage       = true,
    range              = 450,
    reloadtime         = 2.5,
    smokeTrail         = false,
    soundHit           = "mediumexplosion",
    soundStart         = "launchrocket",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundStartVolume   = 10,
    startVelocity      = 400,
    targetBorder       = 0,
    tolerance          = 500,
    tracks             = true,
    turnRate           = 24000,
    turret             = true,
    weaponAcceleration = 100,
    weaponTimer        = 3,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 600,
    damage = {
      default            = 180*0.2,
      flyer              = 180,
      heavy              = 180*0.2,
      light              = 180*0.2,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------