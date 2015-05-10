local base = piece 'base'
local emit = piece 'emit'

local BOOM	 = 1024+0
local BEAM	 = 1025+0


--local vars
local isactive

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

-- Walk Motion
local function BeamFX()
	while true do
		if (isactive) then
			EmitSfx(emit,BEAM)	
		end
		Sleep(200)
	end
end

function script.Create()
	isactive = false
	Turn2( emit, x_axis, -90 )
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(100)
	end
	StartThread( BeamFX )	
	isactive = true	
end
	
function script.Activate ( )
	isactive = true
	Spring.SetUnitShieldState(unitID, true)
end

function script.Deactivate ( )
	isactive = false
	Spring.SetUnitShieldState(unitID, false)
end	
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end