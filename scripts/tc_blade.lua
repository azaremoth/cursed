include "constants.lua"


local base = piece 'base'
local hull = piece 'hull'
local rgun = piece 'rgun'
local lgun = piece 'lgun'
local wing1 = piece 'wing1'
local wing2 = piece 'wing2'
local emit_gun1 = piece 'emit_gun1'
local emit_gun2 = piece 'emit_gun2'
local trail1 = piece 'trail1'

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

function script.Activate()
	Turn(wing1, z_axis, 0, 2)
	Turn(wing2, z_axis, 0, 2)	
end

function script.Deactivate()
	Turn(wing1, z_axis, math.rad(-70), 2)
	Turn(wing2, z_axis, math.rad(70), 2)	
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	Turn(wing1, z_axis, math.rad(-70))
	Turn(wing2, z_axis, math.rad(70))	

	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end
	StartThread( DamageControl )
end

function script.Shot1 ()
end

function script.Shot2 ()
end

function script.QueryWeapon1()
	 return emit_gun1
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
		Explode(wing1, sfxNone)
		Explode(wing2, sfxNone)
		return 1
	elseif severity < 100 then
		EmitSfx(base, BOOM)
		Explode(wing1, sfxFall + sfxSmoke)
		Explode(wing2, sfxFall + sfxSmoke)
		return 2
	else
		EmitSfx(base, BOOM)
		Explode(wing1, sfxSmoke + sfxExplode)
		Explode(wing2, sfxSmoke + sfxExplode)
		return 3
	end
end