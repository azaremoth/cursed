----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local GHOULMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime 				= 1.30,
    damage 					= { default = 120, flyer = 120, heavy = (120*0.75), light = 120, },
}
local SKELMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime				= 1.60,
    damage 					= { default = 140, flyer = 140, heavy = (140*0.75), light = 140, },
}
local UNDEADMARINEMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime              = 2.60,
    damage 					= { default = 260, flyer = 260, heavy = (260*0.75), light = 260, },
}
local PALADINMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime              = 2.00,
    damage 					= { default = 220, flyer = 220, heavy = (220*0.75), light = 220, },
}
local WEREWOLFMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime              = 1.00,
    damage 					= { default = 200, flyer = 200, heavy = (200*0.75), light = 200, },
}
local DECOYSHADEMELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 80,
    reloadtime              = 0.34,
    damage 					= { default = 50, flyer = 50, heavy = 50, light = 50, },
}
local SHADELVL1MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    		= { default = 44, flyer = 44, heavy = 44, light = 44, },
}
local SHADELVL2MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 72, flyer = 72, heavy = 72, light = 72, },
}
local SHADELVL3MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 100, flyer = 100, heavy = 100, light = 100, },
}
local SHADELVL4MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 128, flyer = 128, heavy = 128, light = 128, },
}
local SHADELVL5MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16, 
	range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 156, flyer = 156, heavy = 156, light = 156, },
}
local SHADELVL6MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 184, flyer = 184, heavy = 184, light = 184, },
}
local SHADELVL7MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
    range                   = 80,
	areaOfEffect            = 16,	
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 212, flyer = 212, heavy = 212, light = 212, },
}
local SHADELVL8MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
    range                   = 80,
	areaOfEffect            = 16,	
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 240, flyer = 240, heavy = 240, light = 240, },
}
local SHADELVL9MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 268, flyer = 268, heavy = 268, light = 268, },
}
local SHADELVL10MELEE = {
    explosionGenerator      = [[custom:GREENHITSPARKLE]],
	areaOfEffect            = 16,
    range                   = 80,
    reloadtime              = 0.34,
	customParams          	= {	circlestrike = "true" },
    damage 		    = { default = 296, flyer = 296, heavy = 296, light = 296, },
}
local MEDBUGMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 16,
	range                   = 70,
    reloadtime              = 1.50,
    damage 					= { default = 130, flyer = 130, heavy = (130*0.75), light = 130, },
}
local BIGBUGMELEE = {
    explosionGenerator      = [[custom:HITSPARKLE]],
	areaOfEffect            = 64,
	range                   = 130,
    reloadtime              = 1.50,
    damage 					= { default = 250, flyer = 250, heavy = 250, light = 250, },
}
-----------------------------------  BASE CLASS -------------------------------------------
local MELEEBASE = {
    name                    = [[Melee]],
	------------------------------------------
	avoidFeature			= true,
	avoidFriendly      		= false,	  
    canattackground     	= true,
    collideFriendly    		= false,
    collideFeature    		= true,
	------------------------------------------
    craterAreaOfEffect      = 0,
	craterBoost             = 0,
    craterMult              = 0,
	cylinderTargeting       = 1,		  
	explosionScar 			= false,
    fireStarter             = 90,
    impactOnly              = true,
    impulseBoost            = 0,
    impulseFactor           = 0.4,
    interceptedByShieldType = 2,
    minIntensity            = 1,
    noSelfDamage            = true,
    rgbColor                = [[0 0 0]],
    soundHit           = "null",	
    soundStart         = "null",	
    targetborder            = 1,
    targetMoveError         = 0.0,
    tolerance               = 10000,
    turret                  = true,
    waterweapon             = true,
    weaponVelocity          = 1500,
	------------------------------------------
    beamTime           		= 0.01,
    coreThickness      		= 0,
    largeBeamLaser     		= false,
    thickness          		= 0,	
    weaponType              = [[BeamLaser]],
    texture1           		= "null_texture",
    texture2           		= "null_texture",
    texture3           		= "null_texture",
    texture4           		= "null_texture",
	beamTTL 				= 0,
	beamDecay 				= 1,
	laserFlareSize 			= 0,
}

local MELEEBASE_NOSOOLD = {
    name                    = [[Melee]],
	------------------------------------------
	avoidFeature			= true,
	avoidFriendly      		= false,	  
    canattackground     	= true,
    collideFriendly    		= false,
    collideFeature    		= true,
	------------------------------------------
	areaOfEffect            = 16,
    craterAreaOfEffect      = 0,
	craterBoost             = 0,
    craterMult              = 0,
	cylinderTargeting       = 1,		  
	explosionScar 			= false,
    fireStarter             = 90,
    impactOnly              = true,
    impulseBoost            = 0,
    impulseFactor           = 0.4,
    interceptedByShieldType = 2,
    minIntensity            = 1,
    noSelfDamage            = true,
    rgbColor                = [[0 0 0]],
    soundHit           = "null",	
    soundStart         = "null",	
    targetborder            = 1,
    targetMoveError         = 0.0,
    tolerance               = 10000,
    turret                  = true,
    waterweapon             = true,
    weaponType              = [[Cannon]],
    weaponVelocity          = 400,
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
    soundHit           = "null",	
    soundStart         = "null",		
    targetborder            = 1,
    targetMoveError         = 0.0,
    tolerance               = 10000,
    turret                  = true,
    waterweapon             = true,
    weaponType              = [[Melee]],
    weaponVelocity          = 4000,
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
	SHADELVL6MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL6MELEE),
	SHADELVL7MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL7MELEE),
	SHADELVL8MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL8MELEE),
	SHADELVL9MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL9MELEE),
	SHADELVL10MELEE = WeaponDefMergeTable(MELEEBASE, SHADELVL10MELEE),		
	MEDBUGMELEE = WeaponDefMergeTable(MELEEBASE, MEDBUGMELEE),
	BIGBUGMELEE = WeaponDefMergeTable(MELEEBASE, BIGBUGMELEE),
})

