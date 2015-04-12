--------------------------------------------------------------------------------

local unitName = "burrowcrust"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  builder            = true,
--[[  buildingGroundDecalDecaySpeed = 9,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplatesm.png", ]]--
  buildPic           = "NULL.png",
  buildTime          = 3600,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = false,
  category           = "CANTATTACK",
  corpse             = "",
    customParams          = {	
		canburrow      = [[1]],
		factionname		   = "cursed",
	},
  damageModifier     = 0.001,
  description        = "",
  energyMake         = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 0,
  footprintZ         = 0,
  hideDamage         = true,
  iconType           = "",
  idleAutoHeal       = 50,
  idleTime           = 200,
  levelGround        = true,
  maxDamage          = 99999999,
  maxSlope           = 45,
  maxWaterDepth      = 0,
  metalMake          = 0,
  mobilestandorders  = "1",
  name               = "BurrowCrust",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_skeleton_burrowed.s3o",
  radarDistance      = 1,
  reclaimable        = false,
  
  script = 'empty.lua',
  
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 1,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  stealth		   = 1,
  TEDClass           = "PLANT",
  unitname           = "burrowcrust",
--  useBuildingGroundDecal = true,
  workerTime         = 1,
  yardMap            = "",
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
