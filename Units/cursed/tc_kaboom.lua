-- UNITDEF -- TC_KABOOM --
--------------------------------------------------------------------------------

local unitName = "tc_kaboom"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.1,
  activateWhenBuilt  = true,
  armortype          = "HEAVY",
  brakeRate          = 1.3,
  buildCostEnergy    = 250,
  buildCostMetal     = 250,
  buildPic           = "tc_kaboom.png",
  buildTime          = 250,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  customParams          = {	
	factionname	= "cursed",
	normaltex = "unittextures/normalmaps/atlas_tc_mechanics_normal.png",
	normalmaps = "yes",	
	cankamakazi = "true",
    helptext 	= "The water proof rigor mortis has radar distortion, will create and EMP wave when being destroyed and is the only unit that can attack burrowed scorpions."		
  },
  defaultmissiontype = "Standby",
  description        = "Detection distortion, anti-scorpion.",
  --  energyMake         = "-1",
  explodeAs          = "PARALYSE_BLAST",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = "bigcircle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 3000,
  maxDamage          = 680,
  maxSlope           = 45,
  maxVelocity        = 1.6,
  maxWaterDepth      = 500,
  mobilestandorders  = "1",
  movementClass      = "SubTrooper2X2",
  name               = "Silentia Mortis",
  nanoColor          = "0.6 1 0.15",
  noAutoFire         = false,
  objectName         = "TC_Kaboom.s3o",
  onoffable          = false,
  radarDistanceJam   = 1024,  
  selfDestructAs     = "PARALYSE_BLAST_BIG",
  selfDestructCountdown = 0,
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 500,
  smoothAnim         = false,
  sonarDistanceJam   = 1024,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 1400,
  unitname           = "tc_kaboom",
  sfxtypes = {
    explosiongenerators = {
      "custom:RM_CIRCLE",
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
      "mechanodemon",
    },
    select = {
      "mechanodemon",
    },
  },
 weapons = {
    [1]  = {
      badTargetCategory  = "HEAVYARMOR",
      def                = "SUBBLAST",
      onlyTargetCategory = "SUBTERRAIN",
    },
  },
}
--------------------------------------------------------------------------------

local weaponDefs = {
  SUBBLAST = {
      name                    = "Subterrain Blast",
      areaOfEffect            = 0,
      -- beamweapon              = true,
	  cegTag                  = "UNBURROWING",
      coreThickness           = 0,
      craterBoost             = 1,
      craterMult              = 2,
      duration                = 0.01,
      energypershot           = 0,
      explosionGenerator      = "custom:UNBURROWING",
      fireStarter             = 50,
	  heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      -- lineofsight             = true,
      --noSelfDamage            = true,
      range                   = 300,
      reloadtime              = 4,
      -- rendertype              = 0,
      rgbColor                = "0 0 0",
 --     soundHit                = "AgaresLaserHit",
      soundStart              = "subterrain_blast",
	  soundStartVolume   = 30,
      soundTrigger            = true,
      targetMoveError         = 0.15,
      thickness               = 0,
      tolerance               = 10000,
      turret                  = true,
      waterWeapon             = true,	  
      weaponType              = "LaserCannon",
      weaponVelocity          = 500,
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

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
