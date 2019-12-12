-- UNITDEF -- euf_angel --
--------------------------------------------------------------------------------

local unitName = "euf_angel"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  activateWhenBuilt  = true,
  airHoverFactor     = 0,
  airStrafe          = false,
  armortype          = "FLYER",
  brakeRate          = 0.931,
  buildCostEnergy    = 3500,
  buildCostMetal     = 3500,
  buildPic           = "euf_angel.png",
  buildTime          = 3500,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = true,
  cantBeTransported  = true, 
  category           = "EUF AIR",
  cruiseAlt          = 75,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",	
	RequireTech         = "Divine Help",
    helptext 	= "The angel is the strongest flying imperial unit and very usefull against ground targets. Requires Sanctum."	
  },
  description        = "Believe! Requires Sanctum.",
  dontland           = "1",
  --  energyMake         = "-20",
  explodeAs          = "NULL",
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  hoverAttack        = true,
  iconType           = "skull",
  idleAutoHeal       = 5,
  idleTime           = 400,
  mass               = 30000,
  maxDamage          = 7200, -- was 6000
  maxSlope           = 25,
  maxVelocity        = 3,
  maxWaterDepth      = 0,
  name               = "Angel",
  nanoColor          = "0 0 0",
  noChaseCategory    = "AIR",
  objectName         = "euf_angel.s3o",
  onoffable          = false,
  radarDistance      = 1024,
  script             = "euf_angel.cob",  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  side               = "imperials",
  sightDistance      = 1024,
  sonarDistance      = 1500,
  turnRate           = 800,
  upright            = true,  
  unitname           = "euf_angel",
  sfxtypes = {
    explosiongenerators = {
		"custom:Small_Explosion_YELLOW",
		"custom:SUMMONANGEL",	  
    },
  },
  sounds = {
    canceldestruct     = "",
    underattack        = "voices_emergency",
    arrived = {
      "",
    },
    cant = {
      "cannot",
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
      "angel_select",
    },
    select = {
      "angel_select",
    },
  },
  weapons = {
    [1]  = {
      def                = "HOLYBOLT",
      mainDir            = "0 0 1",
      maxAngleDif        = 220, 
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  HOLYBOLT = {
			name                    = "Star Fire",
			areaOfEffect            = 75,
			avoidFriendly           = false,
			bouncerebound			= .3,
			bounceslip				= .3,
			burnblow				= 1,
			burst                   = 8,
			burstrate               = 0.1,
			cegtag			   		= "HOLYBOLTTRACE",			
			collideFriendly         = false,
			craterBoost             = 1,
			craterMult              = 2,
			dance                   = 30,
				energypershot           = 0,			
			explosionGenerator      = "custom:HOLYBOLTTRACE",
			fixedlauncher           = 1,
			flightTime              = 3,
			groundbounce            = 1,
			heightmod               = 0.5,
			impactOnly              = true,
			impulseBoost            = 0,
			impulseFactor           = 0.4,
			interceptedByShieldType = 1,
			-- lineofsight             = true,
			model                   = "empty.s3o",
--			noexplode				= 1,
			range                   = 400,
			reloadtime              = 6,
			-- rendertype              = 1,
			smokeTrail              = false,
			soundstart              = "angel",
			soundHit           = "null",				
			soundStartVolume        = 30,
			startVelocity           = 200,
			texture1                = "",
			texture2                = "",
			tolerance               = 10000,
			tracks                  = true,
			turnRate                = 24000,
			turret                  = true,
			waterweapon             = true,
			weaponAcceleration      = 200,
			weaponType              = "MissileLauncher",
			weaponVelocity          = 500,
			wobble                  = 15000,
    damage = {
      default            = 200, --250
      flyer              = 200,
      heavy              = 200,
      light              = (200*2),
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
