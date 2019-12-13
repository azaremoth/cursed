----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local BELIALGUN = { 
	name   = "Gattling Gun",
    areaOfEffect       = 16,	
	range              = 550,
	reloadtime         = 0.1,
	accuracy           = 512,
    energypershot      = 5,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot_green.s3o",
    explosionGenerator 	= "custom:BelialGunImpact",	
    soundStart         	= "belial_gun",	
----------------------------------------------------------------------------------
	damage 			   = { default = 26, flyer = 26, heavy = (26*0.75), light = 26, },
}
local DEFENDERGUN = { 
	name   = "Defender Gun",
    areaOfEffect       = 16,	
	range              = 550,
	reloadtime         = 0.13,
	accuracy           = 64,
    energypershot      = 5,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot_green.s3o",
    explosionGenerator 	= "custom:GunImpact",	
    soundStart         	= "defender_shot",	
----------------------------------------------------------------------------------
	damage 			   = { default = 23, flyer = (23*1.5), heavy = (23*0.75), light = 23, },
}
local DEFENDERGUN_NOCOST = { 
	name   = "Defender Gun",
    areaOfEffect       = 16,	
	range              = 550,
	reloadtime         = 0.13,
	accuracy           = 64,
    energypershot      = 0,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot_green.s3o",
    explosionGenerator 	= "custom:GunImpact",	
    soundStart         	= "defender_shot",	
----------------------------------------------------------------------------------
	damage 			   = { default = 23, flyer = (23*2), heavy = (23*0.75), light = 23, },
}
local AATANK_GUN = { 
	name   = "Anti-Air gun",
    areaOfEffect       = 64,	
	range              = 550,
	reloadtime         = 0.12,
	accuracy           = 64,
    energypershot      = 0,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot.s3o",
    explosionGenerator 	= "custom:FLAKImpact",	
    soundStart         	= "flakgun",	
----------------------------------------------------------------------------------
	damage 			   = { default = 21, flyer = (21*2), heavy = (21*0.75), light = 21, },
}
local CRAWLER_AA = { 
	name   = "Anti-Air gun",
    areaOfEffect       = 64,	
	range              = 700,
	reloadtime         = 0.4,
	accuracy           = 64,
    energypershot      = 0,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot_green.s3o",
    explosionGenerator 	= "custom:FLAKImpact",	
    soundStart         	= "flakgun",	
----------------------------------------------------------------------------------
	damage 			   = { default = 113, flyer = (113*1.5), heavy = (113*0.75), light = 133, },
}
local ASSAULT_RIFLE = { 
	name   = "Assault rifle",
    areaOfEffect        = 16,	
	range              = 330,
	reloadtime         = 1.6,
	accuracy           = 128,
    energypershot      = 0,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
----------------------------------------------------------------------------------	
    model              	= "gunshot.s3o",
    explosionGenerator 	= "custom:SMALL_BULLET_FX",	
    soundStart         	= "marine_gunshot",	
----------------------------------------------------------------------------------	
	burst = 5,
	burstrate = 0.075,
	sprayangle = 1024,
----------------------------------------------------------------------------------
	damage 			   = { default = 10, flyer = 10, heavy = (10*0.75), light = 10, },
}
local ASSAULT_RIFLE_BUNKER = { 
	name   = "Assault rifle",
    areaOfEffect        = 16,	
	range              = 330,
	reloadtime         = 1.6,
	accuracy           = 128,
    energypershot      = 0,	
----------------------------------------------------------------------------------	
    avoidFriendly      	= false,
    collideFriendly    	= false,	
----------------------------------------------------------------------------------	
    model              	= "gunshot.s3o",
    explosionGenerator 	= "custom:SMALL_BULLET_FX",	
    soundStart         	= "marine_gunshot",	
----------------------------------------------------------------------------------	
	burst = 5,
	burstrate = 0.075,
	sprayangle = 1024,
----------------------------------------------------------------------------------
	damage 			   = { default = 10, flyer = 10, heavy = (10*0.75), light = 10, },
}

-----------------------------------  BASE CLASS  ---------------------------------
local MGBASE = {
    cylinderTargeting 	= 128,		
    explosionScar      	= false,	
    interceptedByShieldType = 1,
    soundHit           	= "defender_hit",
    soundStartVolume   	= 15,
    soundTrigger       	= true,
    tolerance          	= 3000,
    turret             	= true,
    weaponVelocity     = 1800,	
--	Weaponspecial ------------------------------------------  
	size               	= 5,
	stages 			  	= 0,
	weaponType         	= "Cannon",
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
	BELIALGUN = WeaponDefMergeTable(MGBASE, BELIALGUN),
	DEFENDERGUN = WeaponDefMergeTable(MGBASE, DEFENDERGUN),
	DEFENDERGUN_NOCOST = WeaponDefMergeTable(MGBASE, DEFENDERGUN_NOCOST),	
	AATANK_GUN = WeaponDefMergeTable(MGBASE, AATANK_GUN),
	CRAWLER_AA = WeaponDefMergeTable(MGBASE, CRAWLER_AA),	
	ASSAULT_RIFLE = WeaponDefMergeTable(MGBASE, ASSAULT_RIFLE),
	ASSAULT_RIFLE_BUNKER = WeaponDefMergeTable(MGBASE, ASSAULT_RIFLE_BUNKER),
})

