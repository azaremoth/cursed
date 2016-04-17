local Meleebase = Weapon:New{
	  ----------------------------------------------
	  avoidFeature			= false,
	  avoidFriendly      	= false,	  
      canattackground       = true,
      collideFriendly    	= false,
	  ----------------------------------------------
      craterBoost             = 0,
      craterMult              = 0,
	  cylinderTargeting       = 1,		  
      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 90,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      minIntensity            = 1,
      noSelfDamage            = true,
      rgbColor                = [[0 0 0]],
      targetborder            = 1,
      targetMoveError         = 0.0,
      tolerance               = 10000,
      turret                  = true,
      waterweapon             = true,
      weaponType              = [[Melee]],
      weaponVelocity          = 10000, 
	  ----------------------------------------------
}



--------------------------------------------------------------------------------

local weaponDef = {
      name                    = [[Melee]],
      areaOfEffect            = 16,
      range                   = 64,
      reloadtime              = 1.3,

    damage = {
      default            = 120,
      flyer              = 120,
      heavy              = (120*0.75),
      light              = 120,
    },
 }

--------------------------------------------------------------------------------

return lowerkeys({["GHOULMELEE"] = weaponDef})

--------------------------------------------------------------------------------
