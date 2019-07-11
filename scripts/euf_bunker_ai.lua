include "constants.lua"
include "common.lua"

local base = piece 'base'
local bunker = piece 'bunker'
local roof = piece 'roof'
local tubes = piece 'tubes'
local antenne = piece 'antenne'
local turret = piece 'turret'
local turret_pitch = piece 'turret_pitch'
local link = piece 'link'
local fist = piece 'fist'
local emit = piece 'emit'
local emit_groundflash = piece 'emit_groundflash'

local pID

local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local GUNFLARE	 = 1026+0
local GROUNDFLASH	 = 1027+0

function script.Create()
	if NotEnemyAI() then
		Hide(fist)
	end
	local structureheight = ((-40*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	----------------------------------START BUILD CYCLE
	Move( bunker, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( bunker, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( bunker, y_axis, 0, 1000 )
	Sleep(500)
	--------------------------------/END BUILD CYCLE
end

--- weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return bunker
end

function script.AimWeapon1(heading, pitch)
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( turret, y_axis, heading, 20 )
	Turn( turret_pitch, x_axis, -pitch, 20 )
    WaitForTurn( turret, y_axis )
    WaitForTurn( turret_pitch, x_axis )
	return true
end

function script.FireWeapon1()
		EmitSfx( emit, GUNFLARE )
		EmitSfx( emit_groundflash, GROUNDFLASH )
		Sleep(300)
		return(1)
end



function script.Killed(severity, corpsetype, smoketype)
		EmitSfx(base,BOOM)
		return (1)
end