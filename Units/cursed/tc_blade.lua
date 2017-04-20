-- UNITDEF -- TC_BLADE --
--------------------------------------------------------------------------------

local unitName = "tc_blade"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "tc_blade",
  name               = "Blade",  
  description        = "Interceptor",  
  buildPic           = "tc_blade.png",
  objectName         = "tc_blade.s3o",
  script             = 'tc_blade.lua', 

--  Flyer/Movement specifics 
  airStrafe          = false, 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,
  upright            = true,
  dontland           = "1",  
  acceleration       = 0.5,
  airHoverFactor     = 0,
  brakeRate          = 1.0,
  cruiseAlt          = 400,
  maxVelocity        = 13,
  turnRate           = 1024,
--
  armortype          = "FLYER",
  buildCostEnergy    = 220,
  buildCostMetal     = 220,
  buildTime          = 220,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED AIR",
  collide            = true,
  collisionSphereScale = 1.0,
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext	= "The Interceptor is the ideal choice against airborne targets."	
	},
  --  energyMake         = "-1",
  explodeAs          = "SMALL_AIRPLANE_BLAST_GREEN",
  selfDestructAs     = "SMALL_AIRPLANE_BLAST_GREEN",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "triangle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 400,
  maxDamage          = 600,
  maxSlope           = 25,
  radarDistance      = 512,
  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
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
  weapons = {
    [1]  = {
      def                = "BLADE_MISSILE",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "AIR",	  
    },
    [2]  = {
     	def                = "BLADE_MISSILE",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "AIR",	  
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BLADE_MISSILE = {
    areaOfEffect       = 32,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    burnblow           = true,
    canattackground         = false,	
    cegTag             = "BLADEGUN_SHELLFLARE",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
      energypershot           = 0,
    explosionGenerator = "custom:BLADEGUN_Impact",
    explosionSpeed     = 65536,
    fireStarter        = 70,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "Rocket.s3o",
    name               = "Magic Missile",
    --noSelfDamage       = true,
    range              = 450,
    reloadtime         = 2.5,
    smokeTrail         = false,
--    soundHit           = "blade",
    soundHitVolume     = 10,
    soundStart         = "blade",
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
