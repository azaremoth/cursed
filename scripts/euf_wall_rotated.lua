local base = piece 'base'
local sperre = piece 'sperre'
local wirre = piece 'wirre'
local BUILDINGFX	 = 1024+0

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(sperre,BUILDINGFX)
			Sleep(10)
	end
end
	
function script.Killed( damage, health )
	return (1)
end