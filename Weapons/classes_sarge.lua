----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local SARGELVL1PISTOL = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL2PISTOL = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL3PISTOL = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL4PISTOL = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL5PISTOL = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}

local SARGELVL1CHAINGUN = { damage = { default = 10, flyer = 10, heavy = (10*0.75), light = 10, },}
local SARGELVL2CHAINGUN = { damage = { default = 15, flyer = 15, heavy = (15*0.75), light = 15, },}
local SARGELVL3CHAINGUN = { damage = { default = 20, flyer = 20, heavy = (20*0.75), light = 20, },}
local SARGELVL4CHAINGUN = { damage = { default = 25, flyer = 25, heavy = (25*0.75), light = 25, },}
local SARGELVL5CHAINGUN = { damage = { default = 30, flyer = 30, heavy = (30*0.75), light = 30, },}
local SARGELVL6CHAINGUN = { damage = { default = 35, flyer = 35, heavy = (35*0.75), light = 35, },}
local SARGELVL7CHAINGUN = { damage = { default = 40, flyer = 40, heavy = (40*0.75), light = 40, },}
local SARGELVL8CHAINGUN = { damage = { default = 45, flyer = 45, heavy = (45*0.75), light = 45, },}
local SARGELVL9CHAINGUN = { damage = { default = 50, flyer = 50, heavy = (50*0.75), light = 50, },}
local SARGELVL10CHAINGUN = { damage = { default = 55, flyer = 55, heavy = (55*0.75), light = 55, },}

local SARGELVL4PLASMAGUN = { damage = { default = 30, flyer = 30, heavy = 30, light = 30, },}
local SARGELVL5PLASMAGUN = { damage = { default = 42, flyer = 42, heavy = 42, light = 42, },}
local SARGELVL6PLASMAGUN = { damage = { default = 54, flyer = 54, heavy = 54, light = 54, },}
local SARGELVL7PLASMAGUN = { damage = { default = 66, flyer = 66, heavy = 66, light = 66, },}
local SARGELVL8PLASMAGUN = { damage = { default = 78, flyer = 78, heavy = 78, light = 78, },}
local SARGELVL9PLASMAGUN = { damage = { default = 90, flyer = 90, heavy = 90, light = 90, },}
local SARGELVL10PLASMAGUN = { damage = { default = 102, flyer = 102, heavy = 102, light = 102, },}

local SARGELVL6BFG = { damage = { default = 600, flyer = 900, heavy = 600, light = 600, },}
local SARGELVL7BFG = { damage = { default = 700, flyer = 700, heavy = 700, light = 700, },}
local SARGELVL8BFG = { damage = { default = 800, flyer = 800, heavy = 800, light = 800, },}
local SARGELVL9BFG = { damage = { default = 900, flyer = 900, heavy = 900, light = 900, },}
local SARGELVL10BFG = { damage = { default = 1000, flyer = 1000, heavy = 1000, light = 1000, },}
-----------------------------------  BASE CLASS CHAINGUN ---------------------------------
local PISTOLBASE = {
      name               = "Pistol",
	  accuracy           = 512,
      areaOfEffect       = 16,  
      range              = 350,
	  reloadtime         = 0.5,	  
-----------------------------
    avoidFriendly      	= true,
    collideFriendly    	= true,
    cylinderTargeting 	= 128,		
    energypershot       = 0,	
    explosionGenerator 	= "custom:SMALL_BULLET_FX",
    explosionScar      	= false,	
    interceptedByShieldType = 1,
    soundHit           	= "defender_hit",
    soundStart         	= "9mm",
    soundStartVolume   	= 8,
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
      name               = "Chaingun",
	  accuracy           = 1024,
      areaOfEffect       = 16,  
      range              = 350,
	  reloadtime         = 0.1,	  
-----------------------------
    avoidFriendly      	= true,
    collideFriendly    	= true,
    cylinderTargeting 	= 128,		
    energypershot       = 0,	
    explosionGenerator 	= "custom:SMALL_BULLET_FX",
    explosionScar      	= false,	
    interceptedByShieldType = 1,
    soundHit           	= "defender_hit",
    soundStart         	= "chaingun",
    soundStartVolume   	= 30,
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
----------------------------------- BASE CLASSES
local PLASMAGUNBASE = {
      name               = "Plasma Gun",
	  accuracy           = 768,
      areaOfEffect       = 64,  
      range              = 350,
	  reloadtime         = 0.2,	  
-----------------------------
    avoidFriendly      = true,
    burnblow           = false,	  	
	collideFriendly    = true,
    energypershot           = 5,	
    explosionGenerator = "custom:smallblueexp",
    cegTag             = "PLasmaTowerGunProjectileGroundflash",	
    interceptedByShieldType = 1,
	noselfdamage 	= true,		
    rgbColor           = "0.55 0.58 0.94",
    soundHit           = "mediumexplosion",
    soundStart         = "plasma",
    soundStartVolume   = 75,
    texture1           = "blueflare",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 5.00,
    tolerance          = 1500,
    turret             = true,
    weaponType         = "LaserCannon",
    weaponVelocity     = 900, 
}
local BFGBASE = {
      name                    = "Brutal Force Gun",
	  accuracy           = 64,
      areaOfEffect       = 160,
	  commandFire 	     = true,	  
      range              = 350,
	  reloadtime         = 10,	  
-----------------------------
    burnblow           = false,	  
    cegTag             = "MERMEOTH_SHELLFLARE",
    coreThickness      = 0.5,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.03,
    energypershot           = 0,	
    explosionGenerator = "custom:greencannonimpact",
	fallOffRate        = 0.25,
	hardStop           = false,
    impulseBoost       = 0,
    intensity          = 0.5,
    interceptedByShieldType = 1,
	noselfdamage 	= true,	
    rgbColor           = "0.6 1 0.16",
    rgbColor2           = "0.8 1 0.35",
    soundHit           = "cannon_hit4",
    soundStart         = "bfg_shot",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 1000,
    texture1           = "waveball",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 14,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 1000,
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

