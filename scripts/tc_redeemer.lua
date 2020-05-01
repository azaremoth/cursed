include "constants.lua"
include "common.lua"

local base = piece 'base'
local head = piece 'head'
local torso = piece 'torso'
local tail_1 = piece 'tail_1'
local tail_2 = piece 'tail_2'
local tail_3 = piece 'tail_3'
local tail_4 = piece 'tail_4'
local tail_5 = piece 'tail_5'
local gun = piece 'gun'
local emit_gun = piece 'emit_gun'
local emit_summon = piece 'emit_summon'

local GUNFLARE	 = 1024+0
local BOOM	 = 1025+0
local SMOKE	 = 1026+0

--signals
local SIG_AIM1 = 1

function script.Activate()
end

function script.Deactivate()
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

local function RestoreAfterDelay()
	while true do
		Sleep(300)
		idleCount = (idleCount - 300)
		if (idleCount < 1) then
			idleCount = 0
			Turn2( tail_3,  y_axis, 0, 20 )
			Turn2( tail_5,  x_axis, 0, 20 )			
			isaiming = false
		end		
	end
end

function script.Create()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end  
	StartThread( SmokeUnit(torso, SMOKE) )
	StartThread( RestoreAfterDelay )	
end

function script.Shot1 ()
end

function script.QueryWeapon1()
	 return emit_gun
end

function script.AimFromWeapon1() return tail_3 end

function script.AimWeapon1(heading, pitch)
	idleCount = maxIdleCount
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( tail_3, y_axis, heading, 2.5 )		
	Turn( tail_5, x_axis, -pitch, 2.0 )	
	WaitForTurn (tail_3, y_axis)
	WaitForTurn (tail_5, x_axis)
	return true
end

function script.Killed(recentDamage, maxHealth)
	EmitSfx(base, BOOM)
end