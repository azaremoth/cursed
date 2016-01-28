include "constants.lua"

local moving

local BOOM	 = 1024+0
local SMOKE	 = 1025+0


--signals
local SIG_Aim = 1
local SIG_Aim2 = 4


local function DamageControl()
	while true do
	health = Spring.GetUnitHealth(unitID)
	if health < 200 then
		EmitSfx(base, SMOKE)
	end
	Sleep(500)		
	end
end

function script.MoveRate(curRate)
end

function script.Activate()
end

function script.Deactivate()
end


function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
end

function script.Shot1 ()
end

function script.Shot2 ()
end

function script.QueryWeapon1()
end

function script.QueryWeapon2()
	 return emit_gun2
end

function script.AimFromWeapon1() return base end

function script.AimFromWeapon2() return base end

function script.AimWeapon1(heading, pitch)
	return true
end

function script.AimWeapon2(heading, pitch)
	return true
end

function script.Killed(recentDamage, maxHealth)
	local severity = (recentDamage/maxHealth) * 100
	if severity < 50 then
		EmitSfx(base, BOOM)
		return 1
	elseif severity < 100 then
		EmitSfx(base, BOOM)
		return 2
	else
		EmitSfx(base, BOOM)
		return 3
	end
end