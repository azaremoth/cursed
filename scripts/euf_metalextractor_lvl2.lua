local base = piece 'base' 
local bottom = piece 'bottom'
local tamper = piece 'tamper'
local center = piece 'center'
local leg_1 = piece 'leg_1' 
local leg_1d = piece 'leg_1d' 
local leg_1u = piece 'leg_1u' 
local leg_2 = piece 'leg_2' 
local leg_2d = piece 'leg_2d' 
local leg_2u = piece 'leg_2u' 
local leg_3 = piece 'leg_3' 
local leg_3d = piece 'leg_3d' 
local leg_3u = piece 'leg_3u' 

local SIG_OPEN = 1

local BUILDINGFX	 = 1024+0
local SMOKE	 = 1025+0

include "common.lua"


local function Open()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	
	local statenr = 1

	while true do
		local income = select(1,Spring.GetUnitResources(unitID))
		if income > 0 then
			Spring.UnitScript.Spin (tamper, y_axis, income, math.rad(1))
			if (statenr > 0) then
				Turn (leg_1d, z_axis, math.rad(10), math.rad(income*16))
				Turn (leg_2d, z_axis, math.rad(10), math.rad(income*16))
				Turn (leg_3d, z_axis, math.rad(10), math.rad(income*16))			
				Turn (leg_1u, z_axis, math.rad(20), math.rad(income*16))				
				Turn (leg_2u, z_axis, math.rad(20), math.rad(income*16))	
				Turn (leg_3u, z_axis, math.rad(20), math.rad(income*16))			
				Move (center, y_axis, 14, income*10)
			else
				Turn (leg_1d, z_axis, math.rad(5), math.rad(income*14))
				Turn (leg_2d, z_axis, math.rad(5), math.rad(income*14))
				Turn (leg_3d, z_axis, math.rad(5), math.rad(income*14))			
				Turn (leg_1u, z_axis, math.rad(0), math.rad(income*14))				
				Turn (leg_2u, z_axis, math.rad(0), math.rad(income*14))	
				Turn (leg_3u, z_axis, math.rad(0), math.rad(income*14))			
				Move (center, y_axis, 1, income*10)
			end
			WaitForMove (center, y_axis)
			statenr = (statenr*(-1))
		else
			Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))
		end
		Sleep (500)		
	end
end

local function Close()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))
	Move (center, y_axis, 0, 100)
	WaitForMove (center, y_axis)
end

function script.Activate()
	StartThread(Open)
end

function script.Deactivate()
	StartThread(Close)
end


function script.Create()
	Turn (leg_2, y_axis, math.rad(120), math.rad(500))
	Turn (leg_3, y_axis, math.rad(240), math.rad(500))

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

local explodables = {leg_1u, leg_2u, leg_3u}
local shatters = {bottom, tamper}

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
