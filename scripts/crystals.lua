local base = piece 'base'
local biggem = piece 'biggem'
local gem_01 = piece 'gem_01'
local gem_02 = piece 'gem_02'
local gem_03 = piece 'gem_03'
local gem_04 = piece 'gem_04'
local gem_05 = piece 'gem_05'
local gem_06 = piece 'gem_06'
local gem_07 = piece 'gem_07'
local gem_08 = piece 'gem_08'
local gem_09 = piece 'gem_09'
local rotator1 = piece 'rotator1'
local rotator2 = piece 'rotator2'
local rotator3 = piece 'rotator3'

local x = 0
local y = 0
local z = 0
local mokeyradius="captureradius"
local CenterRadius = tonumber(Spring.GetModOptions()[mokeyradius])

local GLOW	 = 1024+0
local longway = 150
local shortway = 60
local moveout = 75
local movein = 150

local GaiaTeamID = Spring.GetGaiaTeamID()

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function Animation_small()
	while true do
		Move( rotator1, y_axis, longway*0.6, 30)
		Move( rotator2, y_axis, longway*0.6, 30)
		Move( rotator3, y_axis, longway*0.6, 30)		
		WaitForMove(rotator1, y_axis)
		Move( rotator1, y_axis, longway, 30)
		Move( rotator2, y_axis, longway, 30)
		Move( rotator3, y_axis, longway, 30)
		WaitForMove(rotator1, y_axis)
		Move( rotator1, y_axis, longway*0.6, 30)
		Move( rotator2, y_axis, longway*0.6, 30)
		Move( rotator3, y_axis, longway*0.6, 30)	
		WaitForMove(rotator1, y_axis)
		Move( rotator1, y_axis, -longway*0.6, 30)
		Move( rotator2, y_axis, -longway*0.6, 30)
		Move( rotator3, y_axis, -longway*0.6, 30)		
		WaitForMove(rotator1, y_axis)
		Move( rotator1, y_axis, -longway, 30)
		Move( rotator2, y_axis, -longway, 30)
		Move( rotator3, y_axis, -longway, 30)		
		WaitForMove(rotator1, y_axis)
		Move( rotator1, y_axis, -longway*0.6, 30)
		Move( rotator2, y_axis, -longway*0.6, 30)
		Move( rotator3, y_axis, -longway*0.6, 30)		
		WaitForMove(rotator1, y_axis)
	end
end

local function Animation_big()
	while true do
		Move( biggem, y_axis, shortway*0.6, 10)
		WaitForMove(biggem, y_axis)
		Move( biggem, y_axis, shortway, 10)
		WaitForMove(biggem, y_axis)
		Move( biggem, y_axis, shortway*0.6, 10)
		WaitForMove(biggem, y_axis)
		Move( biggem, y_axis, -shortway*0.6, 10)		
		WaitForMove(biggem, y_axis)
		Move( biggem, y_axis, -shortway, 10)		
		WaitForMove(biggem, y_axis)
		Move( biggem, y_axis, -shortway*0.6, 10)	
		WaitForMove(biggem, y_axis)
	end
end

local function UnitsAreClose()
	while true do
		local UnitsAround = Spring.GetUnitsInCylinder(x,z,CenterRadius)
		local UnitsAreArount = false
		for _,cUnitID in ipairs(UnitsAround) do
			local cUnitTeamID = Spring.GetUnitTeam(cUnitID)
			if (cUnitTeamID ~= GaiaTeamID) then
				UnitsAreArount = true
			end
		end
		if (UnitsAreArount == true) then
			Spring.UnitScript.Spin ( rotator1, y_axis, -2, 20)
			Spring.UnitScript.Spin ( rotator2, y_axis, 3, 20)
			Spring.UnitScript.Spin ( rotator3, y_axis, -3, 20)	
			Move( gem_01, x_axis, CenterRadius, moveout)
			Move( gem_02, z_axis, CenterRadius, moveout)
			Move( gem_03, x_axis, -CenterRadius, moveout)
			Move( gem_04, z_axis, -CenterRadius, moveout)
			Move( gem_05, x_axis, CenterRadius, moveout)
			Move( gem_06, z_axis, CenterRadius, moveout)
			Move( gem_07, x_axis, -CenterRadius, moveout)
			Move( gem_08, z_axis, -CenterRadius, moveout)
			Move( gem_09, x_axis, CenterRadius, moveout)
		else
			Spring.UnitScript.Spin ( rotator1, y_axis, -4, 20)	
			Spring.UnitScript.Spin ( rotator2, y_axis, 7, 20)
			Spring.UnitScript.Spin ( rotator3, y_axis, -6, 20)			
			Move( gem_01, x_axis, 0, movein)
			Move( gem_02, z_axis, 0, movein)
			Move( gem_03, x_axis, 0, movein)
			Move( gem_04, z_axis, 0, movein)
			Move( gem_05, x_axis, 0, movein)
			Move( gem_06, z_axis, 0, movein)
			Move( gem_07, x_axis, 0, movein)
			Move( gem_08, z_axis, 0, movein)
			Move( gem_09, x_axis, 0, movein)			
		end
		Sleep(1000)
	end
end

function script.Create()
	Spring.SetUnitAlwaysVisible(unitID, true)
	Spring.SetUnitNeutral(unitID, true)
	Spring.SetUnitNoSelect(unitID, true)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	Spring.SetUnitStealth(unitID, true)
	Spring.UnitScript.Spin ( biggem, y_axis, 0.66) 
	Spring.UnitScript.Spin ( gem_01, y_axis, 2*math.random()) 
	Spring.UnitScript.Spin ( gem_02, y_axis, -2*math.random())
	Spring.UnitScript.Spin ( gem_03, y_axis, 2*math.random())
	Spring.UnitScript.Spin ( gem_04, y_axis, -2*math.random())
	Spring.UnitScript.Spin ( gem_05, y_axis, 2*math.random())
	Spring.UnitScript.Spin ( gem_06, y_axis, -2*math.random())
	Spring.UnitScript.Spin ( gem_07, y_axis, 2*math.random())
	Spring.UnitScript.Spin ( gem_08, y_axis, -2*math.random())
	Spring.UnitScript.Spin ( gem_09, y_axis, 2*math.random())	
	Spring.UnitScript.Spin ( rotator1, y_axis, -4)	
	Spring.UnitScript.Spin ( rotator2, y_axis, 7)
	Spring.UnitScript.Spin ( rotator3, y_axis, -6)	
	StartThread( Animation_small )
	StartThread( Animation_big )
	x, y, z = Spring.GetUnitPosition(unitID) 	
	StartThread( UnitsAreClose )
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(0)
end

function script.Killed( damage, health )
	return (1)
end