-- UNITDEF -- TC_ACRANIUS --
--------------------------------------------------------------------------------

local unitName = "tc_acranius"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "tc_acranius",
  name               = "Acranius",  
  description        = "Bomber",
  objectName         = "tc_acranius.s3o",
  script             = "tc_acranius.lua",
  buildPic           = "tc_acranius.jpg",
  category           = "CURSED AIR",
  armortype          = "FLYER",
  side               = "cursed",
  iconType           = "bigtriangle",  
  customParams          = {	
	factionname		   = "cursed",
    helptext 	= "The 'acranius' bomber is very effective against static ground targets and slow armoured units."
	},
-- Costs
  buildCostEnergy     = 340,
  buildCostMetal      = 340,
  buildTime           = 340,
  maxDamage           = 1000, -- was 900    
--  Flyer/Movement specifics 
  airStrafe          = false, 
  canFly             = true,
  floater            = false,
  hoverAttack        = true,
  upright            = true,
  dontland           = "1",  
  acceleration       = 0.30,
  airHoverFactor     = 0,
  brakeRate          = 0.15,
  cruiseAlt          = 250,
  maxVelocity        = 4,
  turnRate           = 512,
-- Collision
  collisionVolumeType 		= "Box",
  collisionVolumeScales 	= "70 25 60",
  collisionVolumeOffsets 	= "0 5 0",
  collide            = true,
  collisionSphereScale = 1.0,
--
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = "1",
  defaultmissiontype  = "VTOL_standby",
  fireState           = 2,
  footprintX          = 2,
  footprintZ          = 2,
  idleAutoHeal        = 0.01,
  idleTime           = 400,
  mass                = 600,
  noChaseCategory     = "AIR",
  seismicSignature    = 0,
  sightDistance       = 512,
  smoothAnim          = true,
-- Effects and Explosions
  explodeAs          = "BIG_AIRPLANE_BLAST_GREEN",
  selfDestructAs     = "BIG_AIRPLANE_BLAST_GREEN",
  nanoColor          = "0.6 1 0.15",
  showNanoFrame      = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:MEDIUM_EXPLOSION_GREEN",
	  "custom:MLRSRocketTrail",	
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
      "interceptor_move",
    },
    select = {
      "interceptor_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",	
      def                = "BOMBSHOT",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BOMBSHOT = {
    avoidFriendly      = false,
    burnblow = 0,
	collideFriendly    = false,
    accuracy           = 768,
    areaOfEffect       = 128,
	cylinderTargeting  = true,		
    energypershot      = 0,	
    explosionGenerator = "custom:SMALL_EXPLOSION_GREEN",
	explosionScar      = true,
    interceptedByShieldType = 1,
    name               = "Bomb Gun",
    range              = 300,
    reloadtime         = 5,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 150,
--  Sound	------------------------------------------------	
    soundHit           = "explode4",
    soundStart         = "acranius_shoot",
    soundHitVolume     = 15,
    soundStartVolume   = 15,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
--    cegTag             = "SPIKES_MAGE",
	RGBColor		   = "0.45 1 0.1",	
--	Weaponspecial ------------------------------------------ 
--    model              = "empty.s3o",  	
	size               = 25,
	stages 			   = 10,
	weaponType         = "Cannon",
------------------------------------------------------------	 
    damage = {
      default            = 550,
      flyer              = (550*0.1),
      heavy              = 550,
      light              = (550*0.75),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
