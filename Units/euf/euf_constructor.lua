-- UNITDEF -- euf_constructor --
--------------------------------------------------------------------------------

local unitName = "euf_constructor"

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
  canBeAssisted      = false,
  canGuard           = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canstop            = "1", 
  canAttack          = true,
  CantBeTransported  = false,
  --canHover           = true,
  canMove            = true,
  category           = "EUF LAND LIGHTARMOR",
  customParams       = {	
	noautorepair	 = true,
	canbetransported = "true",	
	factionname		 = "imperials",
    helptext = "This hovering robot can build basic structures. It has a weak stun-gun but can not shoot out of bunkers."	
	},
  defaultmissiontype = "Standby",
  description        = "basic builder",
  energyMake         = 5,
  energyStorage      = 0,
  explodeAs          = "NULL",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,  

  crushResistance    = 2000,
  mass               = 1100,
  
  maxDamage          = 800,
  maxSlope           = 14,
  maxVelocity        = 2,
  maxWaterDepth      = 255,
  metalMake          = 0.5,
  metalStorage       = 0,
  movementClass      = "TANKHOVER2x2",
  name               = "Builderoid",
  nanoColor          = "0.16 1 1",
  noChaseCategory    = "AIR",
  objectName         = "euf_constructor.s3o",
  reclaimSpeed       = 5,
  repairSpeed        = 6,
  resurrectSpeed     = 0,
  script             = "euf_constructor.cob",  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = true,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  terraformSpeed     = 1200,
  turnRate           = 1005,
  unitname           = "euf_constructor",
  upright            = true,
  workerTime         = 25,
  buildoptions = {
    "euf_metalextractor_lvl1",
    "euf_solar",
    "euf_storage",	
    "euf_radar_lvl1",
    "euf_barracks",	
    "euf_factory",
    "euf_airport",		
    "euf_church",		
    "euf_bunker",
    "euf_plasmatower",
    "euf_artytower",	
    "euf_aatower",
    "euf_wall",	
  },
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
