-- UNITDEF -- tc_cacodemon --
--------------------------------------------------------------------------------

local unitName = "tc_cacodemon"

--------------------------------------------------------------------------------

local unitDef = {
  name               = "Cacodemon",
  category           = "CURSED AIR",
  buildPic           = "tc_cacodemon.png",
  objectName         = "tc_cacodemon.s3o",
  unitname           = "tc_cacodemon",
  script             = "tc_cacodemon.lua",  
  iconType           = "triangle",
  armortype          = "FLYER",    
  side               = "cursed",  
  customParams          = {
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/tc_cacodemon_normal.png",
	normalmaps = "yes",
    canjump        = [[1]],
	jumpclass = [[warpjump]],
    helptext = "The cacodemon is dangerous against slow or mobile ground targets. The jumping ability renders it extremely dangerous."			
  },
  description        = "Good against ground targets",
-- Costs and HPs, Sight distance
  buildCostEnergy    = 650,
  buildCostMetal     = 650,
  buildTime          = 650,
  maxDamage          = 800, --was 500
  sightDistance      = 512,
--  Flyer/Movement specifics 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,  
  airStrafe          = true,
  upright            = true,
  dontland           = "1", 
  acceleration       = 0.1,
  airHoverFactor     = 0.1,
  brakeRate          = 0.931,
  cruiseAlt          = 220,
  maxVelocity        = 2.0,
  turnRate           = 700,
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
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 400,
  mass               = 200,
  smoothAnim         = false,
-- Effects and Explosions  
  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = false,
  selfDestructAs     = "NULL",  
  explodeAs          = "NULL",
--
  sfxtypes = {
    explosiongenerators = {
      "custom:ARTYAIM",
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:CACO_TELEPORT",	  
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
      "cacodemon",
    },
    select = {
      "cacodemon",
    },
  },
 weapons = {
    [1]  = {
      badTargetCategory = "AIR LIGHTARMOR",
      def                = "CACOBALL",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CACOBALL = {
 	  name					= [[Cacodemon Blast]],
	  areaOfEffect			= 32,
	  accuracy              = 64,	  
	  avoidFeature			= false,	  
	  avoidFriendly      	= true,
	  cegTag				= [[CACO_SHELLFLARE]],
	  CollideFriendly		= true,   
	  edgeEffectiveness		= 0.5,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:CACOEXPLOSION]],
	  explosionSpeed		= 5,
	  fireStarter			= 100,
	  groundBounce			= false,
	  impulseFactor			= 1e-06,
      noSelfDamage          = true,	  
	  range					= 450,
	  reloadTime			= 3,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 128,  
--  Sound	------------------------------------------------	
    soundHit           = "cannon_hit1",
    soundStart         = "roar",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
    cegtag			   = "CACO_SHELLFLARE",	
	rgbColor		   = "0.5 0 1",			
--	Weaponspecial ------------------------------------------ 
--    model              = "plasma_green.s3o",
	alphaDecay 		   = 1.0,
    heightBoostFactor  = 1.2,
	size               = 5,
	stages 			   = 3,
	weaponType         = "Cannon",
------------------------------------------------------------
    damage = {
      default            = 100,
      flyer              = 100,
      heavy              = 100,
      light              = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs




--[[ local weaponDefs = {
  CACOBALL = {
    accuracy           = 4,
    areaOfEffect       = 32,
    -- beamweapon         = true,
    cegTag             = "CACO_SHELLFLARE",
    collisionSize      = 1,
    coreThickness      = 0.75,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.05,
    energypershot      = 0,	
    explosionGenerator = "custom:WITCHRAY",
	fallOffRate        = 0.0,
	hardStop           = false,
    impulseBoost       = 0,
    intensity          = 0.5,
    interceptedByShieldType = 1,
    -- lineofsight        = true,
    name               = "Cacodemon Blast",
	collideGround    = true,
    range              = 400,
    reloadtime         = 3,
    rgbColor 		   = "0.5 0 1",
	rgbColor2           = "1 1 1",
	soundHit           = "cannon_hit1",
    soundStart         = "roar",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 1000,
    texture1           = "waveball",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 6,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 200,	
    damage = {
      default            = 100,
      flyer              = 100,
      heavy              = 100,
      light              = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs ]]


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
