--------------------------------------------------------------------------------

local unitName = "tc_pitt"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 600,
  buildCostMetal     = 600,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_pitt.png",
  buildTime          = 600,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
--  corpse             = "dead",
  customParams       = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/tc_damnedportal_normal.png",
	normalmaps = "yes",	
    helptext 	= "Demons are summoned here."
  },
  description        = "Demons are summoned here",
  explodeAs          = "BIG_EXPLOSION_GREEN",
  energyMake         = 200,
  energyStorage      = 2000,	  
  firestandorders    = "1",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 4200,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  name               = "Demon's Portal",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_pitt.s3o",
  radarDistance      = 64,
  script			 = "tc_pitt.lua",
  selfDestructAs     = "BIG_EXPLOSION_GREEN",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_pitt",
  useBuildingGroundDecal = true,
  workerTime         = 30,
  yardMap            = "oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo",
  buildoptions = {
    "tc_lich_ai",
    "tc_bonebeast",	
    "tc_rictus",
    "tc_crawler",
    "tc_pestilence",
    "tc_mancubus",
	"tc_spiderdemon",
    "tc_belial",
	"bug_med_undead",	
	"bug_big_undead",	
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Big_Explosion_Green",
      "custom:Structurebuilding_Big",
      "custom:SPIKES_NECROMANCER",	  
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
      "",
    },
    select = {
      "building",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
