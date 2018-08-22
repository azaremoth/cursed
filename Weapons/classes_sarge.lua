----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local SARGELVL1CHAINGUN = { damage = { default = 15, flyer = 15, heavy = (15*0.75), light = 15, },}
local SARGELVL2CHAINGUN = { damage = { default = 20, flyer = 20, heavy = (20*0.75), light = 20, },}
local SARGELVL3CHAINGUN = { damage = { default = 24, flyer = 24, heavy = (24*0.75), light = 24, },}
local SARGELVL4CHAINGUN = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL5CHAINGUN = { damage = { default = 38, flyer = 38, heavy = (38*0.75), light = 38, },}

local SARGELVL1PLASMAGUN = { damage = { default = 50, flyer = (50*0.33), heavy = 50, light = 50, },}
local SARGELVL2PLASMAGUN = { damage = { default = 63, flyer = (63*0.33), heavy = 63, light = 63, },}
local SARGELVL3PLASMAGUN = { damage = { default = 80, flyer = (80*0.33), heavy = 80, light = 80, },}
-----------------------------------  BASE CLASS CHAINGUN ---------------------------------
local CHAINGUNBASE = {
    avoidFriendly      	= true,
	collideFriendly    	= true,
    accuracy           	= 1024,
    areaOfEffect       	= 16,
	cylinderTargeting 	= 128,		
    energypershot       = 0,	
    explosionGenerator 	= "custom:SMALL_BULLET_FX",
	explosionScar      	= false,	
    interceptedByShieldType = 1,
    name               	= "Chaingun",
    range              	= 350,
    reloadtime         	= .1,
    soundHit           	= "defender_hit",
    soundStart         	= "chaingun",
    soundStartVolume   	= 15,
    soundTrigger       	= true,
    tolerance          	= 3000,
    turret             	= true,
    weaponVelocity     	= 1600,
--	Weaponspecial ------------------------------------------
    model              	= "gunshot.s3o",    
	size               	= 5,
	stages 			   	= 0,
	weaponType         	= "Cannon",
}
-----------------------------------  BASE CLASS PLASMA ---------------------------------
local PLASMAGUNBASE = {
      name                    = "Plasma Cannon",
      accuracy                = 512,
      areaOfEffect            = 20,
      cegTag                  = "HEATRAY_CEG",
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,
      duration                = 0.3,
      dynDamageExp            = 1,
      dynDamageInverted       = false,
      explosionGenerator      = "custom:SargePlasmaImpact",
      fallOffRate             = 1,
      fireStarter             = 90,
      heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      lodDistance             = 10000,
      proximityPriority       = 4,
      range                   = 350,
      reloadtime              = 0.1,
      rgbColor                = "0.1 0.9 0.9",
      rgbColor2               = "0.25 1 0.9",
	  soundHit           	  = "null",
      soundStart              = "heatray_fire",
	  sweepFire		          = false,	  
      thickness               = 3,
      tolerance               = 5000,
      turret                  = true,
      weaponType              = "LaserCannon",
      weaponVelocity          = 500,
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
	SARGELVL1CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL1CHAINGUN),
	SARGELVL2CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL2CHAINGUN),
	SARGELVL3CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL3CHAINGUN),
	SARGELVL4CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL4CHAINGUN),
	SARGELVL5CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL5CHAINGUN),
	SARGELVL1PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL1PLASMAGUN),
	SARGELVL2PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL2PLASMAGUN),
	SARGELVL3PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL3PLASMAGUN),	
})

