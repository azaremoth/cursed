-- UNITDEF -- TC_NECROMANCER_SUM --
--------------------------------------------------------------------------------

local unitName = "tc_necromancer_sum"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "LIGHT",
  buildCostEnergy    = 100,
  buildCostMetal     = 100,
  builder            = true,
  buildPic           = "tc_necromancer.jpg",
  buildTime          = 100,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname		   = "cursed",
	isinfantry = "true",
    helptext = "Necromancers can summon skeletons and resurrect corpses. When the necromancer is in summon stance he acts like a factory."
  },
  description        = "Summoner",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = false,
  maxDamage          = 400,
  maxSlope           = 30,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  name               = "Necromancer",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_necromancer_sum.s3o",
  radarDistance      = 768,
  repairable         = false,     
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  TEDClass           = "PLANT",
  unitname           = "tc_necromancer_sum",
  workerTime         = 12,
  yardMap            = "cc cc",
  buildoptions = {
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
