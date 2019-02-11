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

local modOptions = Spring.GetModOptions()
local campaignBattleID = tonumber(modOptions.singleplayercampaignbattleid)
	
local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function MoveUp()
	Sleep(300)
	Move(rotator, y_axis, 1000, 50 )
	Sleep(300)
	Move(rotator, y_axis, 3000, 100 )
	Sleep(200)	
	Move(rotator, y_axis, 5000, 200 )
end


local function HideAll()
	Sleep(10000)
	Hide(hull)
	Hide(flengine)
	Hide(frengine)
	Hide(rlengine)
	Hide(rrengine)
	Hide(rdoor)
	Hide(ldoor)	
end

local function ShowAll()
	Show(hull)
	Show(flengine)
	Show(frengine)
	Show(rlengine)
	Show(rrengine)
	Show(rdoor)
	Show(ldoor)	
end

local function UnitSpawner()
	Sleep(2000)
	if campaignBattleID == 1 then
		local unitOne = Spring.CreateUnit("euf_marine", x-30, y, z-30, 0, teamID)
		local unitTwo = Spring.CreateUnit("euf_marine", x-30, y, z+30, 0, teamID)
		local unitThr = Spring.CreateUnit("euf_marine", x+30, y, z-30, 0, teamID)
		local unitFou = Spring.CreateUnit("euf_marine", x+30, y, z+30, 0, teamID)
	elseif campaignBattleID == 3 then
		local unitOne = Spring.CreateUnit("euf_marine", x-30, y, z-30, 0, teamID)
		local unitTwo = Spring.CreateUnit("euf_marine", x-30, y, z+30, 0, teamID)
		local unitThr = Spring.CreateUnit("euf_marine", x+30, y, z-30, 0, teamID)
		local unitFou = Spring.CreateUnit("euf_marine", x+30, y, z+30, 0, teamID)
		local unitFiv = Spring.CreateUnit("euf_scoutdrone", x+40, y, z-40, 0, teamID)
		local unitSix = Spring.CreateUnit("euf_constructor", x+40, y, z+40, 0, teamID)			
	else
		local unitOne = Spring.CreateUnit("euf_marine", x-30, y, z-30, 0, teamID)
		local unitTwo = Spring.CreateUnit("euf_marine", x-30, y, z+30, 0, teamID)
		local unitThr = Spring.CreateUnit("euf_marine", x+30, y, z-30, 0, teamID)
		local unitFou = Spring.CreateUnit("euf_marine", x+30, y, z+30, 0, teamID)	
		local unitFiv = Spring.CreateUnit("euf_marine", x+40, y, z-40, 0, teamID)
		local unitSix = Spring.CreateUnit("euf_marine", x+40, y, z+40, 0, teamID)		
	end
	Sleep(2000)
end

local function Landing()
	while true do
		Move(rotator, y_axis, 1000 )			
		Turn2(rotator, x_axis, 80)
		Turn2(flengine, x_axis, 0)
		Turn2(frengine, x_axis, 0)
		Turn2(rlengine, x_axis, 0)
		Turn2(rrengine, x_axis, 0)		
		
		ShowAll()
		Turn2(rotator, x_axis, 0, 40)
		Move(rotator, y_axis, 0, 500 )
		
		Sleep(2000)
		EmitSfx(base,LANDING)		
		Sleep(2000)
		
		StartThread( HideAll )
		StartThread( MoveUp )		
		Turn2(flengine, x_axis, 50, 60)
		Turn2(frengine, x_axis, 50, 60)
		Turn2(rlengine, x_axis, 50, 60)
		Turn2(rrengine, x_axis, 50, 60)		
		
		Turn2(rotator, x_axis, -20, 10)
		Sleep(400)
		Turn2(rotator, x_axis, -40, 15)
		Sleep(300)	
		Turn2(rotator, x_axis, -60, 20)
		Sleep(200)	
		Turn2(rotator, x_axis, -80, 25)
		Sleep(9100)	
		Spring.DestroyUnit(unitID, false, true)	
	end
end

function script.Create()
	Hide(hull)
	Hide(flengine)
	Hide(frengine)
	Hide(rlengine)
	Hide(rrengine)
	Hide(rdoor)
	Hide(ldoor)	
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	StartThread( Landing )
	StartThread( UnitSpawner )		
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end

function script.Killed(severity, corpsetype, smoketype)
		EmitSfx(base,BOOM)
		return (1)
end