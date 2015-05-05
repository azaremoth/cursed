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

local GLOW	 = 1024+0
local longway = 150
local shortway = 60

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

function script.Create()
	Spring.SetUnitAlwaysVisible(unitID)
	Spring.SetUnitNeutral(unitID)
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
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(0)
end

function script.Killed( damage, health )
	return (1)
end