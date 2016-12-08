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
  buildPic           = "tc_dragon.png",
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
	  name					= [[Queenfire]],
	  areaOfEffect			= 128,
	  avoidFeature			= false,	  
	  avoidFriendly      	= true,
	  burst					= 9,
	  burstRate				= 0.05,
	  cegTag				= [[BIGDRAGONFLAMETRAIL]],
	  CollideFriendly		= true,   
	  edgeEffectiveness		= 0.5,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:BIGDRAGONFLAMEEXPLOSION]],
	  explosionSpeed		= 5,
	  fireStarter			= 100,
	  groundBounce			= false,
	  impulseFactor			= 1e-06,
	  -- lineofsight			= 1,
      noSelfDamage            = true,	  
	  range					= 400,
	  reloadTime			= 2.5,
	  -- rendertype			= 1,
	  size					= 0.01,
	  soundStart			= [[dragon]],
	  soundTrigger			= false,
	  sprayAngle			= 1300,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 240,
	  weaponType         = "Cannon",
    damage = {
      default            = 300,
      flyer              = 300,
      heavy              = 300,
      light              = 300,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
