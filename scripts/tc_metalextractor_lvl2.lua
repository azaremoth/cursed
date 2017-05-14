local base = piece 'base' 
local bottom = piece 'bottom'
local tamper = piece 'tamper'
local door_l = piece 'door_l' 
local door_r = piece 'door_r'
local beam_1 = piece 'beam_1' 
local beam_2 = piece 'beam_2' 
local beam_3 = piece 'beam_3' 
local beam_4 = piece 'beam_4' 
local pylon_on = piece 'pylon_on' 
local pylon_off = piece 'pylon_off' 
local center_on = piece 'center_on' 
local center_off = piece 'center_off'

local SIG_OPEN = 1

local BUILDINGFX	 = 1024+0
local SMOKE	 = 1025+0

include "common.lua"


local function Open()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	
	Turn (door_r, z_axis, math.rad(-65), math.rad(120))
	Turn (door_l, z_axis, math.rad(65), math.rad(120))
	WaitForTurn (door_r, z_axis)
	Move (beam_4, y_axis, 35, 10)
	WaitForMove (beam_4, y_axis)
	
	local beamnr = 1

	while true do
		local income = select(1,Spring.GetUnitResources(unitID))
		if income > 0 then
			Spring.UnitScript.Spin (tamper, y_axis, income, math.rad(1))
			Show(center_on)
			Hide(center_off)
			if (beamnr == 1) then
				Show(beam_1)
				Hide(beam_2)
				Hide(beam_3)
				Hide(beam_4)
				Show(pylon_on)
				Hide(pylon_off)
				beamnr = beamnr + 1
			elseif (beamnr == 2) then
				Hide(beam_1)
				Show(beam_2)
				Hide(beam_3)
				Hide(beam_4)	
				beamnr = beamnr + 1
			elseif (beamnr == 3) then
				Hide(beam_1)
				Show(beam_2)
				Hide(beam_3)
				Hide(beam_4)
				Show(pylon_off)
				Hide(pylon_on)			
				beamnr = beamnr + 1
			else
				Hide(beam_1)
				Hide(beam_2)
				Hide(beam_3)
				Show(beam_4)	
				beamnr = 1
			end
		else
			Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))
			Show(center_off)
			Hide(center_on)
			Show(pylon_off)
			Hide(pylon_on)
			Hide(beam_1)
			Hide(beam_2)
			Hide(beam_3)
			Hide(beam_4)			
		end
		Sleep (500)		
	end
end

local function Close()
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	Show(center_off)
	Hide(center_on)
	Show(pylon_off)
	Hide(pylon_on)
	Hide(beam_1)
	Hide(beam_2)
	Hide(beam_3)
	Hide(beam_4)
	Spring.UnitScript.StopSpin (tamper, y_axis, math.rad(5))	
	Move (beam_4, y_axis, 0, 100)
	Move (tamper, y_axis, 0, 100)	
	WaitForMove (beam_4, y_axis)
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
	Hide(beam_1)
	Hide(beam_2)
	Hide(beam_3)
	Hide(beam_4)	
	Hide(pylon_on)		
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
local shatters = {bottom, door_l, door_r}

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
