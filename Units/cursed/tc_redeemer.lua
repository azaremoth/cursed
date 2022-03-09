-- UNITDEF -- tc_redeemer --
--------------------------------------------------------------------------------

local unitName = "tc_redeemer"

--------------------------------------------------------------------------------

local unitDef = {
  name               = "Redeemer",
  category           = "CURSED AIR",
  buildPic           = "tc_redeemer.png",
  objectName         = "tc_redeemer.s3o",
  unitname           = "tc_redeemer",
  script 			 = "tc_redeemer.lua", 
  iconType           = "triangle",
  armortype          = "FLYER",    
  side               = "cursed",  
  customParams          = {
	factionname		   = "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
    helptext = "The redeemer gunship is perfect against any ground target. You should stay away from AA though."			
  },
  description        = "Good against ground targets",
-- Costs and HPs, Sight distance
  buildCostEnergy    = 250,
  buildCostMetal     = 250,
  buildTime          = 250,
  maxDamage          = 600, --was 500
  sightDistance      = 512,
--  Flyer/Movement specifics 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,  
  airStrafe          = true,
  upright            = true,
  dontland           = "1", 
  acceleration       = 0.02,
  airHoverFactor     = 0.1,
  brakeRate          = 0.931,
  cruiseAlt          = 80,
  maxVelocity        = 2.8,
  turnRate           = 500,
-- Collision
  collide            = true,
  collisionSphereScale = 1.0,
--
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
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
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",  
  explodeAs          = "SMALL_EXPLOSION_GREEN",
--
  sfxtypes = {
    explosiongenerators = {
      "custom:DefenderGunFlare",
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
      "flyers",
    },
    select = {
      "flyers",
    },
  },
 weapons = {
    [1]  = {
      badTargetCategory = "AIR LIGHTARMOR",
      def                = "REDEEMERGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  REDEEMERGUN = { 
    avoidFriendly      = true,
	collideFriendly    = true,  
    accuracy           = 128,
    areaOfEffect       = 64,
    beamtime           = 0.75,
    burnblow           = true,
    coreThickness      = 0.5,
    craterBoost        = 0,
    craterMult         = 0,
--    cylinderTargeting 	= 128,
	heightMod 			= 0.1,
    energypershot           = 0,
    explosionGenerator = "custom:AGARES_LASER",
    fireStarter        = 20,
--	hardStop 		   = false,
--	fallOffRate 	   = 0,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Hell Beam",
	noSelfDamage       = true,
    minIntensity	   = 1.0,
    range              = 330,
    reloadtime         = 1.00,
    -- rendertype         = 0,
	rgbColor           = {0.45, 1, 0.1},
	rgbColor2 		   = {1, 1, 1},
    soundHit           = "null",
    soundStart         = "small_laser_fire",
    soundTrigger       = true,
	sweepFire		   = true,		
    targetMoveError    = 0.25,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "null_texture",
    thickness          = 3,
    tolerance          = 2000,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 1500,
    damage = {
      default            = 100,
      flyer              = 100,
      heavy              = (100*0.75),
      light              = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
