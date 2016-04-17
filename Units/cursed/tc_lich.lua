-- UNITDEF -- TC_LICH --
--------------------------------------------------------------------------------

local unitName = "tc_lich"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildDistance      = 100,
  builder            = true,
  buildPic           = "tc_lich.jpg",
  buildTime          = 500,
  canAssist          = true,
  canAttack          = true,
  canBeAssisted      = false,
  canCapture         = false,
  canGuard           = true,
  --canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canResurrect       = false,
  canstop            = "1",
  captureSpeed       = 0,
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "20 50 20",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
	factionname		   = "cursed",
	isinfantry = "true",
	isbones = "true",
	noautorepair = true,  	
    helptext = "Liches can summon demons and stun enemies. When a Totem of Frenzy was build liches have the aura of frenzy (making friendly units shoot faster but more inaccurate. When the Lich is in summon stance it acts like a factory."			
  },
  defaultmissiontype = "Standby",
  description        = "advanced summoner",
  energyMake         = 2,
  energyStorage      = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,

  crushResistance    = 2000,
  mass               = 300,  
  
  maxDamage          = 1000,
  maxSlope           = 14,
  maxVelocity        = 2.2,
  maxWaterDepth      = 35,
  metalMake          = 0.5,
  metalStorage       = 0,
  mobilestandorders  = "1",
  movementClass      = "TANKHOVER2x2",
  name               = "Lich",
  nanoColor          = "0.6 1 0.15",
  noChaseCategory    = "AIR",
  objectName         = "tc_lich.s3o",
  radarDistance      = 768,
  reclaimSpeed       = 5,
  repairSpeed        = 8,
  repairable         = false,     
  resurrectSpeed     = 0,
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "cursed",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "2",
  standingmoveorder  = "0",
  terraformSpeed     = 1200,
  turnRate           = 1005,
  unitname           = "tc_lich",
  upright            = true,
  workerTime         = 24,
  buildoptions = {
    "tc_obelisk_lvl2",
	"tc_metalextractor_lvl2",
	"tc_cacodemon",	
    "tc_rictus",
    "tc_crawler",
    "tc_pestilence",
    "tc_mancubus",
    "tc_belial",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Small",
      "custom:REDGREENBLOOD_EXPLOSION",
      "custom:PENTAGRAM",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "bell",
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
      "lich",
    },
    select = {
      "lich",
    },
  },
  weapons = {
    [1]  = {
      def                = "LICHBOLT",
      mainDir            = "0 0 1",
      maxAngleDif        = 120,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  LICHBOLT = {
    accuracy           = 300,
    areaOfEffect       = 8,
    -- beamweapon         = true,
    burnblow           = true,
    cegTag             = "LICHBOLT",
    coreThickness      = 0,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.05,
      energypershot           = 0,	
    explosionGenerator = "custom:LICHBOLT_EXPLOSION",
    impulseBoost       = 0,
    intensity          = 0.5,
    -- lineofsight        = true,
    name               = "Lichbolt",
    paralyzer          = 1,
    paralyzetime       = 15,
    range              = 600,
    reloadtime         = 2.0,
    -- rendertype         = 0,
    rgbColor           = "1 1 1",
    soundHit           = "defender_hit",
    soundStart         = "weirdbreath",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 650,
    texture1           = "darkbolt",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 1.8,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 650,
    damage = {
      default            = 350,
      flyer              = 350,
      heavy              = 350,
      light              = 350,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
