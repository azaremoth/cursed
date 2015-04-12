-- UNITDEF -- TC_DRAGON --
--------------------------------------------------------------------------------

local unitName = "tc_dragonqueen"

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
  cruiseAlt          = 250,
    customParams          = {	
	factionname	= "cursed", 
	isbones = "true",
    helptext 	= "The Queen has come to get your soul!"	
  },
  description        = "Oblivion awaits",
  dontland           = "1",
  --  energyMake         = "0",
  explodeAs          = "NULL",
  floater            = false,
  footprintX         = 6,
  footprintZ         = 6,
  hoverAttack        = true,
  iconType           = "bigskull",
  idleAutoHeal       = 5,
  idleTime           = 300,  
  mass               = 30000,
  maxDamage          = 30000,
  maxSlope           = 25,
  maxVelocity        = 3,
  maxWaterDepth      = 0,
  metalMake          = 10,
  name               = "Bone Dragon Queen",
  nanoColor          = "0 0 0",
  noChaseCategory    = "AIR",
  objectName         = "tc_dragonqueen.s3o",
  onoffable          = false,
  radarDistance      = 1024,
  repairable         = false,     
  script             = 'tc_dragon.cob',  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 1024,
  sonarDistance      = 1500,
  turnRate           = 250,
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
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FIREBALL = {
    accuracy           = 800,
    areaOfEffect       = 300,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    cegTag             = "DRAGONFLAME",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 10,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 1,
    energypershot      = 0,
    explosionGenerator = "custom:DRAGONFLAMEEXPLOSION",
    explosionSpeed     = 65536,
    fireStarter        = 10,
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    name               = "Hellfire",
    --noSelfDamage       = true,
    pitchtolerance     = "500",
    range              = 400,
    reloadtime         = 2,
    soundHit           = "mediumexplosion",
    soundStart         = "dragon",
    soundHitVolume     = 25,
    soundStartVolume   = 25,
    stages             = 0,	
    targetMoveError    = 0.1,
      selfprop                = true,	
      tracks                  = true,
      turnRate                = 55000,	
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 500,
    damage = {
      default            = 800,
      flyer              = 800,
      heavy              = 800,
      light              = 800,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
