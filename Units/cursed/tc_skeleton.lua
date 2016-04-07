-- UNITDEF -- TC_SKELETON --
--------------------------------------------------------------------------------

local unitName = "tc_skeleton"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.5,
  armortype          = "LIGHT",
  brakeRate          = 1.5,
  buildCostEnergy    = 120,
  buildCostMetal     = 120,
  buildPic           = "tc_Skeleton.jpg",
  buildTime          = 120,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  corpse             = "dead",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "30 33 30",
  collisionVolumeType 		= "CylY",
--  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname		   = "cursed",
	isinfantry = "true",
	canbetransported = "true",
	isbones = "true",	
	canburrow      = "true",	
    helptext = "Skeletons are effective and fast melee units."			
  },
  defaultmissiontype = "Standby",
  description        = "Fast Melee Unit",
  --  energyMake         = "-0.5",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 650,
  maxSlope           = 14,
  maxVelocity        = 3.2,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Skeleton",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "TC_Skeleton.s3o",
  radarDistance      = 0,
  repairable         = false,     
  script             = 'tc_skeleton.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  unitname           = "tc_skeleton",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:Greycloud",
      "custom:BURROWING",
      "custom:SPARKLES",	  	  
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "skeleton3",
    arrived = {
      "skeleton2",
    },
    cant = {
      "skeleton3",
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
      "skeleton2",
    },
    select = {
      "skeleton1",
    },
  },
  weapons = {
    [1]  = {
      def                = "SKELMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory  = "AIR HEAVYARMOR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SKELMELEE = {
      name                    = [[Melee]],
      areaOfEffect            = 16,
      range                   = 64,
      reloadtime              = 1.6, 
	  ----------------------------------------------
	  avoidFeature			= false,
	  avoidFriendly      	= false,	  
      canattackground       = true,
      collideFriendly    	= false,
	  ----------------------------------------------
      craterBoost             = 0,
      craterMult              = 0,
	  cylinderTargeting       = 1,		  
      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 90,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      minIntensity            = 1,
      noSelfDamage            = true,
      renderType              = 0,
      rgbColor                = [[0 0 0]],
      targetborder            = 1,
      targetMoveError         = 0.0,
      tolerance               = 10000,
      turret                  = true,
      waterweapon             = true,
      weaponType              = [[Melee]],
      weaponVelocity          = 10000, 
	  ----------------------------------------------
    damage = {
      default            = 140,
      flyer              = 140,
      heavy              = (140*0.75),
      light              = 140,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 1,
    blocking           = false,
	customParams          = {
		resurrectintounit	= "tc_skeleton",
		featuredecaytime	= "60"
	},  
    damage             = 300,
    mass               = 1100,	
    description        = "Skeleton",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "5",
    hitdensity         = "100",
    metal              = 0,
    object             = "tc_skeleton_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
