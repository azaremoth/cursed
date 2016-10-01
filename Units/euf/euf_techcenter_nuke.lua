-- UNITDEF -- euf_techcenter --
--------------------------------------------------------------------------------

local unitName = "euf_techcenter_nuke"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 700,
  buildCostMetal     = 700,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 9,
  buildingGroundDecalType = "euf_groundplate.png",  
  buildTime          = 700,
  buildPic           = "euf_techcenter.png",  
  category           = "EUF LAND HEAVYARMOR",
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {
	factionname		   = "imperials",
	ProvideTech         = "Advanced Technology",
	normaltex = "unittextures/normalmaps/euf_techcenter_normal.png",
	normalmaps = "yes",				
    helptext = "Enables diggers, walkers and MLRS. Was upgraded with a nuke launcher."
  },
  description        = "Enables advanced Technology for diggers, walkers and MLRS",
  --  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 5000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  name               = "Technology Center",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_techcenter.s3o",
  onoffable          = false,
  radarDistance      = 1500,
  script             = "euf_techcenter_nuke.lua",  
  selfDestructAs     = "BIG_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_techcenter",
  useBuildingGroundDecal = true,  
  yardMap            = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
  sfxtypes = {
  explosiongenerators = {
      "custom:Big_Explosion_YELLOW",
      "custom:EUF_Structurebuilding_Medium",
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
      "solar_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",
      def                = "EUF_NUKE",
      mainDir            = "0 0 1",
      maxAngleDif        = 360,
      onlyTargetCategory = "LAND",
    },
  },	
}
--------------------------------------------------------------------------------

local weaponDefs = {
  EUF_NUKE = {
      name                    = [[Strategic Nuclear Missile]],
      areaOfEffect            = 1500,
      cegTag                  = [[NUCKLEARMINI]],
      collideFriendly         = false,
      collideFeature          = false,
      commandfire             = true,
      craterBoost             = 6,
      craterMult              = 6,
	  customParams        	  = {
		light_color = [[2.92 2.64 1.76]],
		light_radius = 3000,
	  },
      edgeEffectiveness       = 0.3,
      explosionGenerator      = [[custom:LONDON]],
      fireStarter             = 0,
      flightTime              = 180,
      impulseBoost            = 0.5,
      impulseFactor           = 0.2,
      interceptedByShieldType = 65,
      model                   = [[nuke.s3o]],
      noSelfDamage            = false,
      range                   = 72000,
      reloadtime              = 5,
      smokeTrail              = false,
      soundHit                = [[explosion\ex_ultra8]],
      startVelocity           = 100,
      stockpile               = true,
      stockpileTime           = 10^4,
      targetable              = 1,
      texture1                = [[null]], --flare
      tolerance               = 4000,
      weaponAcceleration      = 100,
      weaponTimer             = 10,
      weaponType              = [[StarburstLauncher]],
      weaponVelocity          = 800,
------------------------------------------------------------
		damage = {
		  default            = 3000,
		  flyer              = 3000,
		  heavy              = 3000,
		  light              = 3000,
		},
	},
 }
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {	
	resurrectable	   = 0,  
    blocking           = true,
	customParams          = {
		featuredecaytime		= "300"
	},  		
    damage             = 1000,
    description        = "Wrecked Technology Center",
    footprintX         = 8,
    footprintZ         = 8,
    height             = "30",
    hitdensity         = "100",
    metal              = 300,
    object             = "euf_techcenter_dead.s3o",
    reclaimable        = true,
    reclaimTime        = 40,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
