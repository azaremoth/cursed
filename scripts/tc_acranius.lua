include "constants.lua"

local base = piece 'base'
local hull = piece 'hull'
local wing1 = piece 'wing1'
local wing2 = piece 'wing2'
local wing1_down = piece 'wing1_down'
local wing2_down = piece 'wing2_down'
local wing1_up = piece 'wing1_up'
local wing2_up = piece 'wing2_up'
local gun = piece 'gun'
local emit_gun = piece 'emit_gun'
local emit_thrust1 = piece 'emit_thrust1'
local emit_thrust2 = piece 'emit_thrust2'

local light_1 = piece 'light_1'
local light_2 = piece 'light_2'
local light_3 = piece 'light_3'
local light_4 = piece 'light_4'
local light_5 = piece 'light_5'

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
	Turn(wing1_down, z_axis, math.rad(30), 2)
	Turn(wing2_down, z_axis, math.rad(-30), 2)	
	Turn(wing1_up, z_axis, math.rad(-30), 2)
	Turn(wing2_up, z_axis, math.rad(30), 2)	
end

function script.Deactivate()
	Turn(wing1_down, z_axis, 0, 2)
	Turn(wing2_down, z_axis, 0, 2)	
	Turn(wing1_up, z_axis, 0, 2)
	Turn(wing2_up, z_axis, 0, 2)		
end

local function Blinking()
	while true do
		Show( light_2 )
		Hide( light_1 )
		Hide( light_3 )
		Hide( light_4 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_3 )
		Hide( light_1 )
		Hide( light_2 )
		Hide( light_4 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_4 )
		Hide( light_1 )
		Hide( light_2 )
		Hide( light_3 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_5 )
		Hide( light_1 )
		Hide( light_2 )
		Hide( light_3 )
		Hide( light_4 )
		Sleep( 200 )
		
		Show( light_4 )
		Hide( light_1 )
		Hide( light_2 )
		Hide( light_3 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_3 )
		Hide( light_1 )
		Hide( light_2 )
		Hide( light_4 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_2 )
		Hide( light_1 )
		Hide( light_3 )
		Hide( light_4 )
		Hide( light_5 )
		Sleep( 200 )
		
		Show( light_1 )
		Hide( light_2 )
		Hide( light_3 )
		Hide( light_4 )
		Hide( light_5 )
		Sleep( 200 )
	end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end
	Turn(wing2, z_axis, math.rad(-70))
	Turn(wing1, z_axis, math.rad(70))
	StartThread( Blinking )	
	StartThread( DamageControl )	
end

local function RestoreAfterDelay()
	Sleep(1000)
    Turn( hull, y_axis, 0, 1 )
	Turn( hull, x_axis, 0, 1 )
	return (0)
end

function script.Shot1 ()
end

function script.QueryWeapon1()
	 return emit_gun
end

function script.AimFromWeapon1() return base end

function script.AimWeapon1(heading, pitch)
		Signal(SIG_AIM1)
		SetSignalMask(SIG_AIM1)
		Turn( hull, y_axis, heading, 2 )
		Turn( hull, x_axis, -pitch, 2 )
		StartThread( RestoreAfterDelay) 
		WaitForTurn( hull, x_axis )
		WaitForTurn( hull, y_axis )
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