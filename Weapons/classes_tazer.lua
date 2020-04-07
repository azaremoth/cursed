----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local TAZER_LIGHT = {
    areaOfEffect       		= 16,	
	range                   = 175,
    reloadtime 				= 2.00,
    damage 					= { default = 250, flyer = 250, heavy = 250, light = 250, },
    paralyzetime       		= 15,	
}
local TAZER_LIGHT_MG = {
    areaOfEffect       		= 32,	
	range                   = 300,
    reloadtime 				= 0.33,
    damage 					= { default = 200, flyer = 200, heavy = 200, light = 200, },
    paralyzetime       		= 20,	
}
local TAZER_HEAVY = {
    areaOfEffect       		= 32,	
	range                   = 300,
    reloadtime 				= 2.00,
    damage 					= { default = 500, flyer = 500, heavy = 500, light = 500, },
    paralyzetime       		= 25,	
}
-----------------------------------  BASE CLASS -------------------------------------------
local TAZERBASE = {
    accuracy           = 300,
    burnblow           = true,
    cegTag             = "LICHBOLT",
    coreThickness      = 0,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.05,
    energypershot           = 0,	
    explosionGenerator = "custom:LICHBOLT_EXPLOSION",
    impulseBoost       = 0,
    intensity          = 0.5,
    name               = "Tazer",
    paralyzer          = 1,
    rgbColor           = "1 1 1",
    soundHit           = "null",	
    soundStart         = "paralyser",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 650,
    texture1           = "darkbolt",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 1.8,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 650,
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
	TAZER_LIGHT = WeaponDefMergeTable(TAZERBASE, TAZER_LIGHT),
	TAZER_LIGHT_MG = WeaponDefMergeTable(TAZERBASE, TAZER_LIGHT_MG),	
	TAZER_HEAVY = WeaponDefMergeTable(TAZERBASE, TAZER_HEAVY),
})

