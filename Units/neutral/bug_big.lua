--------------------------------------------------------------------------------

local unitName = "bug_big"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 800,
  buildCostMetal     = 800,
  buildPic           = "bug_big.png",
  buildTime          = 800,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	normaltex = "unittextures/normalmaps/bug_library_normal.png",
	normalmaps = "yes",		  
	canburrow      = "true",
	factionname		   = "neutral",
    helptext = "It is a huge space bug. Be careful."			
  },
  defaultmissiontype = "Standby",
  description        = "Robust Melee Unit",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 3200,
  maxSlope           = 14,
  maxVelocity        = 3.0,
  maxWaterDepth      = 25,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Xenosect Goliath",
  nanoColor          = "0.33 0.33 0.0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "bug_big.s3o",
  radarDistance      = 0,
  repairable         = false,  
  script             = 'bug_big.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = true,
  fireState = "2",
  moveState = "2",
  turnRate           = 2500,
  unitname           = "bug_big",
  upright            = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:BLOOD_EXPLOSION_BIG_GREEN",
      "custom:BURROWING_BIGGEST",
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "",
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
      "bug_big_growl",
    },
    select = {
      "bug_big_growl",
    },
  },
  weapons = {
    [1]  = {
      def                = "BIGBUGMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory  = "HEAVYARMOR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BIGBUGMELEE = {
      name                    = [[Big Bug Claws]],
      areaOfEffect            = 16,
      beamTime                = 0.13,
      beamWeapon              = true,
      canattackground         = true,
      collideFriendly    	  = false,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,
	  cylinderTargeting       = 1,		  
      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 90,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      lodDistance             = 10000,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 128,
      reloadtime              = 1.5,
      renderType              = 0,
      rgbColor                = [[0 0 0]],
      targetborder            = 1,
      targetMoveError         = 0.2,
      thickness               = 0,
      tolerance               = 10000,
      turret                  = true,
      waterweapon             = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 2000, 
    damage = {
      default            = 250,
      flyer              = 250,
      heavy              = 250,
      light              = 250,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------


local featureDefs = {
  dead = {	
	resurrectable	   = 1,  
    blocking           = true,
	customParams          = {
		resurrectintounit	= "bug_big",
		featuredecaytime	= "180"
	},  
    damage             = 2000,
    mass               = 5000,
    description        = "Dead Xenosect",
    energy             = 0,
    footprintX         = 4,
    footprintZ         = 4,
    height             = "20",
    hitdensity         = "100",
    metal              = 400,
    object             = "bug_big_dead.s3o",
    reclaimable        = false,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
