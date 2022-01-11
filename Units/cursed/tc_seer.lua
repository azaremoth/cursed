-- UNITDEF -- TC_SEER --
--------------------------------------------------------------------------------

local unitName = "tc_seer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0133,
  airHoverFactor     = 0.1,
  airStrafe          = true,
  armortype          = "FLYER",
  brakeRate          = 0.931,
  buildCostEnergy    = 125,
  buildCostMetal     = 125,
  buildPic           = "tc_seer.png",
  buildTime          = 125,
  canFly             = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED AIR",
  collide            = true,
  collisionSphereScale = 1.0,
  cruiseAlt          = 120,
  customParams          = {
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
	normalmaps 			= "yes",			
    helptext 	= "Mobile radar and detection device. It can see everything, even cloaked and borrowed units."
  },
  description        = "Radar and Detection",
  dontland           = "1",
  --  energyMake         = "-10",
  explodeAs          = "SMALL_EXPLOSION_GREEN",
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  hoverAttack        = true,
  iconType           = "triangle",
  idleAutoHeal       = 5,
  idleTime           = 400,
  mass               = 100,
  maxDamage          = 400, --was 250
  maxSlope           = 25,
  maxVelocity        = 0.2,
  name               = "Seer",
  nanoColor          = "0.6 1 0.15",
  objectName         = "tc_seer.s3o",
  radarDistance      = 2432, -- was 2048
  selfDestructAs     = "SMALL_EXPLOSION_GREEN",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 768,
  smoothAnim         = false,
  sonarRadius       = 2432,
  turnRate           = 300,
  unitname           = "tc_seer",
  upright            = true,
  useSmoothMesh      = "1",
  yardMap            = "oooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Small",
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
      "radar_select",
    },
    select = {
      "radar_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
