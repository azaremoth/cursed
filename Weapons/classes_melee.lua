----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local GHOULMELEE = {
	range                   = 70,
    reloadtime 				= 1.30,
    damage 					= { default = 120, flyer = 120, heavy = (120*0.75), light = 120, },
}
local SKELMELEE = {
	range                   = 70,
    reloadtime				= 1.60,
    damage 					= { default = 140, flyer = 140, heavy = (140*0.75), light = 140, },
}
local UNDEADMARINEMELEE = {
	range                   = 70,
    reloadtime              = 2.60,
    damage 					= { default = 260, flyer = 260, heavy = (260*0.75), light = 260, },
}
local PALADINMELEE = {
	range                   = 70,
    reloadtime              = 2.00,
    damage 					= { default = 220, flyer = 220, heavy = (220*0.75), light = 220, },
}
local WEREWOLFMELEE = {
	range                   = 70,
    reloadtime              = 1.00,
    damage 					= { default = 200, flyer = 200, heavy = (200*0.75), light = 200, },
}
local DECOYSHADEMELEE = {
	range                   = 70,
    reloadtime              = 0.70,
    damage 					= { default = 40, flyer = 40, heavy = (40*0.75), light = 40, },
}
local SHADELVL1MELEE = {
	range                   = 70,
    reloadtime              = 0.90,
    damage 					= { default = 120, flyer = 120, heavy = 120, light = 120, },
}
local SHADELVL2MELEE = {
	range                   = 70,
    reloadtime              = 0.85,
    damage 					= { default = 155, flyer = 155, heavy = 155, light = 155, },
}
local SHADELVL3MELEE = {
	range                   = 70,
    reloadtime              = 0.80,
    damage 					= { default = 200, flyer = 200, heavy = 200, light = 200, },
}
local SHADELVL4MELEE = {
	range                   = 70,
    reloadtime              = 0.75,
    damage 					= { default = 390, flyer = 390, heavy = 390, light = 390, },
}
local SHADELVL5MELEE = {
	range                   = 70,
    reloadtime              = 0.70,
    damage 					= { default = 500, flyer = 500, heavy = 500, light = 500, },
}
local MEDBUGMELEE = {
	range                   = 70,
    reloadtime              = 1.50,
    damage 					= { default = 130, flyer = 130, heavy = (130*0.75), light = 130, },
}
local BIGBUGMELEE = {
	range                   = 130,
    reloadtime              = 1.50,
    damage 					= { default = 250, flyer = 250, heavy = 250, light = 250, },
}
-----------------------------------  BASE CLASS -------------------------------------------
local MELEEBASE = {
    name                    = [[Melee]],
	------------------------------------------
	avoidFeature			= false,
	avoidFriendly      		= false,	  
    canattackground     	= true,
    collideFriendly    		= false,
    collideFeature    		= false,
	------------------------------------------
	areaOfEffect            = 16,
    craterAreaOfEffect      = 0,
	craterBoost             = 0,
    craterMult              = 0,
	cylinderTargeting       = 1,		  
    explosionGenerator      = [[custom:HITSPARKLE]],
	explosionScar 			= false,
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
    weaponType              = [[Cannon]],
    weaponVelocity          = 750,
}

local MELEEBASE_OLD = {
    name                    = [[Melee]],
	------------------------------------------
	avoidFeature			= false,
	avoidFriendly      		= false,	  
    canattackground     	= true,
    collideFriendly    		= false,
    collideFeature    		= false,
	------------------------------------------
	areaOfEffect            = 16,
    craterAreaOfEffect      = 0,
	craterBoost             = 0,
    craterMult              = 0,
	cylinderTargeting       = 1,		  
    explosionGenerator      = [[custom:NONE]],
	explosionScar 			= false,	
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
	GHOULMELEE = WeaponDefMergeTable(MELEEBASE, GHOULMELEE),
	SKELMELEE = WeaponDefMergeTable(MELEEBASE, SKELMELEE),
	UNDEADMARINEMELEE = WeaponDefMergeTable(MELEEBASE, UNDEADMARINEMELEE),
	PALADINMELEE = WeaponDefMergeTable(MELEEBASE, PALADINMELEE),
	WEREWOLFMELEE = WeaponDefMergeTable(MELEEBASE, WEREWOLFMELEE),
	DECOYSHADEMELEE = WeaponDefMergeTable(MELEEBASE, DECOYSHADEMELEE),
	SHADELVL1MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL1MELEE),
	SHADELVL2MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL2MELEE),
	SHADELVL3MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL3MELEE),
	SHADELVL4MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL4MELEE),
	SHADELVL5MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL5MELEE),
	MEDBUGMELEE = WeaponDefMergeTable(MELEEBASE, MEDBUGMELEE),
	BIGBUGMELEE = WeaponDefMergeTable(MELEEBASE, BIGBUGMELEE),
})

