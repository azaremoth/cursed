include "constants.lua"

local base = piece 'base'
local hull = piece 'hull'
local gun1 = piece 'gun1'
local gun2 = piece 'gun2'
local wing1 = piece 'wing1'
local wing2 = piece 'wing2'
local engine1 = piece 'engine1'
local engine2 = piece 'engine2'
local emit_gun1 = piece 'emit_gun1'
local emit_gun2 = piece 'emit_gun2'
local emit_thrust1 = piece 'emit_thrust1'
local emit_thrust2 = piece 'emit_thrust2'

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
	if curRate < 1 then
		Turn(wing1, x_axis, math.rad(-90), 5)
		Turn(wing2, x_axis, math.rad(-90), 5)
		Turn(wing1, z_axis, 0, 2)
		Turn(wing2, z_axis, 0, 2)
		Move(wing1, y_axis, -4, 10)
		Move(wing2, y_axis, -4, 10)
	else
		Turn(wing1, x_axis, 0, 8)
		Turn(wing2, x_axis, 0, 8)
		Turn(wing1, z_axis, 0, 2)
		Turn(wing2, z_axis, 0, 2)	
		Move(wing1, y_axis, 0, 15)
		Move(wing2, y_axis, 0, 15)
	end
end

function script.Activate()
	Turn(wing1, z_axis, 0, 2)
	Turn(wing2, z_axis, 0, 2)
end

function script.Deactivate()
	Turn(wing1, z_axis, math.rad(70), 2)
	Turn(wing2, z_axis, math.rad(-70), 2)
end


function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	
	  Hide (wing1)
	  Hide (wing2)	 
	  Hide (engine1)
	  Hide (engine2)	

	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end
	
	  Show (wing1)
	  Show (wing2)	 
	  Show (engine1)
	  Show (engine2)	
	  
	Turn(wing2, z_axis, math.rad(-70))
	Turn(wing1, z_axis, math.rad(70))
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
		Explode(wing2, sfxNone)
		Explode(wing1, sfxNone)
		return 1
	elseif severity < 100 then
		EmitSfx(base, BOOM)
		Explode(wing2, sfxFall + sfxSmoke)
		Explode(wing1, sfxFall + sfxSmoke)
		return 2
	else
		EmitSfx(base, BOOM)
		Explode(wing2, sfxSmoke + sfxExplode)
		Explode(wing1, sfxSmoke + sfxExplode)
		return 3
	end
end