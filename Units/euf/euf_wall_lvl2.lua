--------------------------------------------------------------------------------

local unitName = "euf_wall_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 30,
  buildCostMetal     = 30,
  buildPic           = "euf_wall_lvl2.png",
  buildTime          = 30,
  category           = "EUF LAND HEAVYARMOR",
  cantBeTransported  = true, 
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "80 70 10",
  collisionVolumeOffsets 	= "0 0 5",
  -- collisionVolumeTest 		= 1,  
  customParams          = {	factionname		   = "imperials",  },
  description        = "Heavy wall",
  footprintX         = 5,
  footprintZ         = 1,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = false,
  maxDamage          = 6000,
  maxSlope           = 15,
  maxWaterDepth      = 35,
  name               = "Defensive wall",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_wall_lvl2.s3o",
  radarDistance      = 16,
  script             = "euf_wall_lvl2.lua",    
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 16,
  smoothAnim         = false,
  TEDClass           = "FORT",
  unitname           = "euf_wall_lvl2",
  yardMap            = "fffff",
  explodeAs          = "SMOKE_EXPLOSION",
  selfDestructAs     = "SMOKE_EXPLOSION",
  sfxtypes = {
    explosiongenerators = {
      "custom:EUF_Structurebuilding_Small",
    },
  },
}

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
