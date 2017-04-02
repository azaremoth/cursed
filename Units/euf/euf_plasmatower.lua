-- UNITDEF -- euf_plasmatower --
--------------------------------------------------------------------------------

local unitName = "euf_plasmatower"

--------------------------------------------------------------------------------

local unitDef = {
  armortype          = "HEAVY",
  buildCostEnergy    = 300,
  buildCostMetal     = 300,
  buildPic           = "euf_plasmatower.png",
  buildTime          = 300,
  
  buildingGroundDecalDecaySpeed = 0.0,
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 5,
  buildingGroundDecalType = "euf_plasmatower_aoplane.dds",
  useBuildingGroundDecal = true,  
  
  canAttack          = true,
  canGuard           = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "45 50 45",
  collisionVolumeOffsets 	= "0 0 0",
  -- collisionVolumeTest 		= 1,  
  corpse             = "dead",
  customParams          = {
	factionname	= "imperials",
	normaltex = "unittextures/normalmaps/euf_plasmatower_normal.png",
	normalmaps = "yes",	
    helptext 	= "Defense Tower. Perfect against all sorts of ground targets."
  },
  defaultmissiontype = "GUARD_NOMOVE",
  description        = "Light Defense Tower",
  --  energyMake         = "-5",
  explodeAs          = "MEDIUM_EXPLOSION_BLUE",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "rhombe",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 1700,
  maxSlope           = 25,
  maxVelocity        = 0,  
  maxWaterDepth      = 0,
  name               = "Plasma tower",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_plasmatower.s3o",
  selfDestructAs     = "MEDIUM_EXPLOSION_BLUE",
  script			 = "euf_plasmatower.lua",  
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 576,
  standingfireorder  = "2",
  TEDClass           = "FORT",
  unitname           = "euf_plasmatower",
  yardMap            = "ooooooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:PLasmaTowerGunFlare",
      "custom:Small_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Small",
      "custom:PLasmaTowerGunGroundflash",
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
      def                = "PLASMATOWERGUN",
      badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PLASMATOWERGUN = {
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 200,
    areaOfEffect       = 64,
    energypershot           = 5,	
    explosionGenerator = "custom:smallblueexp",
    cegTag             = "PLasmaTowerGunProjectileGroundflash",	
    interceptedByShieldType = 1,
    name               = "Plasma Cannon",
    range              = 550,
    reloadtime         = 0.66,
    -- rendertype         = 0,
    rgbColor           = "0.55 0.58 0.94",
    soundHit           = "mediumexplosion",
    soundStart         = "plasma",
    soundStartVolume   = 75,
 --   targetBorder       = 1,	
    texture1           = "blueflare",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 10.00,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "LaserCannon",
    weaponVelocity     = 900, 
    damage = {
      default            = 100,
      flyer              = 100*0.33,
      heavy              = 100,
      light              = 100,
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
    damage             = 2500,
    description        = "Wrecked Plasma Tower",
    footprintX         = 3,
    footprintZ         = 3,
    height             = "60",
    hitdensity         = "100",
    metal              = 175,
    object             = "euf_tower_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 68,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
