----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local RAIDERLASER = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 64,	
    areaOfEffect       = 32,	
	range              = 400,
    reloadtime 		   = 0.80,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "medlaser_fire",	
	explosionGenerator = "custom:RaiderLaserImpact",	
    damage 					= { default = 160, flyer = 60, heavy = (160*0.75), light = 160, },
}
local SCORPIONLASER = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 64,	
    areaOfEffect       = 32,	
	range              = 400,
    reloadtime 		   = 0.66,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "scorpion_laser",	
	explosionGenerator = "custom:RaiderLaserImpact",	
    damage 					= { default = 100, flyer = 100, heavy = (100*0.75), light = 100, },
}
local LASERGUN = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 64,	
    areaOfEffect       = 32,	
	range              = 330,
    reloadtime 		   = 0.30,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "medlaser_fire",	
	explosionGenerator = "custom:RaiderLaserImpact",	
    damage 					= { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },
}
local LASERGUN_BUNKER = {
    avoidFriendly      = false,
	collideFriendly    = false,
	accuracy           = 64,	
    areaOfEffect       = 32,	
	range              = 330,
    reloadtime 		   = 0.30,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "medlaser_fire",	
	explosionGenerator = "custom:RaiderLaserImpact",	
    damage 					= { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },
}
local BLASTER = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 512,	
    areaOfEffect       = 32,	
	range              = 500,
    reloadtime 		   = 0.20,
    rgbColor           = {0, 1, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "sniper_gunshot",	
	explosionGenerator = "custom:BlasterImpact",	
    damage 					= { default = 60, flyer = 60, heavy = (60*0.75), light = 60, },
}
local SNIPER_RIFLE = {
    avoidFriendly      = true,
	collideFriendly    = true,
	accuracy           = 16,	
    areaOfEffect       = 32,	
	range              = 800,
    reloadtime 		   = 7.00,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "sniper_gunshot",	
	explosionGenerator = "custom:SNIPER_LASER",	
    damage 					= { default = 120, flyer = 120, heavy = 120, light = (120*6.67), },
}
local SNIPER_RIFLE_BUNKER = {
    avoidFriendly      = false,
	collideFriendly    = false,
	accuracy           = 16,	
    areaOfEffect       = 32,	
	range              = 800,
    reloadtime 		   = 7.00,
    rgbColor           = {1, 0, 0},
	rgbColor2 		   = {1, 1, 1},
    soundStart         = "sniper_gunshot",	
	explosionGenerator = "custom:SNIPER_LASER",	
    damage 					= { default = 120, flyer = 120, heavy = 120, light = (120*6.67), },
}
-----------------------------------  BASE CLASS -------------------------------------------
local SHORTBEAMBASE = {
    beamTime           = 0.10,
	beamTTL 		   = 15,
	beamDecay		   = 0.50,
    burnblow           = true,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    fireStarter        = 20,
    impulseBoost       = 0,
    interceptedByShieldType = 1,
    largeBeamLaser     = true,
    laserFlareSize     = 3,
    name               = "Laser Rifle",
    soundHit           = "null",
	soundStartVolume   = 100,	
    soundTrigger       = true,
	sweepFire		   = false,	
    targetMoveError    = 0.4,
    texture1           = "beam1",
    texture2           = "null_texture",
    texture3           = "null_texture",
    texture4           = "flash1",
    thickness          = 4,
    tolerance          = 120,
    turret             = true,
    weaponType         = "BeamLaser",
    weaponVelocity     = 900,
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
	RAIDERLASER = WeaponDefMergeTable(SHORTBEAMBASE, RAIDERLASER),
	SCORPIONLASER = WeaponDefMergeTable(SHORTBEAMBASE, SCORPIONLASER),
	LASERGUN = WeaponDefMergeTable(SHORTBEAMBASE, LASERGUN),
	LASERGUN_BUNKER = WeaponDefMergeTable(SHORTBEAMBASE, LASERGUN_BUNKER),
	BLASTER = WeaponDefMergeTable(SHORTBEAMBASE, BLASTER),
	SNIPER_RIFLE = WeaponDefMergeTable(SHORTBEAMBASE, SNIPER_RIFLE),
	SNIPER_RIFLE_BUNKER = WeaponDefMergeTable(SHORTBEAMBASE, SNIPER_RIFLE_BUNKER),	
})

