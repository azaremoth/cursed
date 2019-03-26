-- UNITDEF -- EUF_START --
--------------------------------------------------------------------------------

local unitName = "euf_start"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildDistance      = 0,
  builder            = false,
  buildPic           = "euf_start.png",
  buildTime          = 500,
  canAssist          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canPatrol          = false,
  canReclaim         = false,
  canRepair          = false,
  canstop            = false,
  captureSpeed       = 0,
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  customParams		 = {
		factionname		   	= "imperials",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",				
		helptext 			= "Some containers are left here."
  },  
  description        = "",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3000,
  maxSlope           = 25,
  maxWaterDepth      = 10,
  metalMake          = 0,
  metalStorage       = 0,
  name               = "Containers",
  nanoColor          = "0 0 0",
  objectName         = "euf_start.s3o",
  radarDistance      = 0,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
  script             = "euf_start.lua",  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 1024,
  smoothAnim         = false,
  unitname           = "euf_start",
  yardMap            = "oooo oooo oooo oooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:SMALL_EXPLOSION_YELLOW",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_baseattacked",
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
      "guntower_select",
    },
  },
}
--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
