----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local HOVER_TACHYON = {
    areaOfEffect       		= 48,	
	range                   = 650,
    reloadtime 				= 2.50,
	rgbColor           		= {0.39, 1, 0.84},
	rgbColor2 		   		= {1, 1, 1},	
    explosionGenerator 		= "custom:HOVER_LASER",	
    damage 					= { default = 366, flyer = 366, heavy = 366, light = (366*0.75), },
}
local AGARES_TACHYON = {
    areaOfEffect       		= 48,	
	range                   = 800,
    reloadtime 				= 7,
	rgbColor           		= {0.45, 1, 0.1},
	rgbColor2 		   		= {1, 1, 1},
    explosionGenerator 		= "custom:AGARES_LASER",	
    damage 					= { default = 1300, flyer = 1300, heavy = 1300, light = (1300*0.75), },
}
local SCORPION_TACHYON = {
    areaOfEffect       		= 48,	
	range             		= 400,
    reloadtime 		   		= 0.66,
	rgbColor           		= {0.39, 1, 0.84},
	rgbColor2 		   		= {1, 1, 1},	
    explosionGenerator 		= "custom:HOVER_LASER",		
    damage 					= { default = 100, flyer = 100, heavy = 100, light = (100*0.75), },
}
-----------------------------------  BASE CLASS -------------------------------------------
local BASE = {
    name               = "Tachyon Beam",
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 64,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
	noSelfDamage       = true,	
    soundHit           = "AgaresLaserHit",
    soundStart         = "AgaresLaser",
    soundTrigger       = true,
	sweepFire		   = false,		
    targetMoveError    = 0.33,
    tolerance          = 1500,
    turret             = true,
    weaponVelocity     = 1500,	
	------------------------------------------
    beamTime           = 0.75,
    coreThickness      = 0.5,
    thickness          = 5,	
    largeBeamLaser     = true,
    laserFlareSize     = 4,
	scrollSpeed 	   = 1.5,
	tileLength         = 200,
	pulseSpeed 		   = 2,
    texture1           = "corebeam",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    weaponType         = "BeamLaser",
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
	HOVER_TACHYON = WeaponDefMergeTable(BASE, HOVER_TACHYON),
	AGARES_TACHYON = WeaponDefMergeTable(BASE, AGARES_TACHYON),
	SCORPION_TACHYON = WeaponDefMergeTable(BASE, SCORPION_TACHYON),
})

