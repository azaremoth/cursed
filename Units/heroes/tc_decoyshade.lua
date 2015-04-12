--------------------------------------------------------------------------------

local unitName = "tc_decoyshade"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.0,
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildPic           = "tc_shade.jpg",
  buildTime          = 0,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = "1",
  category           = "CURSED LAND HEAVYARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "22 35 22",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "cursed",
	RequireTech = "Decoy",
	ProvideTech = "-Decoy",
	normaltex = "unittextures/normalmaps/tc_shade_normal.png",
	normalmaps = "yes",		
    helptext 	= "The Shade is a cursed damage dealer class hero."
 },  
  defaultmissiontype = "Standby",
  description        = "Hero",
  energyMake         = "",
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "circle",
  idleAutoHeal       = 0,
  idleTime           = 400,
  mass               = 3000,
  maxDamage          = 1000,
  maxSlope           = 25,
  maxVelocity        = 3.5,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper3X3",
  name               = "Shade (Decoy)",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "tc_shade.s3o",
  script             = 'tc_shade_decoy.lua',  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "cursed",
  sightDistance      = 256,
  smoothAnim         = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  turnRate           = 2500,
  turnInPlace        = true,
  unitname           = "tc_decoyshade",
  upright            = true,
  sfxtypes = {
    explosiongenerators = {
      "custom:SUMMONDRAGON",
      "custom:SUMMONDRAGON2",
      "custom:SPARKLES",
      "custom:smokescreen",
	  "custom:HOVER_WATERCLOUD",	  
    },
  },
  sounds = {
    canceldestruct     = "",
   underattack        = "shade_underatk",
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
      "shade_move",
    },
    select = {
      "shade_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "SWORD",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
	  badTargetCategory = "AIR",
      onlyTargetCategory = "LAND AIR",
    },
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
  SWORD = {
    areaOfEffect       = 32,
    avoidFriendly      = 0,
    collideFriendly    = false,
    craterBoost        = 1,
    craterMult         = 2,
	cylinderTargeting = 1,
      energypershot           = 0,
    endsmoke           = "0",
    explosionGenerator = "custom:NONE",
	explosionScar	= false,	
    impactonly         = true,
    interceptedByShieldType = 2,
    lineOfSight        = false,
    name               = "Shade Swords",
    --noSelfDamage       = true,
    range              = 55,
    reloadtime         = 0.75,
    size               = 0,
    startsmoke         = 0,
    targetBorder       = 1,
    tolerance          = 5000,
    turret             = true,
    waterWeapon        = true,
    weaponTimer        = 0.1,
    weaponType         = "Cannon",
    weaponVelocity     = 250,
    damage = {
      default            = 20,
      flyer              = 20,
      heavy              = 20,
      light              = 20,
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
