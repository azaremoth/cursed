local base = piece 'base'
local sack = piece 'sack'
local rotator = piece 'rotator'
local wing1 = piece 'wing1'
local wing2 = piece 'wing2'
local wing3 = piece 'wing3'
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
			Turn2( rotator, y_axis, y_rotation-20, 25 )
			WaitForTurn( rotator, y_axis )
			Turn2( rotator, y_axis, y_rotation+20, 25 )
			WaitForTurn( rotator, y_axis )
			Turn2( rotator, y_axis, y_rotation, 25 )
--		elseif (borednumber < 5)then	
--		else 
--			Turn2( rotator, y_axis, y_rotation, 5 )
		end
	Sleep(1500)		
	end
end
-----------------------------------------------------------------


function script.Create( )
	x_rotation = math.random(30)
	y_rotation = math.random(180)
	z_rotation = math.random(30)	
	Turn2( rotator, x_axis, x_rotation )
	Turn2( rotator, y_axis, y_rotation )
	Turn2( rotator, z_axis, z_rotation )
	----------------------------------START BUILD CYCLE
	while  GetUnitValue( COB.BUILD_PERCENT_LEFT ) > 0 do
			EmitSfx(sack, BUILDINGFX)
			Sleep(300)
	end
	--------------------------------/END BUILD CYCLE
	StartThread( BoredAnimation )	
end

function script.Killed()
	EmitSfx(sack, KILLED)
	--return 0
end