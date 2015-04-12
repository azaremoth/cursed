-- UNITDEF -- TC_HEART --
--------------------------------------------------------------------------------

local unitName = "tc_heart_ai"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildDistance      = 75,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 16,
  buildingGroundDecalSizeY = 16,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_heart.jpg",
  buildTime          = 0,
  canAssist          = true,
  canAttack          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canReclaim         = true,
  canRepair          = false,
  canstop            = true,
  captureSpeed       = 0,
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {	
	factionname	= "cursed",  
    helptext 	= "The cursed heart stores metal and energy, builds totems and enables advanced units, like liches and advanced obelisks."		
  },
  description        = "Enables advanced units and more",
  energyStorage      = 2000,
  energyMake         = 400,
  explodeAs          = "BIG_EXPLOSION_GREEN_HD",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigspuare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 8000,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalmake          = 2,
  metalStorage       = 2000,
  name               = "Heart of Darkness",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Heart.s3o",
  onoffable          = false,
  radarDistance      = 64,
  reclaimSpeed       = 200,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
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
  buildoptions = {
    "tc_totem_black",
    "tc_totem_red",
    "tc_totem_purple",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Big",
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
}


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
