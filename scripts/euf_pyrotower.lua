--pieces
local base = piece "base"
local building = piece "building"
local turret = piece "turret"
local sleeve = piece "sleeve"
local barrel = piece "barrel"
local raisepoint = piece "raisepoint"
local shaft = piece "shaft"
local door_l = piece "door_l"
local door_r = piece "door_r"

-- emiters etc.
local emit = piece "emit"
local emit_groundflash = piece "emit_groundflash"

-- variables
local isaiming
local maxuncloakcount = 4000
local uncloakcount = 0

--signals
local SIG_AIM1 = 2

--FX
local BOOM	 = 1024+0
local turretbaseFX	 = 1025+0
local GROUNDFLASH	 = 1026+0

-----------------------------------------------------------------

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

function script.Activate ( )
end

function script.Deactivate ( )
end

local function RestoreAfterDelay()
	while true do
		if (uncloakcount < maxuncloakcount*0.25) then		
			Turn2( turret,  x_axis, -90, 200 ) 	
			Turn2( sleeve,  x_axis, 0, 50 ) 
			Move( shaft, y_axis, -50, 50)	
			Sleep(200)
			Turn2( door_r,  z_axis, 0, 100 ) 
			Turn2( door_l,  z_axis, 0, 100 ) 
			isaiming = false
		end
		if (uncloakcount < 1) then		
			Spring.SetUnitCloak(unitID, 2, 100)
			Spring.SetUnitStealth(unitID, true)
		end
	Sleep(300)
	uncloakcount = (uncloakcount - 300)
	end
end

function script.Create()
	isaiming = false
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( raisepoint, y_axis, structureheight)
	Move( shaft, y_axis, -50)
	Turn2( sleeve,  x_axis, 0, 20 )	
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( raisepoint, y_axis, outofground, 200 )
		EmitSfx(base,turretbaseFX)
		Sleep(100)
	end
	Move( raisepoint, y_axis, 0, 1000 )
	StartThread( RestoreAfterDelay )	
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	uncloakcount = maxuncloakcount
	Spring.SetUnitCloak(unitID, false)
	Spring.SetUnitStealth(unitID, false)		
	return(damage)
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return turret
end

function script.AimWeapon1(heading, pitch)
	isaiming = true
	Spring.SetUnitCloak(unitID, false)
	Spring.SetUnitStealth(unitID, false)	
	uncloakcount = maxuncloakcount		
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn2( turret,  x_axis, 0, 100 ) 	
	Turn2( door_r,  z_axis, 170, 200 ) 
	Turn2( door_l,  z_axis, -170, 200 ) 
	Move( shaft, y_axis, 0, 50)
	Turn( turret, y_axis, heading, 2.5 )
	Turn( sleeve,  x_axis, -pitch, 2.0 ) 
	WaitForMove (shaft, y_axis)	
	WaitForTurn (turret, y_axis)
	WaitForTurn (sleeve, x_axis)
	return true
end

function script.FireWeapon1()
--		EmitSfx( emit, GUNFLARE )	
	EmitSfx( emit_groundflash, GROUNDFLASH )	
--	Sleep(100)
	return(1)
end
-----------------------------------------------------------------

function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	return (1)
end