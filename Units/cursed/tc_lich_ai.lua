-- UNITDEF -- TC_LICH --
--------------------------------------------------------------------------------

local unitName = "tc_lich_ai"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildDistance      = 200,
  builder            = true,
  buildPic           = "tc_lich.png",
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
  canstop            = true,
  cantBeTransported  = true, 
  capturable         = false, 
  captureSpeed       = 0,
  category           = "CURSED LAND LIGHTARMOR",
  collisionVolumeOffsets = "0 0 0",
  collisionVolumeScales = "20 50 20",
  collisionVolumeType = "CylY",
  -- collisionVolumeTest 		= 1,  
  customParams          = {
	factionname		   = "cursed",
	area_mex_def = "tc_metalextractor_lvl2",	
	isinfantry = "true",
	isbones = "true",
    helptext = "Liches can summon demons and stun enemies. When a Totem of Frenzy was build liches have the aura of frenzy (making friendly units shoot faster but more inaccurate. When the Lich is in summon stance it acts like a factory."				
  },
  defaultmissiontype = "Standby",
  description        = "advanced summoner",
  energyMake         = 10,
  energyStorage      = 50,
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  hideDamage         = true,
  iconType           = "spanner",
  idleAutoHeal       = 2.5,
  idleTime           = 400,

  crushResistance    = 2000,
  mass               = 200,
  
  maxDamage          = 800,
  maxSlope           = 14,
  maxVelocity        = 2.2,
  maxWaterDepth      = 35,
  metalMake          = 1,
  metalStorage       = 50,
  mobilestandorders  = "1",
  movementClass      = "SMALLHOVER2x2",
  name               = "Lich (AI)",
  nanoColor          = "0.6 1 0.15",
  noChaseCategory    = "AIR",
  objectName         = "tc_lich.s3o",
  radarDistance      = 768,
  repairable         = false,     
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
  unitname           = "tc_lich_ai",
  upright            = true,

  -- remark: will be overwriten by unit_attriutes.lua based on factors multiplied with workertime  
  resurrectSpeed     = 0,
  captureSpeed       = 0,   
  repairSpeed        = 12,
  reclaimSpeed       = 24,
  workerTime         = 24,
  terraformSpeed     = 240,
 
  buildoptions = {
    "tc_metalextractor_lvl2",
    "tc_soulcage",
    "tc_pyramid_ai",
    "tc_damnedportal_ai",
    "tc_darkassembler",
    "tc_defender",
    "tc_tower",
    "tc_hellfire",	
    "tc_seer",
    "tc_altar",
	"tc_altar_hellstorm",
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
    name               = "Lich Bolt",
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
