include "constants.lua"

local base = piece 'base'
local hull = piece 'hull'
local engine1 = piece 'engine1'
local engine2 = piece 'engine2'
local emit_gun1 = piece 'emit_gun1'
local emit_thrust1 = piece 'emit_thrust1'
local emit_thrust2 = piece 'emit_thrust2'

local BOOM	 = 1024+0
local SMOKE	 = 1025+0

--signals
local SIG_Aim = 1

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

function script.Shot1 ()
end

function script.QueryWeapon1()
	 return emit_gun1
end

function script.AimFromWeapon1() return base end

function script.AimWeapon1(heading, pitch)
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