-- UNITDEF -- EUF_START --
--------------------------------------------------------------------------------

local unitName = "bug_egg"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 100,
  buildCostMetal     = 100,
  buildDistance      = 0,
  builder            = false,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 2,
  buildingGroundDecalSizeY = 2,
  buildingGroundDecalType = "bug_decal.png",  
  buildPic           = "bug_egg.png",
  buildTime          = 100,
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
    helptext = "It is a space bug egg."	
  },  
  description        = "Space bug egg",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3000,
  maxSlope           = 25,
  maxWaterDepth      = 10,
  metalMake          = 0,
  metalStorage       = 0,
  name               = "Egg",
  nanoColor          = "0 0 0",
  objectName         = "bug_egg.s3o",
  radarDistance      = 0,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  resurrectSpeed     = 0,
  script             = "bug_egg.lua",  
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "neutral",
  sightDistance      = 512,
  smoothAnim         = false,
  unitname           = "bug_egg",
  yardMap            = "oooo",
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
