local base = piece 'base' 
local hull = piece 'hull' 
local emit_gun1 = piece 'emit_gun1' 
local emit_gun2 = piece 'emit_gun2' 
local emit_thrust1 = piece 'emit_thrust1' 
local emit_thrust2 = piece 'emit_thrust2' 

local maxhealth = Spring.GetUnitHealth(unitID)

local gun = 1
local moving = false
local GUNFLARE = 1024+0
local EXPLOSION = 1025+0
local BLACKSMOKE = 1026+0
local SIG_AIM1 = 2

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function SmokeUnit()
	while true do
		if (Spring.GetUnitHealth(unitID) / maxhealth) < 0.4 then
			EmitSfx( hull, BLACKSMOKE )
		end
 		Sleep(333)
	end
end

------------------------ ACTIVATION
function script.Create()
	gun = 1
 	moving = false
	StartThread(SmokeUnit)
end

function script.Activate()
	moving = true
end

function script.StopMoving()
 	moving = false
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	if gun <= 0 then
		return emit_gun1 
	else
		return emit_gun2
	end		
end

function script.AimFromWeapon1 ()
	return hull end

function script.AimWeapon1(heading, pitch)
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	return true
end

function script.FireWeapon1()
	gun = gun*(-1)
	return(1)
end
--------------------------------------------

function script.Killed(recentDamage, maxHealth)
	Move( hull, y_axis, -100, 50 )	
	Turn2( hull, x_axis, 50, 100 )	
	Turn2( hull, y_axis, 90, 300 )		
	Sleep(150)
	Turn2( hull, y_axis, 180, 600 )
	Sleep(150)
	Turn2( hull, y_axis, 270, 600 )
	Sleep(150)
	Turn2( hull, y_axis, 0, 300 )	
	Sleep(150)
	EmitSfx( hull, EXPLOSION )
end

