------------------------------------

local base = piece 'base'
local rotator = piece 'rotator'
local eye = piece 'eye'
local panels = piece 'panels'

local moving = false
local attacking = false
local inbunker = false

local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_AIM1 = 2
local SIG_WALK = 1

local BOOM	 = 1024+0

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function SetMoveAnimationSpeed()
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/100000)
	MOVEANIMATIONSLEEPTIME = (44000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

local function Animation()
	while true do
		Move( rotator, y_axis, 20, MOVEANIMATIONSPEED*0.2 )
		WaitForMove( rotator, y_axis )
		Move( rotator, y_axis, 30, MOVEANIMATIONSPEED*0.25 )
		WaitForMove( rotator, y_axis )
		Move( rotator, y_axis, 40, MOVEANIMATIONSPEED*0.2 )
		WaitForMove( rotator, y_axis )
		Move( rotator, y_axis, 30, MOVEANIMATIONSPEED*0.2 )
		WaitForMove( rotator, y_axis )
		Move( rotator, y_axis, 20, MOVEANIMATIONSPEED*0.25 )
		WaitForMove( rotator, y_axis )
		Move( rotator, y_axis, 0, MOVEANIMATIONSPEED*0.2 )		
		WaitForMove( rotator, y_axis )
		Sleep(50)
	end
end

local function BoredAnimation()
	while true do
		if not attacking and not moving then		
			borednumber = math.random(50)
			if (borednumber > 45) then	
				Turn2( rotator, x_axis, -45, MOVEANIMATIONSPEED*4 )
				WaitForTurn( rotator, x_axis )			
				Turn2( rotator, x_axis, -90, MOVEANIMATIONSPEED*8 )
				WaitForTurn( rotator, x_axis )
				Turn2( rotator, x_axis, -180, MOVEANIMATIONSPEED*12 )
				WaitForTurn( rotator, x_axis )
				Turn2( rotator, x_axis, -270, MOVEANIMATIONSPEED*12 )
				WaitForTurn( rotator, x_axis )
				Turn2( rotator, x_axis, -315, MOVEANIMATIONSPEED*8 )
				WaitForTurn( rotator, x_axis )					
				Turn2( rotator, x_axis, 0, MOVEANIMATIONSPEED*4 )
				WaitForTurn( rotator, x_axis )
			elseif (borednumber < 5) then
				Turn2( eye, x_axis, -45, MOVEANIMATIONSPEED*2 )				
				WaitForTurn( eye, x_axis )
				Turn2( eye, y_axis, 60, MOVEANIMATIONSPEED*2 )					
				WaitForTurn( eye, y_axis )
				Sleep(500)
				Turn2( eye, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( eye, y_axis, 0, MOVEANIMATIONSPEED*2 )
				WaitForTurn( eye, x_axis )
				WaitForTurn( eye, y_axis )
			else 
				Turn2( eye, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( eye, y_axis, 0, MOVEANIMATIONSPEED*2 )					
				Turn2( rotator, x_axis, 0, MOVEANIMATIONSPEED*16 )		
			end
		end
	Sleep(1500)		
	end
end


function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 1000
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	Spring.UnitScript.Spin ( eye, z_axis, 5) 	
	Spring.UnitScript.Spin ( panels, z_axis, -10)
	StartThread( Animation )
	StartThread( BoredAnimation )	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end
  
local function RestoreAfterDelay()
	Sleep(restore_delay)
	attacking = false
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return eye
end

function script.AimFromWeapon1 ()
	return eye
end

function script.AimWeapon1(heading, pitch)
	if burrowed then
		return false
	end
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	StartThread( RestoreAfterDelay)
	Sleep(50)
	return true
end

function script.FireWeapon1()
		Sleep(300)
		return(1)
end

--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	  
   elseif (curTerrainType == 0) then
      inbunker = true
	  Spring.SetUnitNeutral(unitID, true)
   end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	if inbunker then
		return(0)
	elseif not inbunker then
		return(damage)
	end
end

------------------------------------------------------------------------------------------
	
function script.Killed( damage, health )
	EmitSfx(eye, BOOM)
	return 2
end