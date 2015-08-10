--------------------------------------------------------------------------------

local unitName = "bug_med"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 2.0,
  armortype          = "HEAVY",
  brakeRate          = 1.5,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildPic           = "bug_med.png",
  buildTime          = 400,
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
    canjump        = [[1]],
	canburrow      = "true",
	jumpclass = [[ghoul]],	
	factionname		   = "neutral",
    helptext = "It is a space bug."			
  },
  defaultmissiontype = "Standby",
  description        = "Melee Unit",
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 1000,
  maxSlope           = 14,
  maxVelocity        = 3.5,
  maxWaterDepth      = 15,
  mobilestandorders  = "1",
  movementClass      = "WALKER3X3",
  name               = "Xenosect",
  nanoColor          = "0.3 0.3 0.0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "bug_med.s3o",
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
  unitname           = "bug_med",
  upright            = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING",
      "custom:BLOOD_EXPLOSION_GREEN",
      "custom:BURROWING_BIGGER",
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
      "bug_med_growl",
    },
    select = {
      "bug_med_growl",
    },
  },
  weapons = {
    [1]  = {
      def                = "BUGMELEE",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory  = "HEAVYARMOR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BUGMELEE = {
      name                    = [[Bug Claws]],
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
      range                   = 64,
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
      default            = 130,
      flyer              = 130,
      heavy              = 130,
      light              = 130,
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
		resurrectintounit	= "bug_med",
		featuredecaytime	= "150"
	},  
    damage             = 500,
    mass               = 5000,
    description        = "Dead Xenosect",
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = "20",
    hitdensity         = "100",
    metal              = 200,
    object             = "bug_med_dead.s3o",
    reclaimable        = true,
	smoketime 		   = 0,	
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
