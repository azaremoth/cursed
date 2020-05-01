-- UNITDEF -- euf_autotower --
--------------------------------------------------------------------------------

local unitName = "euf_autotower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 240,
  buildCostMetal     = 240,
  buildPic           = "euf_autotower.png",
  buildTime          = 240,
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 5,
  buildingGroundDecalType = "euf_groundplate3.png",
  useBuildingGroundDecal = true, 
  canAttack          = true,
  canGuard           = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 50 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
  corpse             = "dead",
  customParams          = {
		factionname			= "imperials",
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
		helptext 			= "Defense Tower. Perfect against all sorts of light targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Light Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1500,
  maxSlope           = 25,
  maxVelocity        = 0,  
  maxWaterDepth      = 0,
  name               = "Autocannon tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_autotower.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  script			 = "euf_autotower.lua",  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "euf_autotower",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:MARINEGUNFLARE",
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
      "custom:MARINEGROUNDFLASH",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_baseattacked",
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
      "guntower_select",
    },
  },
  weapons = {
    [1]  = {
      name                  = "SARGELVL3CHAINGUN",
	  onlyTargetCategory 	= "LAND AIR",
	  badTargetCategory 	= "HEAVYARMOR",
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
    damage             = 2500,
    description        = "Wrecked Autocannon Tower",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "100",
    metal              = 120,
    object             = "euf_tower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
