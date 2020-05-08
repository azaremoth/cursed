----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local AA_DW = {
    avoidFriendly      = false,
	collideFriendly    = false,
    canattackground         = false,	
    areaOfEffect       		= 32,	
	range                   = 800,
    reloadtime 				= 0.50,
	trajectoryHeight 		= 0.66,
	dance					= 150,
    startVelocity           = 400,
    weaponAcceleration      = 400,
	turnRate                = 3000,	
	cegTag                  = "GreenRocketTrail",
    explosionGenerator      = "custom:FLAKImpact",	
    damage 					= { default = 100, flyer = 100, heavy = 100, light = 100*0.33, },
}

local AA_MISSILE_TOWER_FREE = {
    avoidFriendly      = false,
	collideFriendly    = false,
    canattackground         = false,	
    areaOfEffect       		= 32,	
	range                   = 1000,
    reloadtime 				= 2.00,
    startVelocity           = 550,
    weaponAcceleration      = 550,
	turnRate                = 55000,
	cegTag                  = "MLRSRocketTrail",
    explosionGenerator      = "custom:FLAKImpact",	
    damage 					= { default = 360, flyer = 360, heavy = 360, light = 360*0.33, },
}

local AA_MISSILE_TOWER = {
    avoidFriendly      = false,
	collideFriendly    = false,
    canattackground         = false,
	energypershot           = 10,	
    areaOfEffect       		= 32,	
	range                   = 1000,
    reloadtime 				= 2.00,
    startVelocity           = 550,
    weaponAcceleration      = 550,
	turnRate                = 55000,
	cegTag                  = "MLRSRocketTrail",
    explosionGenerator      = "custom:FLAKImpact",	
    damage 					= { default = 360, flyer = 360, heavy = 360, light = 360*0.33, },
}

local AA_TROOPER = {
    avoidFriendly      = true,
	collideFriendly    = true,
    canattackground         = true,	
    areaOfEffect       		= 48,	
	range                   = 650,
    reloadtime 				= 4.50,
    startVelocity           = 250,
    weaponAcceleration      = 550,
	turnRate                = 12500,
	cegTag                  = "MLRSRocketTrail",
    explosionGenerator      = "custom:FLAKImpact",	
    damage 					= { default = 170, flyer = 170, heavy = 170, light = 170*0.33, },
}
local AA_TROOPER_BUNKER = {
    avoidFriendly      = false,
	collideFriendly    = false,
    canattackground         = true,	
    areaOfEffect       		= 48,	
	range                   = 650,
    reloadtime 				= 4.50,
    startVelocity           = 300,
    weaponAcceleration      = 250,
	turnRate                = 12500,
	cegTag                  = "MLRSRocketTrail",
    explosionGenerator      = "custom:FLAKImpact",	
    damage 					= { default = 170, flyer = 170, heavy = 170, light = 170*0.33, },
}
-----------------------------------  BASE CLASS -------------------------------------------
local AA_MISSILE_BASE = {
      name                    = "AA Missile",
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting       = 128,
      fireStarter             = 20,
      flightTime              = 4,
      impactOnly              = true,
      impulseBoost            = 0.123,
      impulseFactor           = 0.0492,
      interceptedByShieldType = 2,
      -- lineofsight             = true,
      metalpershot            = 0,
      model                   = "ROCKET.s3o",
      noSelfDamage            = true,
      smokeTrail              = false,
      soundHit                = "mediumexplosion",
      soundStart              = "launchrocket",
      soundTrigger            = true,
      texture2                = "none",
      tolerance               = 16000,
      tracks                  = true,
      turret                  = true,
      waterweapon             = true,
      weaponTimer             = 3,
      weaponType              = "MissileLauncher",
      weaponVelocity          = 800,
}
----------------------------------- FINALIZE ---------------------------------------------
function WeaponDefCopyTable(tableToCopy, deep)
  local copy = {}
  for key, value in pairs(tableToCopy) do
    if (deep and type(value) == "table") then
      copy[key] = WeaponDefCopyTable(value, true)
    else
      copy[key] = value
    end
  end
  return copy
end

function WeaponDefMergeTable(primary, secondary, deep)
    local new = WeaponDefCopyTable(primary, deep)
    for i, v in pairs(secondary) do
	    -- key not used in primary, assign it the value at same key in secondary
	    if not new[i] then
		    if (deep and type(v) == "table") then
			    new[i] = WeaponDefCopyTable(v, true)
		    else
			    new[i] = v
		    end
	    -- values at key in both primary and secondary are tables, merge those
	    elseif type(new[i]) == "table" and type(v) == "table"  then
		    new[i] = WeaponDefMergeTable(new[i], v, deep)
	    end
    end
    return new
end

return lowerkeys({
	AA_DW = WeaponDefMergeTable(AA_MISSILE_BASE, AA_DW),
	AA_MISSILE_TOWER = WeaponDefMergeTable(AA_MISSILE_BASE, AA_MISSILE_TOWER),
	AA_MISSILE_TOWER_FREE = WeaponDefMergeTable(AA_MISSILE_BASE, AA_MISSILE_TOWER_FREE),
	AA_TROOPER = WeaponDefMergeTable(AA_MISSILE_BASE, AA_TROOPER),
	AA_TROOPER_BUNKER = WeaponDefMergeTable(AA_MISSILE_BASE, AA_TROOPER_BUNKER),	
})

