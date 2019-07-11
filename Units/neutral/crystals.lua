--------------------------------------------------------------------------------

local unitName = "crystals"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildDistance      = 0,
  builder            = false,
  buildPic           = "crystals.png",
  buildTime          = 0,
  canAssist          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canPatrol          = false,
  canReclaim         = false,
  canRepair          = false,
  canstop            = false,
  cantBeTransported  = true, 
  capturable         = false,  
  captureSpeed       = 0,
  category           = "LAND HEAVYARMOR",
  customParams		 = {
		factionname		   = "neutral",
		helptext = "This is an ancient relict that will give you ineffable power. Stay close and defend it against you enemies."
  },  
  description        = "",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "bigsquare",
  idleAutoHeal       = 1,
  idleTime           = 0,
  levelGround        = false,
  maxDamage          = 100000,
  maxSlope           = 90,
  maxWaterDepth      = 256,
  metalMake          = 0,
  metalStorage       = 0,
  name               = "Crystal artefact",
  nanoColor          = "0 0 0",
  objectName         = "crystals.s3o",
  radarDistance      = 0,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
  script             = 'crystals.lua',  
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 1024,
  smoothAnim         = false,
  unitname           = "crystals",
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
