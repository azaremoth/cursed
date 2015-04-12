local base = piece 'base'
local tank = piece 'tank'
local drill1 = piece 'drill1'
local drill2 = piece 'drill2'
local tail1 = piece 'tail1'
local tail2 = piece 'tail2'
local tail3 = piece 'tail3'
local tail4 = piece 'tail4'
local tail5 = piece 'tail5'
local gun = piece 'gun'
local rwheel1 = piece 'rwheel1'
local rwheel2 = piece 'rwheel2'
local rwheel3 = piece 'rwheel3'
local rwheel4 = piece 'rwheel4'
local lwheel1 = piece 'lwheel1'
local lwheel2 = piece 'lwheel2'
local lwheel3 = piece 'lwheel3'
local lwheel4 = piece 'lwheel4'
local rtracks1 = piece 'rtracks1'
local rtracks2 = piece 'rtracks2'
local rtracks3 = piece 'rtracks3'
local ltracks1 = piece 'ltracks1'
local ltracks2 = piece 'ltracks2'
local ltracks3 = piece 'ltracks3'
local dust1 = piece 'dust1'
local dust2 = piece 'dust2'
local emit_groundflash = piece 'emit_groundflash'
local emit = piece 'emit'
local drilldust1 = piece 'drilldust1'
local drilldust2 = piece 'drilldust2'
local drilldust3 = piece 'drilldust3'
local exmark = piece 'exmark'

local SIG_AIM1 = 2
local DIRT = 1024+0

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function GoDown()
	Turn2( tank, x_axis, 90, 50)
	Move( base, y_axis, -80, 15)
	Move( exmark, y_axis, 80, 15)	

	Spring.UnitScript.EmitSfx ( drilldust1, DIRT )	
	Spring.UnitScript.EmitSfx ( drilldust2, DIRT )	
	Spring.UnitScript.EmitSfx ( drilldust3, DIRT )	
	
	Move( tail1, z_axis, 100, 40)	
	Turn2( tail2, x_axis, -45, 75)
	Turn2( tail3, x_axis, -45, 75)
	Turn2( tail4, x_axis, -45, 75)
	Turn2( tail5, x_axis, -45, 75)	
	
	Sleep(500)
	Spring.UnitScript.EmitSfx ( drilldust1, DIRT )	
	Spring.UnitScript.EmitSfx ( drilldust2, DIRT )	
	Spring.UnitScript.EmitSfx ( drilldust3, DIRT )		
	Sleep(500)
	
	Spring.SetUnitCloak(unitID, 2, true)
	Spring.SetUnitStealth(unitID, true)
	Spring.SetUnitSensorRadius(unitID, 'los', 0)
	Spring.SetUnitSensorRadius(unitID, 'airLos', 0)
end

function script.Create()
	Spring.UnitScript.Spin ( drill1, x_axis, 60) 
	Spring.UnitScript.Spin ( drill2, x_axis, 60)
	Spring.UnitScript.Spin ( exmark, y_axis, 5) 
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(100)
	end
	Spring.SetUnitBlocking(unitID, false, false)	
	GoDown()
end

--weapon 1 -------------------------------------------------------------------weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return exmark
end

function script.AimFromWeapon1 ()
	return exmark
end

function script.AimWeapon1(heading, pitch)
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
		Sleep(200)	
	return true
end

function script.FireWeapon1()
		Sleep(300)
		return(1)
end

function script.Killed( damage, health )
	Spring.UnitScript.EmitSfx ( base, DIRT )	
	return 2
end