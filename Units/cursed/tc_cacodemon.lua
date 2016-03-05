-- UNITDEF -- tc_cacodemon --
--------------------------------------------------------------------------------

local unitName = "tc_cacodemon"

--------------------------------------------------------------------------------

local unitDef = {
  name               = "Cacodemon",
  category           = "CURSED AIR",
  buildPic           = "tc_cacodemon.jpg",
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
  maxVelocity        = 2.5,
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
      "custom:zapimpact",	  
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
      "monstergrowl",
    },
    select = {
      "monstergrowl",
    },
  },
 weapons = {
    [1]  = {
      badTargetCategory = "AIR LIGHTARMOR",
      def                = "CACOBALL",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CACOBALL = {
    accuracy           = 800,
    areaOfEffect       = 64,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 16,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 1,
    energypershot           = 0,
    explosionSpeed     = 65536,
    fireStarter        = 10,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    name               = "Cacoball",
    --noSelfDamage       = true,
    range              = 400,
    reloadtime         = 1.5,
    soundHit           = "mediumexplosion",
    soundStart         = "dragon",
    soundHitVolume     = 25,
    soundStartVolume   = 25,
    targetMoveError    = 0.1,
    tolerance          = 500,
    turret             = true,
    weaponVelocity     = 300,
--	General visuals ----------------------------------------
--    cegTag             = "DRAGONFLAME",
--    model              = "gunshot.s3o",
    explosionGenerator = "custom:HELLSTORMEXPLOSION",
	Size               = 10,
    rgbColor           = [[1 0.3 1]],
--	Weapon type specific visuals --------------------------- 
	AlphaDecay         = 0.95,
	NoGap			   = 0,
	Stages 			   = 8,
	SizeDecay          = 0.2,
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


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
