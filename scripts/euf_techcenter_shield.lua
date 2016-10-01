local base = piece 'base'
local building = piece 'building'
local radar = piece 'radar'
local pont_dark = piece 'pont_dark'
local pont_glow = piece 'pont_glow'
local emit_beam = piece 'emit_beam'
local top_nuke = piece 'top_nuke'
local ring1 = piece 'ring1'
local ring2 = piece 'ring2'
local ring3 = piece 'ring3'
local ring4 = piece 'ring4'

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
			EmitSfx(emit_beam,BEAM)	
		end
		Sleep(200)
	end
end

function script.Create()
	Hide (top_nuke)
	Hide (pont_dark)
	Hide (ring1)
	Hide (ring2)
	Hide (ring3)
	Hide (ring4)
	
	isactive = false
	Turn2( emit_beam, x_axis, -90 )
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(100)
	end
	StartThread( BeamFX )	
	Spring.UnitScript.Spin ( radar, y_axis, 2)
	isactive = true	
end
	
function script.Activate ( )
	isactive = true
	Spring.UnitScript.Spin ( radar, y_axis, 2)	
	Spring.SetUnitShieldState(unitID, true)
end

function script.Deactivate ( )
	isactive = false
	Spring.UnitScript.StopSpin ( radar, y_axis, 2)	
	Spring.SetUnitShieldState(unitID, false)
end	
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end