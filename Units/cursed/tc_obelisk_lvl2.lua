-- UNITDEF -- TC_OBELISK_LVL2 --
--------------------------------------------------------------------------------

local unitName = "tc_obelisk_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildDistance      = 900,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",    
  buildPic           = "tc_obelisk_lvl2.png",
  buildTime          = 500,
  canAssist          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  corpse             = "dead",
  customParams          = {
	factionname	= "cursed",
	isimmobilebuilder = true,
	area_mex_def = "tc_metalextractor_lvl2",	
	noautorepair = true,
    normaltex = "unittextures/normalmaps/tc_obelisk_lvl2_normal.png",
	normalmaps = "yes",		
    helptext 	= "Obelisks are immobile base cunstruction units."
  },
  description        = "Advanced base construction",
  energyMake         = 10,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  metalMake          = 1.0,
  metalStorage       = 0,
  name               = "Obelisk",
  nanoColor          = "0.6 1 0.15",
  objectName         = "TC_Obelisk_lvl2.s3o",
  radarDistance      = 1024,
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 1024,
  smoothAnim         = false,
  unitname           = "tc_obelisk_lvl2",
  useBuildingGroundDecal = true, 

  -- remark: will be overwriten by unit_attriutes.lua based on factors multiplied with workertime  
  resurrectSpeed     = 0,
  captureSpeed       = 0,   
  repairSpeed        = 12,
  reclaimSpeed       = 24,
  workerTime         = 24,
  terraformSpeed     = 240,
 
  buildoptions = {
    "tc_obelisk_lvl2",
    "tc_obelisk",
    "tc_metalextractor_lvl2",
    "tc_soulcage",
    "tc_storage",	
    "tc_pyramid",
    "tc_damnedportal",
    "tc_darkassembler",
    "tc_defender",
    "tc_tower",
    "tc_hellfire",		
    "tc_seer",
    "tc_altar",
--    "tc_teeth",
	"tc_wall_lvl2",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:BUILDING_BASE_LVL2",
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
    metal              = 250,
    object             = "TC_Obelisk_lvl2_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 150,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
