----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local AA_MISSILE_TOWER = {
    avoidFriendly      = false,
	collideFriendly    = false,
    areaOfEffect       		= 32,	
	range                   = 1000,
    reloadtime 				= 1.70,
    damage 					= { default = 400, flyer = 400, heavy = 400, light = 400, },
}

-----------------------------------  BASE CLASS -------------------------------------------
local AA_MISSILE_BASE = {
      name                    = "AA Missile",
      canattackground         = false,
      cegTag                  = "MLRSRocketTrail",
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting       = 128,
	  energypershot           = 10,
      explosionGenerator      = "custom:FLAKImpact",
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
      startVelocity           = 550,
      texture2                = "none",
      tolerance               = 16000,
      tracks                  = true,
      turnRate                = 55000,
      turret                  = true,
      waterweapon             = true,
      weaponAcceleration      = 550,
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
	AA_MISSILE_TOWER = WeaponDefMergeTable(AA_MISSILE_BASE, AA_MISSILE_TOWER),
})

