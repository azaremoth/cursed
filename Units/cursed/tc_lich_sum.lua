-- UNITDEF -- TC_lich_SUM --
--------------------------------------------------------------------------------

local unitName = "tc_lich_sum"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "LIGHT",
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  builder            = true,
  buildPic           = "tc_lich.png",
  buildTime          = 500,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "20 50 20",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {
	factionname		   = "cursed",
	isinfantry = "true",
	isbones = "true",	
    helptext = "Liches can summon demons and stun enemies. When a Totem of Frenzy was build liches have the aura of frenzy (making friendly units shoot faster but more inaccurate. When the Lich is in summon stance it acts like a factory."				
  },
  description        = "Advanced summoner",
  energyMake         = 2,  
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = false,
  maxDamage          = 800,
  maxSlope           = 30,
  maxWaterDepth      = 35,
  mobilestandorders  = "1",
  name               = "lich",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_lich.s3o",
  radarDistance      = 768,
  repairable         = false,     
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_lich_sum",
  workerTime         = 20,
  yardMap            = "cc cc",
  buildoptions = {
	"tc_cacodemon",    
	"tc_rictus",
    "tc_crawler",
    "tc_pestilence",
    "tc_mancubus",
	"tc_spiderdemon",	
    "tc_belial",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Small",
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:PENTAGRAM",
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
      "lich",
    },
    select = {
      "lich",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
