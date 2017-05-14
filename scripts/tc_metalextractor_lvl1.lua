
local base = piece 'base' 
local bottom = piece 'bottom'
local tamper = piece 'tamper'
local center = piece 'center'

local SIG_OPEN = 1

local BUILDINGFX	 = 1024+0
local SMOKE	 = 1025+0

include "common.lua"


local function Open()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	
	Move (center, y_axis, 15, 10)
	WaitForMove (center, y_axis)

	while true do
		local income = select(1,Spring.GetUnitResources(unitID))
		if income > 0 then
			Spring.UnitScript.Spin (tamper, y_axis, income, math.rad(1))
		else
			Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))
		end
		Sleep (500)		
	end
end

local function Close()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	Spring.UnitScript.Spin (tamper, y_axis, income, math.rad(1))	
	Move (center, y_axis, 0, 50)
	WaitForMove (center, y_axis)
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

local explodables = {tamper}
local shatters = {bottom}

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth

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
