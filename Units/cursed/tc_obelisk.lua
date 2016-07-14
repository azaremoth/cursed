-- UNITDEF -- TC_OBELISK --
--------------------------------------------------------------------------------

local unitName = "tc_obelisk"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 200,
  buildCostMetal     = 200,
  buildDistance      = 700,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",  
  buildPic           = "tc_obelisk_lvl1.png",
  buildTime          = 200,
  canAssist          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canstop            = "1",
  captureSpeed       = 0,
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	growingcreep = true,
	noautorepair = true,
    helptext 	= "Obelisks are immobile base cunstruction units."
  },
  description        = "Base Construction",
  energyMake         = 5,
  energyStorage      = 20,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 500,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  metalMake          = 0.5,
  metalStorage       = 20,
  name               = "Obelisk",
  nanoColor          = "0.6 1 0.15",
  objectName         = "TC_Obelisk.s3o",
  radarDistance      = 1024,
  reclaimSpeed       = 10,
  repairSpeed        = 4,
  resurrectSpeed     = 0,
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 1024,
  smoothAnim         = false,
  terraformSpeed     = 1500,
  unitname           = "tc_obelisk",
  useBuildingGroundDecal = true,  
  workerTime         = 15,
  buildoptions = {
    "tc_obelisk",
    "tc_metalextractor_lvl1",
    "tc_soulstone",
    "tc_storage",
    "tc_pyramid",
    "tc_darkassembler",
    "tc_defender",
    "tc_hellfire",	
    "tc_seer",
    "tc_heart",
    "tc_teeth",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:BUILDING_BASE",
      "custom:Structurebuilding_Small",
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
      "building",
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
    damage             = 2000,
    description        = "Wrecked Obelisk",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "30",
    hitdensity         = "100",
    metal              = 100,
    object             = "tc_obelisk_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 50,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
