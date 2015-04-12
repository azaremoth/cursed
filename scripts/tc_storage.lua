local base = piece 'base'
local rotate1 = piece 'rotate1'
local rotate2 = piece 'rotate2'
local cube1 = piece 'cube1'
local cube2 = piece 'cube2'
local cube3 = piece 'cube3'
local cube4 = piece 'cube4'
local rod = piece 'rod'
local emit1 = piece 'emit1'
local emit2 = piece 'emit2'

local BUILDINGFX	 = 1024+0

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
			Move( cube1, y_axis, 20, 20)
			Move( cube4, y_axis, -20, 20)		
			Sleep(1500)	
			Turn2( cube1, y_axis, 45, 50 )
			Turn2( cube4, y_axis, 45, 50 )
			Sleep(1500)	
			Move( cube1, y_axis, 0, 20)
			Move( cube4, y_axis, 0, 20)		
			Sleep(5000)
			Move( cube1, y_axis, 20, 20)
			Move( cube4, y_axis, -20, 20)	
			Sleep(1500)			
			Turn2( cube1, y_axis, 0, 50 )
			Turn2( cube4, y_axis, 0, 50 )
			Sleep(1500)
			Move( cube1, y_axis, 0, 20)
			Move( cube4, y_axis, 0, 20)	
		elseif (randomnumber < 0.33) then
			Move( cube1, y_axis, 20, 20)
			Move( cube3, y_axis, 20, 20)
			Move( cube2, y_axis, -20, 20)
			Move( cube4, y_axis, -20, 20)		
			Sleep(1500)	
			Turn2( cube1, y_axis, 45, 50 )
			Turn2( cube3, y_axis, 45, 50 )
			Sleep(1500)			
			Move( cube1, y_axis, 0, 20)
			Move( cube3, y_axis, 0, 20)
			Move( cube2, y_axis, 0, 20)
			Move( cube4, y_axis, 0, 20)		
			Sleep(5000)
			Move( cube1, y_axis, -20, 20)
			Move( cube3, y_axis, -20, 20)
			Move( cube2, y_axis, 20, 20)
			Move( cube4, y_axis, 20, 20)		
			Sleep(1500)			
			Turn2( cube1, y_axis, 0, 50 )
			Turn2( cube3, y_axis, 0, 50 )
			Sleep(1500)			
			Move( cube1, y_axis, 0, 20)
			Move( cube3, y_axis, 0, 20)
			Move( cube2, y_axis, 0, 20)
			Move( cube4, y_axis, 0, 20)	
		else 
			Turn2( cube1, y_axis, 180, 100 )
			Turn2( cube2, y_axis, 180, 100 )
			WaitForTurn(cube1, y_axis)
			Sleep(1500)
			Turn2( cube1, y_axis, 0, 100 )
			Turn2( cube2, y_axis, 0, 100 )
			WaitForTurn(cube1, y_axis)
		end
		Sleep(5000)			
	end
end

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(rod,BUILDINGFX)
			Sleep(10)
	end
	Move( rotate1, y_axis, 40)
	Spring.UnitScript.Spin ( rotate1, y_axis, 0.66) 
	Spring.UnitScript.Spin ( rotate2, x_axis, 0.66)
	StartThread( Animation )
	Turn2( emit1, x_axis, 90 )
	Turn2( emit2, x_axis, -90 )
end
	
function script.Killed( damage, health )
	return (1)
end