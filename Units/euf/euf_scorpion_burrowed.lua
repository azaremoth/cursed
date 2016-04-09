-- UNITDEF -- euf_scorpion --
--------------------------------------------------------------------------------

local unitName = "euf_scorpion_burrowed"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  armortype          = "HEAVY",
  brakeRate          = 0.1,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_scorpion.png",
  buildTime          = 500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "EUF SUBTERRAIN",
  customParams          = {	
	factionname		   = "imperials",
	RequireTech         = "Advanced Technology",
	helptext = "This unit can dig into the ground and move very slowly but hidden from the enemy."	
	},
  defaultmissiontype = "Standby",
  description        = "Diggeroid",
  --  energyMake         = "-3",
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  highTrajectory     = 0,
  iconType           = "bigcircle",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  mass               = 10000,
  maxDamage          = 1600,
  maxSlope           = 10,
  maxVelocity        = 0.5,
  maxWaterDepth      = 20,
  mobilestandorders  = "1",
  movementClass      = "SUBTERRAIN",
  name               = "Scorpion (burrowed)",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_scorpion_burrowed.s3o",
  script             = "euf_scorpion_burrowed.lua",    
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 0,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  turnRate           = 200,
  unitname           = "euf_scorpion_burrowed",
  sfxtypes = {
    explosiongenerators = {
      "custom:BURROWING",	
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
      "voices_yes",
    },
    select = {
      "voices_from_the_hidden",
    },
   },
  weapons = {
    [1]  = {
      def                = "SUBMELEE",
      onlyTargetCategory = "SUBTERRAIN",
    },
  },
}


--------------------------------------------------------------------------------
local weaponDefs = {
  SUBMELEE = {
    areaOfEffect       = 8,
    avoidFriendly      = 0,
    collideFriendly    = false,
    craterBoost        = 1,
    craterMult         = 2,
	cylinderTargeting = 1,	
      energypershot           = 0,	
    explosionGenerator = "custom:UNBURROWING",
    heightmod	     = 1,
    impactonly         = true,
    impulseBoost       = 0,
    impulseFactor      = 0.4,
    interceptedByShieldType = 3,
    lineOfSight        = false,
    name               = "SubMelee",
    --noSelfDamage       = true,
    range              = 45,
    reloadtime         = 2,
    size               = 0,
 --   soundHit           = "defender_hit",
    soundStart         = "scorpion_burrowed",
    soundStartVolume   = 15,
    soundTrigger       = true,	
    targetBorder       = 1,
    tolerance          = 5000,
    turret             = true,
    waterWeapon        = true,
    weaponTimer        = 0.1,
    weaponType         = "Cannon",
    weaponVelocity     = 500,
    damage = {
      default            = 200,
      flyer              = 200,
      heavy              = 200,
      light              = 200,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------


return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
