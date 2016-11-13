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
  iconType           = "triangle",
  armortype          = "FLYER",    
  side               = "cursed",  
  customParams          = {
	factionname		   = "cursed",
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
  cruiseAlt          = 180,
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
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",  
  explodeAs          = "SMALL_EXPLOSION_GREEN",
--
  sfxtypes = {
    explosiongenerators = {
      "custom:DefenderGunFlare",
      "custom:Structurebuilding_Small",
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
    accuracy           = 920,
    alphaDecay         = 0.5,
    areaOfEffect       = 55,
    gravityAffected          = true,
    cegTag             = "NULL",
	cylinderTargeting = 1,
      energypershot           = 0,	
    explosionGenerator = "custom:Black_explosion",
    interceptedByShieldType = 1,
    movingAccuracy     = 1620,
    name               = "Plasma Cannon",
    range              = 300,
    reloadtime         = 1.00,
    -- rendertype         = 4,
    rgbColor           = "0.8745 1 0.1568",
    separation         = 0.44,
    size               = 2,
    sizeDecay          = -0.55,
    soundHit           = "cannon_hit1",
    soundStart         = "heatray_fire",
    stages             = 5,
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 560,
    damage = {
      default            = 100,
      flyer              = 100*0.33,
      heavy              = (100*0.75),
      light              = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
