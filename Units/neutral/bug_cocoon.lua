-- UNITDEF -- EUF_START --
--------------------------------------------------------------------------------

local unitName = "bug_cocoon"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 300,
  buildCostMetal     = 300,
  buildDistance      = 0,
  builder            = false,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 4,
  buildingGroundDecalSizeY = 4,
  buildingGroundDecalType = "bug_decal.png",
  buildPic           = "bug_cocoon.png",
  buildTime          = 300,
  canAssist          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canPatrol          = false,
  canReclaim         = false,
  canRepair          = false,
  canstop            = false,
  cantBeTransported  = true,
  captureSpeed       = 0,
  category           = "LAND HEAVYARMOR",
  useFootPrintCollisionVolume = false,  
  customParams		 = {
	normaltex = "unittextures/normalmaps/bug_library_normal.png",
	normalmaps = "yes",		  
	factionname		   = "neutral",
    helptext = "It is a space bug cocoon."	
  },  
  description        = "Space bug cocoon",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 5000,
  maxSlope           = 25,
  maxWaterDepth      = 10,
  metalMake          = 0,
  metalStorage       = 0,
  name               = "Egg",
  nanoColor          = "0 0 0",
  objectName         = "bug_cocoon.s3o",
  radarDistance      = 0,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
  script             = "bug_cocoon.lua",  
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = false,
  unitname           = "bug_cocoon",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:SMOKE_EXPLOSION",
      "custom:BLOOD_EXPLOSION_GREEN",
      "custom:BURROWING_BIGGER",
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
