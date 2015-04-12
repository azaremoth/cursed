include "constants.lua"


local base = piece 'base'
local hull = piece 'hull'
local trail1 = piece 'trail1'

local BOOM	 = 1024+0
local SMOKE	 = 1025+0



local function DamageControl()
	while true do
	health = Spring.GetUnitHealth(unitID)
	if health < 90 then
		EmitSfx(hull, SMOKE)
	end
	Sleep(500)		
	end
end

function script.Activate()
end

function script.Deactivate()
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end
	StartThread( DamageControl )
end

function script.Killed(recentDamage, maxHealth)
	EmitSfx(base, BOOM)
	return 3
end