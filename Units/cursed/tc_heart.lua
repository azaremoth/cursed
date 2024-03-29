-- UNITDEF -- TC_HEART --
--------------------------------------------------------------------------------

local unitName = "tc_heart"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildDistance      = 150,
  buildingGroundDecalDecaySpeed = 0.005,
  buildingGroundDecalSizeX = 16,
  buildingGroundDecalSizeY = 16,
  buildingGroundDecalType = "tc_groundplate1.png",
  buildPic           = "tc_heart.png",
  buildTime          = 700,
  canAttack          = false,
  canBeAssisted      = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/tc_heart_normal.png",
	normalmaps = "yes",	
    helptext 	= "Heart of Darkness enables advanced units, like liches and advanced obelisks. You will have to morph necromancers to Liches to summon advanced demons."		
  },
  description        = "Enables advanced units and buildings.",
  explodeAs          = "BIG_EXPLOSION_GREEN_HD",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigsquare",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 4500,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  name               = "Heart of Darkness",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Heart.s3o",
  onoffable          = false,
  radarDistance      = 64,
  reclaimSpeed       = 200,
  selfDestructAs     = "BIG_EXPLOSION_GREEN_HD",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = false,
  terraformSpeed     = 1500,
  unitname           = "tc_heart",
  useBuildingGroundDecal = true,
  yardMap            = "oooooo oooooo oooooo oooooo oooooo oooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Big",
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
      "heartbeat",
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},	
    damage             = 8000,
    description        = "Dead Heart",
    footprintX         = 6,
    footprintZ         = 6,
    height             = "50",
    hitdensity         = "100",
    metal              = 375,
    object             = "tc_heart_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 375,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
