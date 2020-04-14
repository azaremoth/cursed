local base 	= piece 'base'
local egg 	= piece 'egg'
local BUILDINGFX	= 1024+0
local KILLED	 	= 1025+0
local DUST	 		= 1026+0

local x_rotation = 0
local y_rotation = 0
local z_rotation = 0

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do	
		local borednumber = math.random(50)
		if (borednumber > 45) then
			Turn2( egg, y_axis, y_rotation-20, 25 )
			WaitForTurn( egg, y_axis )
			Turn2( egg, y_axis, y_rotation+20, 25 )
			WaitForTurn( egg, y_axis )
			Turn2( egg, y_axis, y_rotation, 25 )
--		elseif (borednumber < 5)then	
--		else 
--			Turn2( egg, y_axis, y_rotation, 5 )
		end
	Sleep(1500)		
	end
end
-----------------------------------------------------------------


function script.Create( )
	x_rotation = math.random(30)
	y_rotation = math.random(180)
	z_rotation = math.random(30)	
	Turn2( egg, x_axis, x_rotation )
	Turn2( egg, y_axis, y_rotation )
	Turn2( egg, z_axis, z_rotation )
	----------------------------------START BUILD CYCLE
	while  GetUnitValue( COB.BUILD_PERCENT_LEFT ) > 0 do
			EmitSfx(egg, BUILDINGFX)
			Sleep(300)
	end
	--------------------------------/END BUILD CYCLE
	StartThread( BoredAnimation )	
end

function script.Killed()
	EmitSfx(egg, KILLED)
	--return 0
end