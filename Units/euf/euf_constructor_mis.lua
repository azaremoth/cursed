-- UNITDEF -- euf_constructor --
--------------------------------------------------------------------------------

local unitName = "euf_constructor_mis"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 250,
  buildCostMetal     = 250,
  buildDistance      = 200,
  builder            = true,
  buildPic           = "euf_constructor.png",
  buildTime          = 250,
  canAssist          = true,
  canAttack          = true,
  canBeAssisted      = false,
  CantBeTransported  = false,
  canCapture         = false,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = true,
  canResurrect       = false,
  canstop            = true,
  cantBeTransported  = false,
  capturable         = false, 
  captureSpeed       = 0,
  category           = "EUF LAND LIGHTARMOR",
  customParams       = {
  	noautorepair	 = true,
	area_mex_def = "euf_metalextractor_lvl1",
	factionname		 = "imperials",
	normaltex = "unittextures/normalmaps/euf_constructor_normal.png",
	normalmaps = "yes",			
    helptext = "This hovering robot can build basic structures. It has a weak stun-gun but can not shoot out of bunkers."	
	},
  defaultmissiontype = "Standby",
  description        = "basic builder",
  energyMake         = 50,
  energyStorage      = 100,
  explodeAs          = "NULL",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 0.1,
  idleTime           = 100,
  crushResistance    = 2000,
  mass               = 1100,
  maxDamage          = 2500,
  maxSlope           = 14,
  maxVelocity        = 2.2,
  maxWaterDepth      = 255,
  metalMake          = 5,
  metalStorage       = 100,
  movementClass      = "SMALLHOVER2x2",
  name               = "Builderoid",
  nanoColor          = "0.16 1 1",
  noChaseCategory    = "AIR",
  objectName         = "euf_constructor.s3o",
  script             = "euf_constructor.cob",
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = true,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "1",
  standingmoveorder  = "0",
  turnRate           = 1005,
  unitname           = "euf_constructor_mis",
  upright            = true,
  
  -- remark: will be overwriten by unit_attriutes.lua based on factors multiplied with workertime
  resurrectSpeed     = 15,
  captureSpeed       = 0,
  repairSpeed        = 10,
  reclaimSpeed       = 15,
  workerTime         = 15,
  terraformSpeed     = 150,
  
  buildoptions = {  },
  sfxtypes = {
    explosiongenerators = {
      "custom:TINY_EXPLOSION_YELLOW",
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
      name                = "TAZER_LIGHT",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------