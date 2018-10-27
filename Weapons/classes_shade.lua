----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local SHADELVL6DRAGON = { damage = { default = 150, flyer = 150, heavy = 150, light = 150, },}
local SHADELVL7DRAGON = { damage = { default = 200, flyer = 200, heavy = 200, light = 200, },}
local SHADELVL8DRAGON = { damage = { default = 250, flyer = 250, heavy = 250, light = 250, },}
local SHADELVL9DRAGON = { damage = { default = 300, flyer = 300, heavy = 300, light = 300, },}
local SHADELVL10DRAGON = { damage = { default = 350, flyer = 350, heavy = 350, light = 350, },}
-----------------------------------  BASE CLASS CHAINGUN ---------------------------------

local DRAGONBASE = {
      name               = "Dragon's Wrath",	  
	  accuracy           = 64,
      areaOfEffect       = 64,
	  commandFire 	     = true,	  
      range              = 350,
	  reloadtime         = 10,	  
	------------------------------------------	  
	  cegTag = "BIGDRAGONFLAMETRAIL",
	  explosiongenerator = "custom:SMALL_EXPLOSION_GREEN2", --SMALL_EXPLOSION_GREEN or DRAGONFLAMEEXPLOSION?
	------------------------------------------
		soundhit = "explosion/ex_large8",
		soundhitwet = "explosion/wet/large_water_explode",
		soundhitwetvolume = 0.5,
		soundstart = "dragoncall",
		soundtrigger = true,
	------------------------------------------
		avoidFeature			= false,
		avoidGround 			= false,
		avoidFriendly      		= false,
		avoidNeutral      		= false, 		
		canAttackGround      	= true,
		collideFriendly    		= false,
		collideFeature    		= false,
	------------------------------------------
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		groundbounce = true,
		bounceRebound = 0, --stick the explosion to ground with 0 vertical component
		waterweapon = false, -- can not pass trough water
		firesubmersed = false, -- but not _fire_ underwater
		impulseboost = 0,
		impulsefactor = 0,
		noexplode = true,
		noselfdamage = true,
		tolerance = 10000,
		turret = true,
		weapontimer = 4.2,
		weapontype = "DGun",
		weaponvelocity = 300,	
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
	SHADELVL6DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL6DRAGON),
	SHADELVL7DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL7DRAGON),
	SHADELVL8DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL8DRAGON),
	SHADELVL9DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL9DRAGON),
	SHADELVL10DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL10DRAGON),		
})

