-- UNITDEF -- TC_SOULSTONE --
--------------------------------------------------------------------------------

local unitName = "tc_totem_red"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "tc_totem_red.jpg",
  buildTime          = 500,
  category           = "CURSED LAND HEAVYARMOR",
  customParams          = {	
	factionname		   = "cursed",
    helptext = "Enables the lich's frenzy aura."	
	},
  description        = "enables the frenzy aura",
  --  energyMake         = "-150",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "square",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 600,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Totem of Frenzy",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "tc_totem_red.s3o",
  onoffable          = false,
  radarDistance      = 64,
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "SPECIAL",
  unitname           = "tc_totem_red",
  yardMap            = "ooo ooo ooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Small",
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

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
