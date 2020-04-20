----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local RIPPER = {
	reloadtime         = 2,	
    avoidFriendly      	= true,
    collideFriendly    	= true,	
}
local RIPPER_BUNKER = {
	reloadtime         = 2,	
    avoidFriendly      	= false,
    collideFriendly    	= false,	
}
local RIPPER_AI = {
	reloadtime         = 1,	
    avoidFriendly      	= false,
    collideFriendly    	= false,	
}
-----------------------------------  BASE CLASS -------------------------------------------
local RIPPERBASE = {
    name               = "Ripper Cannon",  
    avoidFeature       = false,
    collideFeature     = true,
--  General	----------------------------------------------		
	accuracy           = 800,
    areaOfEffect       = 45,
    range              = 650,	
    burnblow           = false,
    collisionSize      = 8,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargeting = 0,
    edgeEffectiveness  = 1,
    energypershot           = 0,
    explosionGenerator = "custom:SMALL_EXPLOSION_PURPLE",
    explosionSpeed     = 65536,
    fireStarter        = 50,
    impulseBoost       = 0,
    impulseFactor      = 1,
    interceptedByShieldType = 1,
    myGravity          = 0.15,
    startVelocity      = 600,
    targetBorder       = 0,
    targetMoveError    = 0.8,
    tolerance          = 500,
    turret             = true,
    weaponAcceleration = 0,
    weaponVelocity     = 600,
	noSelfDamage       = false,
--  Sound	------------------------------------------------	
    soundHit           = "mediumexplosion",
    soundStart         = "heatray_fire5",
    soundHitVolume     = 50,
    soundStartVolume   = 50,
    soundTrigger       = true,
--  Standard Visuals	------------------------------------
    cegtag			   = "RIPPERTrail",	
	RGBColor		   = "1.00 0.25 0.47",	
--	Weaponspecial ------------------------------------------ 
    flightTime         = 1.5,
    model              = "plasma_purple.s3o",
    heightBoostFactor  = 0,
    tracks             = false,
    trajectoryHeight   = 0.65,
    weaponType         = "MissileLauncher",	
------------------------------------------------------------
    damage = {
      default            = 115,
      flyer              = 115,
      heavy              = 115,
      light              = (115*0.75),
    },
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
	RIPPER = WeaponDefMergeTable(RIPPERBASE, RIPPER),
	RIPPER_BUNKER = WeaponDefMergeTable(RIPPERBASE, RIPPER_BUNKER),
	RIPPER_AI = WeaponDefMergeTable(RIPPERBASE, RIPPER_AI),		
})

