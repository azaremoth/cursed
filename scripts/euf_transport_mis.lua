local base = piece 'base'
local rotator = piece 'rotator'
local hull = piece 'hull'
local flengine = piece 'flengine'
local frengine = piece 'frengine'
local rlengine = piece 'rlengine'
local rrengine = piece 'rrengine'
local rdoor = piece 'rdoor'
local ldoor = piece 'ldoor'
local transportpoint = piece 'transportpoint'
local transportpoint1 = piece 'transportpoint1'
local transportpoint2 = piece 'transportpoint2'
local transportpoint3 = piece 'transportpoint3'
local transportpoint4 = piece 'transportpoint4'
local transportpoint5 = piece 'transportpoint5'
local transportpoint6 = piece 'transportpoint6'
local thrust1 = piece 'thrust1'
local thrust2 = piece 'thrust2'
local thrust3 = piece 'thrust3'
local dthrust1 = piece 'dthrust1'
local dthrust2 = piece 'dthrust2'
local dthrust3 = piece 'dthrust3'
local dthrust4 = piece 'dthrust4'

local pID, moving, restore_delay

local BOOM	 = 1024+0
local LANDING	 = 1025+0
local x, y, z = Spring.GetUnitPosition(unitID)
local teamID = Spring.GetUnitTeam(unitID)
	
local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

function HideAll()
	Sleep(4000)
	Hide(hull)
	Hide(flengine)
	Hide(frengine)
	Hide(rlengine)
	Hide(flengine)
	Hide(rrengine)
	Hide(rdoor)
	Hide(ldoor)	
end

function ShowAll()
	Show(hull)
	Show(flengine)
	Show(frengine)
	Show(rlengine)
	Show(flengine)
	Show(rrengine)
	Show(rdoor)
	Show(ldoor)	
end

function Landscript()
--	while true do
		Sleep(500)
		Turn2(rotator, x_axis, 40)
		Turn2(hull, x_axis, 30)	
		ShowAll()
		Turn2(hull, x_axis, 0, 50)	
		Turn2(rotator, x_axis, 0, 50)
		WaitForTurn(rotator, x_axis )
		Spring.CreateUnit("euf_marine", x-40,y,z-40, math.random(3), teamID)
		Spring.CreateUnit("euf_marine", x+40,y,z-40, math.random(3), teamID)
		Spring.CreateUnit("euf_marine", x-40,y,z+40, math.random(3), teamID)
		Spring.CreateUnit("euf_marine", x+40,y,z+40, math.random(3), teamID)
		Sleep(2000)
		Turn2(rotator, x_axis, -60, 20)
		Turn2(hull, x_axis, -30, 50)
		HideAll()
		WaitForTurn(rotator, x_axis )	
--	end
end

function script.Create()
	HideAll()
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	Landscript()
end

function script.Killed(severity, corpsetype, smoketype)
		EmitSfx(base,BOOM)
		return (1)
end