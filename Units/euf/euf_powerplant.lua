-- UNITDEF -- euf_powerplant --
--------------------------------------------------------------------------------

local unitName = "euf_powerplant"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildTime          = 1000,
  
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 14,
  buildingGroundDecalSizeY = 14,
  buildingGroundDecalType = "euf_groundplate4.png",
  buildPic           = "euf_powerplant.png",
  category           = "EUF LAND HEAVYARMOR",
--  collisionVolumeType 		= "Box",
--  collisionVolumeScales 	= "190 125 80",
--  collisionVolumeOffsets 	= "0 10 0",
  useFootPrintCollisionVolume = true,
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	normaltex 			= "unittextures/normalmaps/euf_powerplant_normal.png",
	normalmaps 			= "yes",		
    helptext = "This is the advanced energy supply."	
	},
  description        = "Creates energy",
  energyMake         = 150,
  energyStorage      = 0,
  explodeAs          = "BIG_EXPLOSION_BLUE_HURTS",
  footprintX         = 11,
  footprintZ         = 6,
  iconType           = "bigenergy",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 3000,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  name               = "Powerplant",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_powerplant.s3o",
  onoffable          = false,
  radarDistance      = 64,
  script			 = "euf_powerplant.cob",    
  selfDestructAs     = "MEDIUM_EXPLOSION_BLUE",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  TEDClass           = "ENERGY",
  unitname           = "euf_powerplant",
  useBuildingGroundDecal = true,
  yardMap            = "oooooo oooooo oooooo oooooo oooooo oooooo oooooo oooooo oooooo oooooo oooooo oooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Powerplant_Explosion",
      "custom:EUF_Structurebuilding_Big",
      "custom:MEDIUM_EXPLOSION_YELLOW",	  
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
      "powerplant_select",
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
    description        = "Wrecked Powerplant",
    footprintX         = 11,
    footprintZ         = 6,
    height             = "30",
    hitdensity         = "100",
    metal              = 1000,
    object             = "euf_powerplant_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 500,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
