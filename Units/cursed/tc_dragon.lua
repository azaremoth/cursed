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
  buildPic           = "tc_dragon.png",
  buildTime          = 3500,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
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
  script             = 'tc_dragon.lua',  
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
      "custom:Structurebuilding_Small",
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
	  name					= [[Dragon Fire Breath]],
	  areaOfEffect			= 128,
	  avoidFeature			= false,	  
	  avoidFriendly      	= true,
	  burst					= 9,
	  burstRate				= 0.05,
	  cegTag				= [[DRAGONFLAMETRAIL]],
	  CollideFriendly		= true, 
    cylinderTargeting = 128,
	heightMod 			= 0.1,		  
	  edgeEffectiveness		= 0.5,
	  energypershot         = 0,	  
	  explosionGenerator	= [[custom:DRAGONFLAMEEXPLOSION]],
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
	  soundStart			= "dragon",
	  soundHit           = "null",	  
	  soundTrigger			= false,
	  sprayAngle			= 1300,
	  tolerance				= 200,
	  turret				= 1,
	  weaponTimer			= 2,
	  weaponVelocity		= 240,
	  weaponType         = "Cannon",	

	customParams            = {
				flamethrower = "1",
    },	
	  
    damage = {
      default            = 60, -- 80
      flyer              = 60,
      heavy              = 60,
      light              = (60*2),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
