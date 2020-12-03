-- UNITDEF -- TC_ICON --
--------------------------------------------------------------------------------

local unitName = "tc_icon"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "HEAVY",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 15000,
  buildCostMetal     = 15000,
  buildPic           = "tc_icon.png",
  buildTime          = 15000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "70 100 70",
  collisionVolumeType = "CylY",
  collisionVolumeTest 		= 1,  
  customParams          = {	
	factionname		   = "cursed",
	noxpgain = "1",
    normaltex = "unittextures/normalmaps/tc_icon_normal.png",
	normalmaps = "yes",
    helptext = "Hell awaits!"
	},
  defaultmissiontype = "Standby",
  description        = "Lord of Sins",
  --  energyMake         = "-5",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = "bigcircle",
  idleAutoHeal       = 12,
  idleTime           = 300,
  mass               = 30000,
  maxDamage          = 66666,
  maxSlope           = 10,
  maxVelocity        = 1.4,
  maxWaterDepth      = 25,
  mobilestandorders  = "1",
  movementClass      = "ULTRAHEAVYWALKER4X4",
  name               = "Belial",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_icon.s3o",
  repairable         = false,     
  script             = 'tc_icon.lua',
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 896,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[Walker]],
  trackWidth             = 70,  
  
  turnRate           = 750,
  unitname           = "tc_icon",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONING_BIGGEST",
      "custom:Greycloud",
      "custom:BLOOD_EXPLOSION_BIG",
      "custom:BelialGunFlare",
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
      "demoncry",
    },
    select = {
      "demoncry",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "ICONRAY",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND AIR",
    },
    [2]  = {
      badTargetCategory  = "LIGHTARMOR",
      def                = "ICONRAY",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      badTargetCategory = "AIR",	  
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ICONRAY = {
   name               = "Hell Ray",
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 64,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
	noSelfDamage       = true,	
    soundHit           = "AgaresLaserHit",
    soundStart         = "AgaresLaser",
    soundTrigger       = true,
	sweepFire		   = false,		
    targetMoveError    = 0.33,
    tolerance          = 1500,
    turret             = true,
    weaponVelocity     = 1500,	
	------------------------------------------
    beamTime           = 0.75,
    coreThickness      = 1,
    thickness          = 7,	
    largeBeamLaser     = true,
    laserFlareSize     = 6,
	scrollSpeed 	   = 1.5,
	tileLength         = 200,
	pulseSpeed 		   = 2,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    weaponType         = "BeamLaser",
------------------------------------------------------------
    areaOfEffect       		= 48,	
	range                   = 900,
    reloadtime 				= 1.5,
	rgbColor           		= {0.45, 1, 0.1},
	rgbColor2 		   		= {1, 1, 1},
    explosionGenerator 		= "custom:AGARES_LASER",
------------------------------------------------------------	
  damage = {
      default            = 300,
      flyer              = (300*0.33),
      heavy              = 300,
      light              = (300*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------