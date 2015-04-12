--------------------------------------------------------------------------------

local unitName = "tc_wall_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 30,
  buildCostMetal     = 30,
  buildPic           = "tc_wall_lvl2.jpg",
  buildTime          = 30,
  category           = "CURSED LAND HEAVYARMOR",
  
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "80 70 10",
  collisionVolumeOffsets 	= "0 0 5",
  -- collisionVolumeTest 		= 1,  
  
    customParams          = {	factionname		   = "cursed",  },
  description        = "Defensive Wall",
  footprintX         = 5,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  isFeature          = true,
  levelGround        = false,
  maxDamage          = 6000,
  maxSlope           = 15,
  maxWaterDepth      = 35,
  name               = "Monoliths",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "tc_wall_lvl2_1.s3o",
  radarDistance      = 16,
  script             = "tc_wall_lvl2.lua",    
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "tc_wall_lvl2",
  yardMap            = "fffff",
  explodeAs          = "NULL",
  selfDestructAs     = "NULL",  
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Medium",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
