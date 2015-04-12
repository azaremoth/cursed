local base = piece 'base'
local building = piece 'building'
local radar = piece 'radar'
local pont = piece 'pont'


local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0

function script.Create()
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( building, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( building, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( building, y_axis, 0, 1000 )
	Sleep(500)
	Spring.UnitScript.Spin ( radar, y_axis, 2) 
end
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end