--------------------------------------------------------------------------------

local unitName = "grounddecal"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "NULL.png",
  buildTime          = 0,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = false,
  capturable         = false,   
  category           = "CANTATTACK",
  corpse             = "",
    customParams          = {	
				factionname		   = "cursed",
	},
  damageModifier     = 0.001,
  description        = "Hidden Grounddecal",
  energyMake         = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  hideDamage         = true,
  iconType           = "neverseeme",
  idleAutoHeal       = 50,
  idleTime           = 200,
  levelGround        = true,
  maxDamage          = 99999999,
  maxSlope           = 45,
  maxWaterDepth      = 0,
  metalMake          = 0,
  mobilestandorders  = "1",
  name               = "Grounddecal",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "empty.s3o",
  radarDistance      = 1,
  reclaimable        = false,
  
  script = 'empty.lua',
  
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  stealth		   = 1,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  unitname           = "grounddecal",
  useBuildingGroundDecal = true,
  yardMap            = "c",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Big",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
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
      "",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
