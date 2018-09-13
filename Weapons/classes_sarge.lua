----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local SARGELVL1PISTOL = { damage = { default = 75, flyer = 75, heavy = (75*0.75), light = 75, },}
local SARGELVL2PISTOL = { damage = { default = 90, flyer = 90, heavy = (90*0.75), light = 90, },}
local SARGELVL3PISTOL = { damage = { default = 105, flyer = 105, heavy = (105*0.75), light = 105, },}
local SARGELVL4PISTOL = { damage = { default = 120, flyer = 120, heavy = (120*0.75), light = 120, },}
local SARGELVL5PISTOL = { damage = { default = 135, flyer = 135, heavy = (135*0.75), light = 135, },}

local SARGELVL1CHAINGUN = { damage = { default = 15, flyer = 15, heavy = (15*0.75), light = 15, },}
local SARGELVL2CHAINGUN = { damage = { default = 18, flyer = 18, heavy = (18*0.75), light = 18, },}
local SARGELVL3CHAINGUN = { damage = { default = 21, flyer = 21, heavy = (21*0.75), light = 21, },}
local SARGELVL4CHAINGUN = { damage = { default = 24, flyer = 24, heavy = (24*0.75), light = 24, },}
local SARGELVL5CHAINGUN = { damage = { default = 27, flyer = 27, heavy = (27*0.75), light = 27, },}
local SARGELVL6CHAINGUN = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL7CHAINGUN = { damage = { default = 33, flyer = 33, heavy = (33*0.75), light = 33, },}
local SARGELVL8CHAINGUN = { damage = { default = 36, flyer = 36, heavy = (36*0.75), light = 36, },}
local SARGELVL9CHAINGUN = { damage = { default = 39, flyer = 39, heavy = (39*0.75), light = 39, },}
local SARGELVL10CHAINGUN = { damage = { default = 42, flyer = 42, heavy = (42*0.75), light = 42, },}

local SARGELVL4PLASMAGUN = { damage = { default = 200, flyer = (200*0.33), heavy = 200, light = 200, },}
local SARGELVL5PLASMAGUN = { damage = { default = 224, flyer = (224*0.33), heavy = 224, light = 224, },}
local SARGELVL6PLASMAGUN = { damage = { default = 248, flyer = (248*0.33), heavy = 248, light = 248, },}
local SARGELVL7PLASMAGUN = { damage = { default = 272, flyer = (272*0.33), heavy = 272, light = 272, },}
local SARGELVL8PLASMAGUN = { damage = { default = 296, flyer = (296*0.33), heavy = 296, light = 296, },}
local SARGELVL9PLASMAGUN = { damage = { default = 320, flyer = (320*0.33), heavy = 320, light = 320, },}
local SARGELVL10PLASMAGUN = { damage = { default = 344, flyer = (344*0.33), heavy = 344, light = 344, },}

local SARGELVL6BFG = { damage = { default = 500, flyer = 500, heavy = 500, light = 500, },}
local SARGELVL7BFG = { damage = { default = 575, flyer = 575, heavy = 575, light = 575, },}
local SARGELVL8BFG = { damage = { default = 650, flyer = 650, heavy = 650, light = 650, },}
local SARGELVL9BFG = { damage = { default = 725, flyer = 725, heavy = 725, light = 725, },}
local SARGELVL10BFG = { damage = { default = 800, flyer = 800, heavy = 800, light = 800, },}
-----------------------------------  BASE CLASS CHAINGUN ---------------------------------
local PISTOLBASE = {
    avoidFriendly      	= true,
    collideFriendly    	= true,
    accuracy           	= 1024,
    areaOfEffect       	= 16,
    cylinderTargeting 	= 128,		
    energypershot       = 0,	
    explosionGenerator 	= "custom:SMALL_BULLET_FX",
    explosionScar      	= false,	
    interceptedByShieldType = 1,
    name               	= "Pistol",
    range              	= 350,
    reloadtime         	= .5,
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
	stages 			  	= 0,
	weaponType         	= "Cannon",
}
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
      reloadtime              = 0.4,
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
local BFGBASE = {
      name                    = "Brutal Force Gun,
      accuracy                = 128,
      areaOfEffect            = 512,
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
      reloadtime              = 0.4,
      rgbColor                = "0.1 0.9 0.3",
      rgbColor2               = "0.25 1 0.3",
	  soundHit           	  = "null",
      soundStart              = "heatray_fire",
	  sweepFire		          = false,	  
      thickness               = 5,
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
	SARGELVL1PISTOL = WeaponDefMergeTable(PISTOLBASE, SARGELVL1PISTOL),
	SARGELVL2PISTOL = WeaponDefMergeTable(PISTOLBASE, SARGELVL2PISTOL), 
	SARGELVL3PISTOL = WeaponDefMergeTable(PISTOLBASE, SARGELVL3PISTOL), 
	SARGELVL4PISTOL = WeaponDefMergeTable(PISTOLBASE, SARGELVL4PISTOL), 
	SARGELVL5PISTOL = WeaponDefMergeTable(PISTOLBASE, SARGELVL5PISTOL), 		
	SARGELVL1CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL1CHAINGUN),
	SARGELVL2CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL2CHAINGUN),
	SARGELVL3CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL3CHAINGUN),
	SARGELVL4CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL4CHAINGUN),
	SARGELVL5CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL5CHAINGUN),
	SARGELVL6CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL6CHAINGUN),
	SARGELVL7CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL7CHAINGUN),
	SARGELVL8CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL8CHAINGUN),
	SARGELVL9CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL9CHAINGUN),
	SARGELVL10CHAINGUN = WeaponDefMergeTable(CHAINGUNBASE, SARGELVL10CHAINGUN),		
	SARGELVL4PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL4PLASMAGUN),
	SARGELVL5PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL5PLASMAGUN),
	SARGELVL6PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL6PLASMAGUN),
	SARGELVL7PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL7PLASMAGUN),
	SARGELVL8PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL8PLASMAGUN),
	SARGELVL9PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL9PLASMAGUN),
	SARGELVL10PLASMAGUN = WeaponDefMergeTable(PLASMAGUNBASE, SARGELVL10PLASMAGUN),
	SARGELVL6BFG = WeaponDefMergeTable(BFGBASE, SARGELVL6BFG),
	SARGELVL7BFG = WeaponDefMergeTable(BFGBASE, SARGELVL7BFG),
	SARGELVL8BFG = WeaponDefMergeTable(BFGBASE, SARGELVL8BFG),
	SARGELVL9BFG = WeaponDefMergeTable(BFGBASE, SARGELVL9BFG),
	SARGELVL10BFG = WeaponDefMergeTable(BFGBASE, SARGELVL10BFG),		
})

