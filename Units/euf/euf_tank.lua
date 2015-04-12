-- UNITDEF -- euf_tank --
--------------------------------------------------------------------------------

local unitName = "euf_tank"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 0.1,
  buildCostEnergy    = 1000,
  buildCostMetal     = 1000,
  buildPic           = "euf_tank.png",
  buildTime          = 1000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF LAND HEAVYARMOR",
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "65 45 100",
  collisionVolumeOffsets 	= "0 20 0",
  -- collisionVolumeTest 		= 1,    
  corpse             = "dead",
  customParams          = {	
	factionname		   = "imperials",
	normaltex = "unittextures/normalmaps/euf_tank_normal.png",
	normalmaps = "yes",	
	helptext = "As the core of your advanced forces the battletank takes lots of damage and can defend itself."	
	},
  defaultmissiontype = "Standby",
  description        = "Battletank",
  --  energyMake         = "-3.5",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 5500,
  maxSlope           = 10,
  maxVelocity        = 2,
  maxReverseVelocity = 2,
  turnInPlace        = true,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "TANK4X4",
  name               = "K1A5 Battletank",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_tank.s3o",
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 10,
  trackStretch           = 1,
  trackType              = [[StdTank]],
  trackWidth             = 50, 
    
  turnRate           = 200,
  unitname           = "euf_tank",
  sfxtypes = {
    explosiongenerators = {
      "custom:TRACKED_FX",
      "custom:MEDIUM_EXPLOSION_YELLOW",
      "custom:PLasmaTowerGunFlare",
      "custom:PLasmaTowerGunGroundflash",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_emergency",
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
      "tank_move",
    },
    select = {
      "tank_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "BATTLETANK_GUN",
	  badTargetCategory = "AIR",
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BATTLETANK_GUN = {
    avoidFeature            = true,
    avoidFriendly           = true,
	accuracy           = 920,
    alphaDecay         = 0.5,
    areaOfEffect       = 120,
    ballistic          = true,
    cegTag             = "PLasmaTowerGunProjectileGroundflash",
    energypershot           = 0,	
    explosionGenerator = "custom:TankImpact",
    gravityaffected    = "true",
    interceptedByShieldType = 1,
    model              = "plasma.s3o",	
    movingAccuracy     = 1620,
    name               = "Plasma Cannon",
    range              = 600,
    reloadtime         = 3,
    renderType         = 4,
    rgbColor           = "0.33 1 1",
    separation         = 0.44,
    size               = 0.1,
    sizeDecay          = -0.55,
    soundHit           = "cannon_hit2",
    soundStart         = "tank_cannon",
    stages             = 0,
    startsmoke         = "1",
    tolerance          = 500,
    turret             = true,
    weaponType         = "Cannon",
    weaponVelocity     = 560,
    damage = {
      default            = 420,
      flyer              = 420*0.33,
      heavy              = 420,
      light              = (420*0.75),
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
    description        = "Wrecked Tank",
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = "35",
    hitdensity         = "1000",
    metal              = 0,
    object             = "euf_tank_dead.s3o",
    reclaimable        = true,
  },
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
