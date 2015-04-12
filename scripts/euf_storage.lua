local base = piece 'base'
local groundbase = piece 'groundbase'
local door1 = piece 'door1'
local door2 = piece 'door2'
local turret = piece 'turret'
local arm1 = piece 'arm1'
local arm2 = piece 'arm2'
local robohead = piece 'robohead'
local roboclaw1 = piece 'roboclaw1'
local roboclaw2 = piece 'roboclaw2'
local box_16 = piece 'box_16'
local box_17 = piece 'box_17'
local box_18 = piece 'box_18'
local box_19 = piece 'box_19'
local box_20 = piece 'box_20'
local box_25 = piece 'box_25'
local box_27 = piece 'box_27'

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
			Turn2( door1, z_axis, -45, 50 )
			Turn2( door2, z_axis, 45, 50 )
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
			Turn2( door1, z_axis, 0, 30 )
			Turn2( door2, z_axis, 0, 30 )			
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
	Turn2( arm1, z_axis, 50 )	
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( groundbase, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( groundbase, y_axis, 0, 1000 )	
	Turn2( arm1, z_axis, 0 )		
	StartThread( Animation )
end
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	Explode(box_16, SFX.FALL + SFX.NO_HEATCLOUD)		
	Explode(box_17, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_18, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_19, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_20, SFX.FALL + SFX.NO_HEATCLOUD)		
	Explode(box_25, SFX.FALL + SFX.NO_HEATCLOUD)	
	Explode(box_27, SFX.FALL + SFX.NO_HEATCLOUD)		
	return (1)
end