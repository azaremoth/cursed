local base = piece 'base'
local groundbase = piece 'groundbase'
local turret = piece 'turret'
local arm1 = piece 'arm1'
local arm2 = piece 'arm2'
local robohead = piece 'robohead'
local roboclaw1 = piece 'roboclaw1'
local roboclaw2 = piece 'roboclaw2'
local box_1 = piece 'box_1'
local box_2 = piece 'box_2'
local box_3 = piece 'box_3'
local box_4 = piece 'box_4'
local box_5 = piece 'box_5'
local box_6 = piece 'box_6'
local box_7 = piece 'box_7'

local BUILDINGFX	 = 1024+0
local BOOM	 = 1025+0

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end


local function Animation()
	while true do
		local randomnumber = math.random()
		if (randomnumber > 0.66) then
			Turn2( turret, y_axis, -90, 200 )
			Turn2( arm1, z_axis, 70, 50 )
			Turn2( arm2, z_axis, -50, 50 )	
			Sleep(2000)				
			Spring.UnitScript.Spin ( robohead, x_axis, 20, 10) 
			Turn2( roboclaw1, y_axis, -50, 50 )
			Turn2( roboclaw2, y_axis, 50, 50 )				
			Turn2( arm1, z_axis, 100, 50 )
			Turn2( arm2, z_axis, -30, 50 )	
			Sleep(4000)
			Spring.UnitScript.StopSpin	( robohead, x_axis, 1)
			Turn2( roboclaw1, y_axis, 0, 100 )
			Turn2( roboclaw2, y_axis, 0, 100 )			
			Turn2( arm1, z_axis, 50, 70 )
			Turn2( arm2, z_axis, -30, 70 )
			Sleep(1500)	
			Turn2( arm1, z_axis, 0, 50 )
			Turn2( arm2, z_axis, 30, 50 )
			Turn2( turret, y_axis, 0, 100 )	
			Sleep(2000)	
		elseif (randomnumber < 0.33) then
			Spring.UnitScript.Spin ( robohead, x_axis, 20, 10) 
			Turn2( roboclaw1, y_axis, -70, 50 )
			Turn2( roboclaw2, y_axis, 70, 50 )				
			Turn2( turret, y_axis, -90, 200 )
			Turn2( arm1, z_axis, 70, 50 )
			Turn2( arm2, z_axis, -50, 50 )
			Sleep(2000)
			Turn2( turret, y_axis, -130, 200 )			
			Sleep(2000)
			Turn2( turret, y_axis, -40, 200 )
			Sleep(2500)	
			Turn2( turret, y_axis, -90, 200 )
			Sleep(2000)
			Turn2( arm1, z_axis, 0, 50 )
			Turn2( arm2, z_axis, 30, 50 )
			Turn2( turret, y_axis, 0, 100 )	
			Turn2( roboclaw1, y_axis, 0, 100 )
			Turn2( roboclaw2, y_axis, 0, 100 )
			Spring.UnitScript.StopSpin	( robohead, x_axis, 1)			
			Sleep(2000)
		else 
			Sleep(10000)
		end
		Sleep(5000)			
	end
end

function script.Create()
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( groundbase, y_axis, structureheight)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( groundbase, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( groundbase, y_axis, 0, 1000 )	
--	StartThread( Animation )
end
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	Explode(box_1, SFX.FALL + SFX.NO_HEATCLOUD)		
	Explode(box_2, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_3, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_4, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_5, SFX.FALL + SFX.NO_HEATCLOUD)		
	Explode(box_6, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_7, SFX.FALL + SFX.NO_HEATCLOUD)		
	return (1)
end