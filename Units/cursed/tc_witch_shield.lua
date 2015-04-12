-- UNITDEF -- TC_LICH --
--------------------------------------------------------------------------------

local unitName = "tc_witch_shield"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  brakeRate          = 0.3,
  buildCostEnergy    = 400,
  buildCostMetal     = 400,
  buildDistance      = 0,
  builder            = false,
  buildPic           = "tc_witch.jpg",
  buildTime          = 400,
  canAssist          = false,
  canAttack          = false,
  canBeAssisted      = false,
  canCapture         = false,
  canCloak           = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canReclaim         = false,
  canRepair          = false,
  canRestore	   = false,
  canResurrect       = false,
  canstop            = true,
  captureSpeed       = 0,
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 45 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {	
	factionname		   = "cursed",
	isinfantry = "true",
	mana = 100,
	manaregeneration = 3,	
    helptext = "Witches have two powerful attack spells. The death ray will slow down enemies (movement and attack speed). The Hellstorm is a strong ranged attack. Witches can have two sorts of auras when the proper totems were built by the heart of darkness. The healing aura (heals nearby friendly units) and the curse aura (reduces enemy's accuracy). When a altar of darkness was built wiches can cast a shield spell to protect cursed structures and units."		
	},
  defaultmissiontype = "Standby",
  description        = "Spellcaster",
  decloakDistance    = 0,
  energyMake         = "-100",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 2000,
  maxDamage          = 1500,
  maxSlope           = 20,
  maxVelocity        = 0,
  maxWaterDepth      = 35,
  metalMake          = 0,
  metalStorage       = 0,
  noAutoFire         = false,
  norestrict         = "1",
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Witch casting Shield Spell",
  nanoColor          = "0.68, 0.31, 0.70",
  objectName         = "tc_witch.s3o",
  onoffable         = true,
  radarDistance      = 768,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  repairable         = false,  
  resurrectSpeed     = 0,
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 512,
  standingfireorder  = "2",
  standingmoveorder  = "0",
  terraformSpeed     = 0,
  TEDClass          = "SPECIAL",
  turnRate           = 0,
  unitname           = "tc_witch_shield",
--  workerTime         = 0,
  yardMap           = "oooo",

  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
   	"custom:SPIKES_WITCH", 
    	"custom:SPIKES_WITCH", 
     	"custom:GROUNDFLASH_WITCH", 
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
      "",
    },
    select = {
      "witch",
    },
  },
  weapons = {
    [1]  = {
      def                = "WitchShield",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
     WitchShield = {
      name                    = "Shield Spell",
      craterMult              = 0,
      impulseFactor           = 0,
      shieldAlpha             = 0.2,
      shieldBadColor          = "1 0.0 0.0",
      shieldForce             = 4,
      shieldGoodColor         = "0.5 1.0 0.15",
      shieldInterceptType     = 1,
      shieldMaxSpeed          = 400,
      shieldPower             = 4000,
      shieldPowerRegen        = 200,
      shieldPowerRegenEnergy  = 100,
      shieldRadius            = 350,
      shieldRepulser          = false,
      smartShield             = true,
      texture1                = "wake",
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

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
