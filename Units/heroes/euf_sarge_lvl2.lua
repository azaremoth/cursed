--------------------------------------------------------------------------------

local unitName = "euf_sarge_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "light",
  brakeRate          = 1.0,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_sarge.png",
  buildTime          = 500,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 2 0",
  collisionVolumeScales 	= "28 52 28",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",	
    canjump        = "1",
	jumpclass = "hero",		
	normaltex = "unittextures/normalmaps/euf_sarge_normal.png",
	normalmaps = "yes",	
	ProvideTech = "-Hero",	
    helptext = "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },
  defaultmissiontype = "Standby",
  description        = "Hero",
  energyMake         = "",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "skull",
  idleAutoHeal       = 2.5,
  idleTime           = 200,
  mass               = 2000,
  maxDamage          = 2800,
  maxSlope           = 20,
  maxVelocity        = 2,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper3X3",
  name               = "Sarge (Level 2)",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_sarge.s3o",
  repairable         = false,  
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1000,
  turnInPlace        = true,
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 5,
  trackStretch           = 1,
  trackType              = [[Sarge]],
  trackWidth             = 36,   
  
  unitname           = "euf_sarge_lvl2",
  upright            = true,
  workerTime         = 0,
  script			 = "euf_sarge.lua",
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:blood_spray",
      "custom:Greycloud",
      "custom:SargeGunFlare",
      "custom:PLasmaTowerGunGroundflash",
	  "custom:JUMPBURST",
	  "custom:LEVELING",	  
    },
  },
 sounds = {
    canceldestruct     = "",
    underattack        = "sarge_underatk.ogg",
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
      "sarge_move.ogg",
      "sarge_move2.ogg",	  
      "sarge_move3.ogg",	  
    },
    select = {
      "sarge_select.ogg",
      "sarge_select2.ogg",	
    },
  },
  weapons = {
    [1]  = {
	  def                = "SARGE_CHAINGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",	
    },
   [2]  = {
	  def                = "SARGE_CHAINGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",		  
    },
 --[[  [3]  = {
	  def                = "SARGE_PLASMAGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
	  badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },
   [4]  = {
	  def                = "SARGE_PLASMAGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
	  badTargetCategory = "AIR",
      onlyTargetCategory = "LAND",
    },	]]--
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
SARGE_CHAINGUN = {
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 1024,
    areaOfEffect       = 16,
	cylinderTargeting = 128,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,	
    interceptedByShieldType = 1,
    name               = "Chaingun",
    range              = 350,
    reloadtime         = .1,
    soundHit           = "defender_hit",
    soundStart         = "chaingun",
    soundStartVolume   = 15,
    soundTrigger       = true,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 900,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	
    damage = {
      default            = 20,
      flyer              = 20,
      heavy              = (20*0.75),
      light              = 20,
    },
  },
--[[ SARGE_PLASMAGUN = {
      name                    = "Plasma Cannon",
      accuracy                = 512,
      areaOfEffect            = 20,
      -- beamweapon              = true,
      cegTag                  = "HEATRAY_CEG",
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,
      duration                = 0.3,
      dynDamageExp            = 1,
      dynDamageInverted       = false,
      explosionGenerator      = "custom:HEATRAY_HIT",
      fallOffRate             = 1,
      fireStarter             = 90,
      heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      -- lineofsight             = true,
      lodDistance             = 10000,
      --noSelfDamage            = true,
      proximityPriority       = 4,
      range                   = 350,
      reloadtime              = 0.1,
      -- rendertype              = 0,
      rgbColor                = "0.1 0.9 0.9",
      rgbColor2               = "0.25 1 0.9",
      soundStart              = "heatray_fire",
      thickness               = 3,
      tolerance               = 5000,
      turret                  = true,
      weaponType              = "LaserCannon",
      weaponVelocity          = 500,
    damage = {
      default            = 50,
      flyer              = "50*0.33",
      heavy              = "50",
      light              = "50",
    },
  }, ]]-- 
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

