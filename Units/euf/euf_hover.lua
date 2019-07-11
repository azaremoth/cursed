--------------------------------------------------------------------------------

local unitName = "euf_hover"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.9,
  buildCostEnergy    = 850,
  buildCostMetal     = 850,
  buildPic           = "euf_hover.png",
  buildTime          = 850,
  canAttack          = true,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true,
  category           = "EUF LAND HEAVYARMOR",
  corpse             = "dead",
  customParams       = {
  	factionname		= "imperials",
	normaltex = "unittextures/normalmaps/euf_hover_normal.png",
	normalmaps = "yes",	
    helptext = "Hovertanks can travel across water and are versatile anti-tank units. In addition, it is equipped with a torpedo launcher."	
  },
  defaultmissiontype = "Standby",
  description        = "Hovertank",
  --  energyMake         = "-3",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,

  crushResistance    = 2000,
  mass               = 400, 
  
  maxDamage          = 2500,
  maxSlope           = 16,
  maxVelocity        = 3.4,
  maxWaterDepth      = 0,
  mobilestandorders  = "1",
  movementClass      = "TANKHOVER3x3",
  name               = "Hovertank",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_hover.s3o",
  script             = "euf_hover.cob",  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 1024,
  unitname           = "euf_hover",
  sfxtypes = {
    explosiongenerators = {
      "custom:HOVER_WATERCLOUD",
      "custom:GunGroundFlash_Medium_long",
      "custom:SMALL_EXPLOSION_YELLOW",	  
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
      "mlrs_move",
    },
    select = {
      "mlrs_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "HOVER_LASER",
      badTargetCategory  = "LIGHTARMOR AIR",
      onlyTargetCategory = "LAND",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "TORPEDO",
      onlyTargetCategory = "LAND",
    },	
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  HOVER_LASER = {
    accuracy           = 100,
    areaOfEffect       = 40,
    beamTime           = 0.75,
    burnblow           = true,
    coreThickness      = 0.3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = "custom:HOVER_LASER",
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Hover Laser",
    range              = 500,
    reloadtime         = 2.5,
    -- rendertype         = 0,
    rgbColor           = "0.39 1.00 0.84",
    soundHit           = "AgaresLaserHit",
    soundStart         = "AgaresLaser",
    soundTrigger       = true,
	sweepFire		   = false,		
    targetMoveError    = 0.4,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 3,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 1500,
    damage = {
      default            = 366,
      flyer              = 366*0.33,
      heavy              = 366,
      light              = (366*0.75),
    },
  },
   TORPEDO = {
      name                    = "Torpedo Launcher",
      areaOfEffect            = 16,
      avoidFriendly           = false,
      bouncerebound           = 0.5,
      bounceslip              = 0.5,
      burnblow                = true,
		cegTag             = "BUBBLE_TRAIL",	  
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
      explosionGenerator      = "custom:TORPEDOEXPLOSION",
      groundbounce            = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      model                   = "Rocket.s3o",
      numbounce               = 4,
      range                   = 400,
      reloadtime              = 1.75,
      -- rendertype              = 1,
      soundHit                = "ex_underwater",
      soundStart              = "bomb_drop",
      startVelocity           = 150,
      tracks                  = true,
      turnRate                = 22000,
      turret                  = true,
      waterWeapon             = true,
      weaponAcceleration      = 22,
      weaponTimer             = 3,
      weaponType              = "TorpedoLauncher",
      weaponVelocity          = 320,
    damage = {
      default            = 300,
      flyer              = 300,
      heavy              = 300,
      light              = 300,
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
		featuredecaytime		= "60"
	}, 	
    damage             = 8000,
    description        = "Former Hovertank",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "20",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_hover_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
