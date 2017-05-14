
local base = piece 'base' 
local bottom = piece 'bottom'
local tamper = piece 'tamper'
local center = piece 'center'
local door_l = piece 'door_l' 
local door_r = piece 'door_r'

local SIG_OPEN = 1

local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local SMOKE	 = 1025+0

include "common.lua"


local function Open()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	
	Turn (door_r, z_axis, math.rad(-120), math.rad(120))
	Turn (door_l, z_axis, math.rad(120), math.rad(120))
	WaitForTurn (door_r, z_axis)
	Move (center, y_axis, 35, 10)
	WaitForMove (center, y_axis)

	local height = 20

	while true do
		local income = select(1,Spring.GetUnitResources(unitID))
		if income > 0 then
			Spring.UnitScript.Spin (tamper, y_axis, income, math.rad(1))
			Move (tamper, y_axis, height, income*10)
			WaitForMove (tamper, y_axis)
			height = 25 - height
		else
			Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))
		end
		Sleep (500)		
	end
end

local function Close()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	Move (center, y_axis, 0, 100)
	Move (tamper, y_axis, 0, 100)	
	WaitForMove (center, y_axis)
	Turn (door_r, z_axis, math.rad(0), math.rad(180))
	Turn (door_l, z_axis, math.rad(0), math.rad(180))
	WaitForTurn (door_r, z_axis)
end

function script.Activate()
	StartThread(Open)
end

function script.Deactivate()
	StartThread(Close)
end


function script.Create()
	----------------------------------START BUILD CYCLE
	local structureheight = ((-40*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( bottom, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( bottom, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( bottom, y_axis, 0, 1000 )
	Sleep(500)
	--------------------------------/END BUILD CYCLE
	StartThread(SmokeUnit, tamper, SMOKE)
	if not Spring.GetUnitIsStunned(unitID) then
		StartThread(Open)
	end
end

local explodables = {door_l, door_r}
local shatters = {bottom, tamper}

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth

	EmitSfx(base,BOOM)
	for i = 1, #explodables do
		Explode (explodables[i], SFX.FALL + SFX.SMOKE)
	end
	if severity < 0.5 then
		return 1
	else
		for i = 1, #shatters do
			Explode (shatters[i], SFX.SHATTER)
		end
		return 2
	end
end
