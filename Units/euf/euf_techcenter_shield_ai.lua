-- UNITDEF -- euf_techcenter_shield --
--------------------------------------------------------------------------------

local unitName = "euf_techcenter_shield_ai"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
buildingGroundDecalDecaySpeed = 0.2,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 9,
  buildingGroundDecalType = "euf_groundplate.png",  
  buildTime          = 0,
  buildPic           = "euf_techcenter.png",  
  category           = "EUF LAND HEAVYARMOR",
  capturable         = false, 
  useFootPrintCollisionVolume = true,  
  corpse             = "dead",
  customParams          = {
  	factionname		   = "imperials",
--	ProvideTech         = "Advanced Technology",
	normaltex = "unittextures/normalmaps/euf_techcenter_normal.png",
	normalmaps = "yes",					
    helptext = "Provides energy and metal income and a base shield."
  },
  description        = "Provides bonuses",
  energyStorage      = 2000,
  energyMake         = 400,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = "square",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,
  maxDamage          = 8000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  metalmake          = 5,
  metalStorage       = 2000,
  name               = "Shielded Technology Center",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "euf_techcenter.s3o",
  onoffable          = false,
  radarDistance      = 1500,
  script             = "euf_techcenter_shield.lua",  
  selfDestructAs     = "BIG_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 256,
  smoothAnim         = false,
  unitname           = "euf_techcenter_shield_ai",
  useBuildingGroundDecal = true,  
  yardMap            = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
  sfxtypes = {
  explosiongenerators = {
      "custom:BIG_EXPLOSION_YELLOW",
	  "custom:SHIELDBEAM_FX",
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
      def = "Shield",
    },
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
     Shield = {
      name                    = "Shield",
      craterMult              = 0,
      impulseFactor           = 0,
      shieldAlpha             = 0.2,
      shieldBadColor          = "1 0.0 0.0",
      shieldForce             = 4,
      shieldGoodColor         = "0.0 1.0 1.0",
      shieldInterceptType     = 1,
      shieldMaxSpeed          = 400,
      shieldPower             = 4000,
      shieldPowerRegen        = 100,
      shieldPowerRegenEnergy  = 100,
      shieldRadius            = 650,
      shieldRepulser          = false,
      smartShield             = true,
      texture1                = "hexshield",
      visibleShield           = true,
      visibleShieldRepulse    = true,
      weaponType              = "Shield",
    	damage = {
      default            = 10,
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
