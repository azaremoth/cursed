-- UNITDEF -- euf_bomber --
--------------------------------------------------------------------------------

local unitName = "euf_bomber"

--------------------------------------------------------------------------------

local unitDef = {
  unitname           = "euf_bomber",
  name               = "'Turtle' Heavy Bomber",  
  description        = "Bomber",
  objectName         = "euf_bomber.s3o",
  script             = 'euf_bomber.lua',
  buildPic           = "euf_bomber.png",  
  category           = "EUF AIR",
  armortype          = "FLYER",   
  side               = "imperials",
  iconType           = "bigtriangle",
  customParams          = {
	factionname	= "imperials",
		normaltex = "unittextures/normalmaps/euf_bomber_normal.png",
		normalmaps = "yes",			
    helptext 	= "The imperial bomber is very effective against static ground targets and slow armoured units."
  }, 
-- Costs and HPs
  buildCostEnergy     = 350,
  buildCostMetal      = 350,
  buildTime           = 350,
  maxDamage           = 1080, -- was 900  
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
  explodeAs          = "BIG_AIRPLANE_BLAST_YELLOW",
  selfDestructAs     = "BIG_AIRPLANE_BLAST_YELLOW",
  nanoColor          = "0 0 0",
  showNanoFrame      = false,
  sfxtypes = {
    explosiongenerators = {
      "custom:MEDIUM_EXPLOSION_YELLOW",
      "custom:MLRSRocketTrail",	  
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
      "bomber_move",
    },
    select = {
      "bomber_select",
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = "LIGHTARMOR AIR",	
      def                = "BOMB",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  BOMB = {
    accuracy           = 800,
    areaOfEffect       = 50,
    avoidFeature       = false,
    avoidFriendly      = false,
    avoidneutral       = "0",
    burnblow           = false,
	cegtag			   = "MLRSRocketTrail",
    collideFeature     = true,
    collideFriendly    = false,
    collideneutral     = "1",
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
    energypershot      = 0,
	explosiongenerator=	"custom:bigbulletimpact",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    flightTime         = 3,
    guided             = "1",
    impulseBoost       = 0,
    impulseFactor      = 0,
    interceptedByShieldType = 1,
    model              = "rocket2.s3o",
    myGravity          = 0.15,
    name               = "Bomb Rocket",
    --noSelfDamage       = true,
    pitchtolerance     = "1500",
    range              = 300,
    reloadtime         = 5,
    selfprop           = true,
--  Sound	------------------------------------------------	
    soundHit           = "bomb_hit",
    soundStart         = "bomb_drop",
    soundHitVolume     = 15,
    soundStartVolume   = 15,
    soundTrigger       = true,
-----	
    startVelocity      = 250,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    tracks             = true,
    trajectoryHeight   = 0.65,
    turret             = true,
    weaponAcceleration = 100,
    weaponType         = "MissileLauncher",
    weaponVelocity     = 150,
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
