-- UNITDEF -- TC_NECROMANCER --
--------------------------------------------------------------------------------

local unitName = "tc_necromancer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.15,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  brakeRate          = 0.3,
  buildCostEnergy    = 100,
  buildCostMetal     = 100,
  buildDistance      = 100,
  builder            = true,
  buildPic           = "tc_necromancer.png",
  buildTime          = 100,
  canAssist          = true,
  canAttack          = false,
  canBeAssisted      = false,
  canCapture         = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canResurrect       = true,
  canstop            = "1",
  captureSpeed       = 0,
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
	noautorepair = "true",
	isinfantry = "true",
	canbetransported = "true",
	factionname		   = "cursed",
    helptext = "Necromancers can summon skeletons and resurrect corpses. When the necromancer is in summon stance he acts like a factory."
  },
  defaultmissiontype = "Standby",
  description        = "Summoner",
  energyMake         = 1,
  energyStorage      = 0,
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 600,
  maxSlope           = 20,
  maxVelocity        = 2.0,
  maxWaterDepth      = 500,
  metalMake          = 0.25,
  metalStorage       = 0,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Necromancer",
  nanoColor          = "0.6 1 0.15",
  objectName         = "TC_Necromancer.s3o",
  radarDistance      = 768,
  reclaimSpeed       = 5,
  repairSpeed        = 5,
  repairable         = false,     
  resurrectSpeed     = 12,
  script             = 'tc_necromancer.lua',  
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "2",
  standingmoveorder  = "0",
  terraformSpeed     = 1200,
  turnRate           = 1044,
  
  unitname           = "tc_necromancer",
  upright            = true,
  workerTime         = 12,
  buildoptions = {
    "tc_obelisk",
    "tc_metalextractor_lvl1",	
    "tc_ghoul",
    "tc_mage",
    "tc_gunner",
    "tc_bonebeast",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:BUILDING_NECROMANCER",
      "custom:PENTAGRAM",
      "custom:SPIKES_NECROMANCER",
      "custom:REDGREENBLOOD_EXPLOSION",	  
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
      "necro_move",
    },
    select = {
      "necro_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
