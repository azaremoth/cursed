--#include "basic_spring_stuff.h"

local base = piece 'base'
local bunker = piece 'bunker'
local roof = piece 'roof'
local tubes = piece 'tubes'
local antenne = piece 'antenne'
local barrel1 = piece 'barrel1'
local barrel2 = piece 'barrel2'
local container = piece 'container'
local container2 = piece 'container2'
local container3 = piece 'container3'
local turret = piece 'turret'
local link = piece 'link'
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0

local x, y, z
local position = 0
local maxunitsinbunker = 4
local dropheight = 20
local realeasedistance = 85


function script.TransportPickup ( passengerID )
	UnitScript.AttachUnit ( link, passengerID )
end

function script.bunkerdrop ( ) 
	for i,uid in pairs(Spring.GetUnitIsTransporting(unitID)) do
		Spring.UnitScript.DropUnit(uid)
		if position == 0 then Spring.SetUnitPosition(uid, x+realeasedistance, y+dropheight, z-realeasedistance) end
		if position == 1 then Spring.SetUnitPosition(uid, x+realeasedistance, y+dropheight, z) end
		if position == 2 then Spring.SetUnitPosition(uid, x+realeasedistance, y+dropheight, z+realeasedistance) end
		if position == 3 then Spring.SetUnitPosition(uid, x, y+dropheight, z+realeasedistance) end
		if position == 4 then Spring.SetUnitPosition(uid, x-realeasedistance, y+dropheight, z+realeasedistance) end
		if position == 5 then Spring.SetUnitPosition(uid, x-realeasedistance, y+dropheight, z) end
		if position == 6 then Spring.SetUnitPosition(uid, x-realeasedistance, y+dropheight, z-realeasedistance) end
		if position > 6 then Spring.SetUnitPosition(uid, x, y+dropheight, z-realeasedistance) end
		Spring.SetUnitBlocking(uid, true, true)
		Spring.SetUnitVelocity(uid, 0, 0, 0)
	end
	if position > 6 then
		position =0
	else
		position = position + 1
	end
end 
	
function script.Create()
	x, y, z = Spring.GetUnitPosition(unitID)
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
	Spring.UnitScript.Spin ( turret, y_axis, 2) 	
	Sleep(500)
	--------------------------------/END BUILD CYCLE
end

function script.Killed(severity, corpsetype, smoketype)
		EmitSfx(base,BOOM)
		return (1)
end