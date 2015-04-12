-- PIG --

local base = piece "base"
local torso = piece "torso"
local head = piece "head"
local frleg = piece "frleg"
local flleg = piece "flleg"
local rrleg = piece "rrleg"
local rlleg = piece "rlleg"

local x_axis, y_axis, z_axis = 1,2,3

local moving = false
local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_WALK = 2

local SUMMONING = 1024+0
local BLOOD = 1025+0

local echo = Spring.Echo

local function SpecialTurn(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	local speed1 = speed * 3.1415 / 180
	Spring.UnitScript.Turn(piecenum, axis, radians, speed1) 
end

local function SetMoveAnimationSpeed()
	MOVEANIMATIONSPEED = GetUnitValue(COB.MAX_SPEED)/1250
	MOVEANIMATIONSLEEPTIME = (35000000/GetUnitValue(COB.MAX_SPEED))	
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end	
end

-- Walk Motion
local function Walkscript()
	SetSignalMask( SIG_WALK )
	while (true) do
		if moving then
			SetMoveAnimationSpeed()
	 
			SpecialTurn( flleg ,  x_axis , 30, MOVEANIMATIONSPEED*1.8)
			SpecialTurn( frleg ,  x_axis , -20, MOVEANIMATIONSPEED*2.6)
			SpecialTurn( rrleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.44)
			SpecialTurn( rlleg ,  x_axis , -20, MOVEANIMATIONSPEED*2.6)
					
			SpecialTurn( torso ,  z_axis , 3, MOVEANIMATIONSPEED*0.25)

			SpecialTurn( flleg ,  z_axis , -5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( frleg ,  z_axis , -5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( rlleg ,  z_axis , -5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( rrleg ,  z_axis , -5, MOVEANIMATIONSPEED*0.25)
			Spring.UnitScript.Move ( base ,  y_axis , 0.2,  MOVEANIMATIONSPEED*50 )

			SpecialTurn( head ,  x_axis , -10, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)
	 
			SpecialTurn( flleg ,  x_axis , -10, MOVEANIMATIONSPEED*2)
			SpecialTurn( frleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.8)
			SpecialTurn( rrleg ,  x_axis , -10, MOVEANIMATIONSPEED*2)
			SpecialTurn( rlleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.8)
					
			Spring.UnitScript.Move ( base ,  y_axis , 0,  MOVEANIMATIONSPEED*50)
			SpecialTurn( head ,  x_axis , 10, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)
			
			SpecialTurn( frleg ,  x_axis , 30, MOVEANIMATIONSPEED*1.8)
			SpecialTurn( flleg ,  x_axis , -20, MOVEANIMATIONSPEED*2.6)
			SpecialTurn( rlleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.43)
			SpecialTurn( rrleg ,  x_axis , -20, MOVEANIMATIONSPEED*2.6)

			SpecialTurn( torso ,  z_axis , -3, MOVEANIMATIONSPEED*0.25)

			SpecialTurn( flleg ,  z_axis , 5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( frleg ,  z_axis , 5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( rlleg ,  z_axis , 5, MOVEANIMATIONSPEED*0.25)
			SpecialTurn( rrleg ,  z_axis , 5, MOVEANIMATIONSPEED*0.25)
			Spring.UnitScript.Move ( base ,  y_axis , 0.2,  MOVEANIMATIONSPEED*50)
			SpecialTurn( head ,  x_axis , -10, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)

			SpecialTurn( frleg ,  x_axis , -10, MOVEANIMATIONSPEED*2)
			SpecialTurn( flleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.8)
			SpecialTurn( rlleg ,  x_axis , -10, MOVEANIMATIONSPEED*2)
			SpecialTurn( rrleg ,  x_axis , 40, MOVEANIMATIONSPEED*1.8)

			Spring.UnitScript.Move ( base ,  y_axis , 0,  MOVEANIMATIONSPEED*50)
			SpecialTurn( head ,  x_axis , 10, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if not moving then 
--			SetMoveAnimationSpeed()
			SpecialTurn( base ,  x_axis , 0, MOVEANIMATIONSPEED*3.75)

			SpecialTurn( frleg ,  x_axis , 0, MOVEANIMATIONSPEED*2)
			SpecialTurn( flleg ,  x_axis , 0, MOVEANIMATIONSPEED*2)
			SpecialTurn( rlleg ,  x_axis , 0, MOVEANIMATIONSPEED*2)
			SpecialTurn( rrleg ,  x_axis , 0, MOVEANIMATIONSPEED*2)

			SpecialTurn( head ,  x_axis , 0, MOVEANIMATIONSPEED*0.25)
		end
		Sleep( 100 )
	end
end

function script.Create()
	Spring.SetUnitNeutral(unitID, true)
	local _,maxhealth = Spring.GetUnitHealth(unitID)
	SetMoveAnimationSpeed()
	StartThread( Walkscript )
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end
	
function script.Killed(severity)
	
	Spring.UnitScript.EmitSfx ( torso, BLOOD )
	Spring.UnitScript.EmitSfx ( head, BLOOD )
	return 0
end