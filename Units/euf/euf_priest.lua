-- UNITDEF -- euf_priest --
--------------------------------------------------------------------------------

local unitName = "euf_priest"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.15,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  brakeRate          = 0.3,
  buildCostEnergy    = 300,
  buildCostMetal     = 300,
  buildDistance      = 200,
  builder            = true,
  buildPic           = "euf_priest.png",
  buildTime          = 300,
  canAssist          = true,
  canAttack          = false,
  canBeAssisted      = false,
  canCapture         = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canResurrect       = false,
  canstop            = "1",
  captureSpeed       = 0,
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "17 33 17",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {	
	factionname		   = "imperials",
	isinfantry = "true",
	canbetransported = "true",	
	mana = 100,
	manaregeneration = 4,
	manahealer      = "true",
	manahealrange = 500,
	manahealamount = 100,
	manahurtamount = 50,
	manahealcost = 8,
	manahurtcost = 4,
	helptext = "The priest can heal allied infantry units and hurt skeletons. Moreover he can sense cloaked or burrowed units. He also has a focus aura as long as a church exists and can turn into a wolf in order to travel much faster or scout."	
	},
  defaultmissiontype = "Standby",
  description        = "Healer",
  --  energyMake         = "-1",  
  energyStorage      = 0,
  explodeAs          = "NULL",
  firestandorders    = "1",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "circle",
  idleAutoHeal       = 2.5,
  idleTime           = 400,
  mass               = 1100,
  maxDamage          = 800,
  maxSlope           = 20,
  maxVelocity        = 1.9,
  maxWaterDepth      = 35,
  metalMake          = 0.25,
  metalStorage       = 0,
  mobilestandorders  = "1",
  movementClass      = "Trooper2X2",
  name               = "Priest",
  nanoColor          = "0 0 0",
  objectName         = "euf_priest.s3o",
  radarDistance      = 768,
  reclaimSpeed       = 0,
  repairSpeed        = 0,
  repairable         = false,   
  resurrectSpeed     = 0,
  script             = 'euf_priest.lua', 
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "2",
  standingmoveorder  = "0",
  terraformSpeed     = 1200,
  turnRate           = 1044,
  unitname           = "euf_priest",
  upright            = true,
  workerTime         = 12,
  buildoptions = {
    "euf_angel",
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:SPIKES_NECROMANCER",
      "custom:BLOOD_EXPLOSION",
      "custom:blood_spray", 
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
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
      "priest3.ogg",
    },
    select = {
      "priest1.ogg",
      "priest2.ogg",	  
    },
  },
 --[[ weapons = {
    [1]  = {
      def                = "STAFF",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND",
    },
  },]]--
}

--------------------------------------------------------------------------------

local weaponDefs = {
  STAFF = {
    areaOfEffect       = 8,
    avoidFriendly      = 0,
    collideFriendly    = false,
    craterBoost        = 1,
    craterMult         = 2,
	cylinderTargeting = 1,		
      energypershot           = 0,	
    explosionGenerator = "custom:NONE",
    impactonly         = true,
    impulseBoost       = 2,
    impulseFactor      = 2,
    interceptedByShieldType = 2,
    lineOfSight        = false,
    name               = "Melee",
    --noSelfDamage       = true,
    range              = 55,
    reloadtime         = 2,
    size               = 0,
    targetBorder       = 1,
    tolerance          = 5000,
    turret             = true,
    waterWeapon        = true,
    weaponTimer        = 0.1,
    weaponType         = "Cannon",
    weaponVelocity     = 500,
    damage = {
      default            = 100,
      flyer              = 100,
      heavy              = (100*0.75),
      light              = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
