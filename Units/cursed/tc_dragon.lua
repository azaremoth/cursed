-- UNITDEF -- TC_DRAGON --
--------------------------------------------------------------------------------

local unitName = "tc_dragon"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0133,
  activateWhenBuilt  = true,
  airHoverFactor     = 0,
  airStrafe          = false,
  armortype          = "FLYER",
  brakeRate          = 0.931,
  buildCostEnergy    = 3500,
  buildCostMetal     = 3500,
  buildPic           = "TC_dragon.jpg",
  buildTime          = 3500,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED AIR",
  cruiseAlt          = 150,
    customParams          = {	
	factionname	= "cursed", 
	isbones = "true",
    helptext 	= "The bone dragon is the strongest flying cursed unit and very usefull against ground targets."	
  },
  description        = "Oblivion awaits",
  dontland           = "1",
  --  energyMake         = "-66",
  explodeAs          = "NULL",
  floater            = false,
  footprintX         = 4,
  footprintZ         = 4,
  hoverAttack        = true,
  iconType           = "skull",
  idleAutoHeal       = 5,
  idleTime           = 300,   
  mass               = 30000,
  maxDamage          = 7800, --was 6500
  maxSlope           = 25,
  maxVelocity        = 3,
  maxWaterDepth      = 0,
  metalMake          = 10,
  name               = "Bone Dragon",
  nanoColor          = "0 0 0",
  noChaseCategory    = "AIR",
  objectName         = "tc_dragon.s3o",
  onoffable          = false,
  radarDistance      = 1024,
  repairable         = false,     
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 1024,
  sonarDistance      = 1500,
  turnRate           = 212,
  unitname           = "tc_dragon",
  useSmoothMesh      = "1",
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONDRAGON",
      "custom:SUMMONDRAGON2",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "bell",
    arrived = {
      "skeleton1",
    },
    cant = {
      "skeleton2",
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
      "dragoncall",
    },
    select = {
      "dragoncall",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "FIREBALL",
      mainDir            = "0 0 1",
      maxAngleDif        = 220,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FIREBALL = {
    accuracy           = 800,
    areaOfEffect       = 200,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    cegTag             = "DRAGONFLAME",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 16,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 1,
      energypershot           = 0,
    explosionGenerator = "custom:DRAGONFLAMEEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 10,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    name               = "Hellfire",
    --noSelfDamage       = true,
    range              = 400,
    reloadtime         = 3,
    soundHit           = "mediumexplosion",
    soundStart         = "dragon",
    soundHitVolume     = 25,
    soundStartVolume   = 25,
    stages             = 0,	
    targetMoveError    = 0.1,
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 250,
    damage = {
      default            = 750,
      flyer              = 750,
      heavy              = 750,
      light              = (750*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
