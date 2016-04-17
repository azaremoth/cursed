-- UNITDEF -- TC_HEART --
--------------------------------------------------------------------------------

local unitName = "tc_heart_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildDistance      = 75,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 16,
  buildingGroundDecalSizeY = 16,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_cursedcore.jpg",
  buildTime          = 700,
--  canAssist          = true,
  canAttack          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
--  canReclaim         = true,
--  canRepair          = false,
  canstop            = true,
  captureSpeed       = 0,
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname	= "cursed",  
    helptext 	= "Provides energy and metal income and a base shield."		
  },
  description        = "Provides bonuses",
  energyStorage      = 2000,
  energyMake         = 400,
  explodeAs          = "BIG_EXPLOSION_GREEN_HD",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 8000,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalmake          = 5,
  metalStorage       = 2000,
  name               = "Cursed Core",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_cursedcore.s3o",
  onoffable          = false,
  radarDistance      = 64,
  reclaimSpeed       = 200,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
  script             = 'tc_cursedcore.lua',  
  selfDestructAs     = "BIG_EXPLOSION_GREEN_HD",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  terraformSpeed     = 1500,
  unitname           = "tc_heart_ai",
  useBuildingGroundDecal = true,
  workerTime         = 15,
--  yardMap            = "ooooooooooooooooooooooooooooooooooooooo",
  buildoptions = {  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Medium_Explosion_Green",
	  "custom:CURSEDSHIELDBEAM_FX",	  
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "bell",
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
      "",
    },
    select = {
      "heartbeat",
    },
  },
  weapons = {
    [1]  = {
      def = "CursedShield",
    },
  },
}
--------------------------------------------------------------------------------

local weaponDefs = {
     CursedShield = {
      name                    = "CursedShield",
      craterMult              = 0,
      impulseFactor           = 0,
      shieldAlpha             = 0.2,
      shieldBadColor          = "1 0.0 0.0",
      shieldForce             = 4,
	  shieldGoodColor         = "0.5 1.0 0.15",
      shieldInterceptType     = 1,
      shieldMaxSpeed          = 400,
      shieldPower             = 4000,
      shieldPowerRegen        = 100,
      shieldPowerRegenEnergy  = 100,
      shieldRadius            = 650,
      shieldRepulser          = false,
      smartShield             = true,
      texture1                = "wake",
      visibleShield           = true,
      visibleShieldRepulse    = true,
      weaponType              = "Shield",
    	damage = {
      default            = 10,
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},  	
    damage             = 8000,
    description        = "Dead Heart",
    footprintX         = 6,
    footprintZ         = 6,
    height             = "50",
    hitdensity         = "100",
    metal              = 500,
    object             = "tc_heart_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 500,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
