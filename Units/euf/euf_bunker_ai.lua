-- UNITDEF -- EUF_BUNKER --
--------------------------------------------------------------------------------

local unitName = "euf_bunker_ai"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 600,
  buildCostMetal     = 600,
  buildTime          = 600,
  
  buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 9,
  buildingGroundDecalType = "euf_bunker_aoplane.png",
  useBuildingGroundDecal = true,
  
  buildPic           = "euf_bunker.png",    
  category           = "EUF LAND HEAVYARMOR",
    
  corpse             = "dead",
  customParams       = {	
	factionname		 = "imperials",
	normaltex = "unittextures/normalmaps/euf_bunker_normal.png",
	normalmaps = "yes",		
    helptext = "The bunker is a heavily fortified structure that can be used as a firebase for up to 4 soldiers."	
	},
  --  energyMake         = 0,
  energyStorage      = 0,	
  description        = "Firebase for soldiers",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = "bigrhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  
--  isfirePlatform     = true,
--  loadingradius		 = 150,
--  releaseHeld        = false,
--  transportCapacity  = 8,
--  transportMass      = 100000000,
--  transportSize      = 2,
--  transportunloadmethod = 0,
--  unloadSpread       = 0.5,
  script             = "euf_bunker_ai.lua",
  
  levelGround        = true,
  
  maxDamage          = 5000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Imperial Bunker",
  nanoColor          = "0 0 0",
  objectName         = "euf_bunker.s3o",
  radarDistance      = 0,
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  unitname           = "euf_bunker_ai",
  yardMap            = "oooooo oooooo oooooo oooooo oooooo oooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Medium",
      "custom:MARINEGUNFLARE",
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
      "building",
    },
  },
  weapons = {
	[1]  = {
      def                = "BUNKER_GUN",
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",	  
    },
  },
}



--------------------------------------------------------------------------------

local weaponDefs = {
  BUNKER_GUN = {
    avoidFriendly      = false,
	collideFriendly    = false,
    accuracy           = 50,
    areaOfEffect       = 5,
    coreThickness      = 0.5,
	cylinderTargeting = 128,		
    duration           = 0.03,
      energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
    interceptedByShieldType = 2,
    name               = "Defender Gun",
    range              = 500,
    reloadtime         = .3,
    renderType         = 0,
    rgbColor           = "1.0 1.0 0.66",
    soundHit           = "defender_hit",
    soundStart         = "battlegun",
    soundStartVolume   = 15,
    soundTrigger       = true,
    texture1           = "yellowgunshot",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 0.75,
    tolerance          = 3000,
    turret             = true,
    weaponType         = "LaserCannon",
    weaponVelocity     = 2000,
    damage = {
      default            = 50,
      flyer              = 50,
      heavy              = (50*0.75),
      light              = 50,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},  		
    damage             = 8000,
    description        = "Wrecked Bunker",
    footprintX         = 6,
    footprintZ         = 6,
    height             = "30",
    hitdensity         = "100",
    metal              = 400,
    object             = "euf_bunker_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 500,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
