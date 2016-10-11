local base = piece "base"
local altar = piece "altar"
local girl = piece "girl"
local buildpoint = piece "buildpoint"

local SPIKES	 = 1024+0
local BOOM	 = 1025+0
local buildingFX	 = 1026+0

function script.Create()
	Hide (girl)
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( altar, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( altar, y_axis, outofground, 200 )
		EmitSfx(base,buildingFX)
		Sleep(100)
	end
	Move( altar, y_axis, 0, 1000 )
	Move( buildpoint, y_axis, 10000, 10000 )	
	Sleep(500)
end


--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return buildpoint
end

function script.AimFromWeapon1 ()
	return buildpoint	
end

function script.AimWeapon1(heading, pitch)
    return (1)
end

function script.Shot1()
	return (0)
end

function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end