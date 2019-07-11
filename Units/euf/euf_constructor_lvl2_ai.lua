-- UNITDEF -- euf_constructor_lvl2 --
--------------------------------------------------------------------------------

local unitName = "euf_constructor_lvl2_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 550,
  buildCostMetal     = 550,
  buildDistance      = 300,
  builder            = true,
  buildPic           = "euf_constructor_lvl2.png",
  buildTime          = 550,
  canAssist          = true,
  canAttack          = true,
  canBeAssisted      = false,
  canCapture         = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canResurrect       = false,
  canstop            = true,
  cantBeTransported  = true, 
  capturable         = false, 
  captureSpeed       = 0,
  category           = "EUF LAND LIGHTARMOR",
  customParams       = {
  	noautorepair	 = true,
	area_mex_def = "euf_metalextractor_lvl2",
	factionname		 = "imperials",
	normaltex = "unittextures/normalmaps/euf_constructor_lvl2_normal.png",
	normalmaps = "yes",	
    helptext = "This robot can build advanced structures and has a stun-gun."	
	},
  defaultmissiontype = "Standby",
  description        = "advanced builder",
  energyMake         = 10,
  energyStorage      = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 5000,
  maxDamage          = 800,
  maxSlope           = 14,
  maxVelocity        = 1.8,
  maxWaterDepth      = 500,
  metalMake          = 1.0,
  metalStorage       = 0,
  movementClass      = "TANK2X2_AMP",
  name               = "Advanced Builderoid",
  nanoColor          = "0.16 1 1",
  noChaseCategory    = "AIR",
  objectName         = "euf_constructor_lvl2.s3o",
  radarDistance      = 768,
  script             = "euf_constructor_lvl2.cob",  
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = true,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "1",
  standingmoveorder  = "0",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 5,
  trackStretch           = 1,
  trackType              = [[StdTank]],
  trackWidth             = 30,  

  turnRate           = 500,
  unitname           = "euf_constructor_lvl2_ai",
  upright            = false,
  
  -- remark: will be overwriten by unit_attriutes.lua based on factors multiplied with workertime  
  resurrectSpeed     = 0,
  captureSpeed       = 0,   
  repairSpeed        = 12,
  reclaimSpeed       = 24,
  workerTime         = 24,
  terraformSpeed     = 240,
  
  buildoptions = {
    "euf_metalextractor_lvl2",
    "euf_powerplant",
    "euf_storage",		
    "euf_radar_lvl2",
    "euf_barracks_ai",	
    "euf_factory_ai",
    "euf_airport",
    "euf_techcenter",
	"euf_techcenter_shield",
	"euf_techcenter_nuke",	
    "euf_church_ai",
    "euf_sanctum",
	"euf_wall_lvl2",	
    "euf_bunker_ai",
    "euf_lasertower",	
    "euf_plasmatower",
    "euf_aatower",
    "euf_artytower",	
 },
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:SMALL_EXPLOSION_YELLOW",
      "custom:PLasmaTowerGunFlare",
      "custom:PLasmaTowerGunGroundflash",	  
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_emergency",
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
      "voices_yes",
    },
    select = {
      "voices_engrdy",
    },
  },
  weapons = {
    [1]  = {
      name               = "TAZER_HEAVY",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND AIR",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
