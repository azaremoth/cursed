local base = piece "base"
local torso = piece "torso"
local jaws = piece "jaws"
local tail = piece "tail"
local head = piece "head"
local frleg = piece "frleg"
local flleg = piece "flleg"
local rrleg = piece "rrleg"
local rlleg = piece "rlleg"
local lfrleg = piece "lfrleg"
local lflleg = piece "lflleg"
local lrrleg = piece "lrrleg"
local lrlleg = piece "lrlleg"

local x_axis, y_axis, z_axis = 1,2,3

local moving = false
local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_WALK = 2

local MAGICBOOM = 1024+0
local MAGICBOOM2 = 1025+0
local BLOOD = 1026+0
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
------	 
			SpecialTurn( torso ,  y_axis , 2, MOVEANIMATIONSPEED)
			SpecialTurn( torso ,  z_axis , 5, MOVEANIMATIONSPEED)
			
			SpecialTurn( flleg ,  x_axis , -55, MOVEANIMATIONSPEED)
			SpecialTurn( frleg ,  x_axis , -40, MOVEANIMATIONSPEED)
			SpecialTurn( rrleg ,  x_axis , 40, MOVEANIMATIONSPEED)
			SpecialTurn( rlleg ,  x_axis , 55, MOVEANIMATIONSPEED)

			SpecialTurn( lflleg ,  x_axis , -10, MOVEANIMATIONSPEED)
			SpecialTurn( lfrleg ,  x_axis , -10, MOVEANIMATIONSPEED)
			SpecialTurn( lrrleg ,  x_axis , 20, MOVEANIMATIONSPEED)
			SpecialTurn( lrlleg ,  x_axis , 20, MOVEANIMATIONSPEED)
			
			Spring.UnitScript.Move (base, y_axis , 0.5,  MOVEANIMATIONSPEED*2)

			SpecialTurn( head ,  x_axis , -10, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)

			SpecialTurn( torso ,  y_axis , -2, MOVEANIMATIONSPEED)
			SpecialTurn( torso ,  z_axis , -5, MOVEANIMATIONSPEED)			

			SpecialTurn( flleg ,  x_axis , 10, MOVEANIMATIONSPEED)
			SpecialTurn( frleg ,  x_axis , 25, MOVEANIMATIONSPEED)
			SpecialTurn( rrleg ,  x_axis , -25, MOVEANIMATIONSPEED)
			SpecialTurn( rlleg ,  x_axis , 10, MOVEANIMATIONSPEED)

			SpecialTurn( lflleg ,  x_axis , 10, MOVEANIMATIONSPEED)
			SpecialTurn( lfrleg ,  x_axis , 10, MOVEANIMATIONSPEED)
			SpecialTurn( lrrleg ,  x_axis , -20, MOVEANIMATIONSPEED)
			SpecialTurn( lrlleg ,  x_axis , -20, MOVEANIMATIONSPEED)
			
			Spring.UnitScript.Move (base, y_axis , 0,  MOVEANIMATIONSPEED*2)

			SpecialTurn( head ,  x_axis , 0, MOVEANIMATIONSPEED*0.25)

			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if not moving then 
			SetMoveAnimationSpeed()
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
	SetMoveAnimationSpeed()
	StartThread( Walkscript )
	Spring.SetUnitBlocking(unitID, true, true, true)	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end
	
function script.Killed(severity)
	local randomnumber  = math.random(3)	
	if (randomnumber < 2 ) then
		local x, y, z = Spring.GetUnitPosition(unitID)
		local heading = Spring.GetUnitBuildFacing(unitID)
		local team = Spring.GetUnitTeam(unitID)
		local werewolf	
		Spring.UnitScript.EmitSfx ( torso, MAGICBOOM )
		Spring.UnitScript.EmitSfx ( head, MAGICBOOM2 )
		werewolf = Spring.CreateUnit("euf_werewolf", x,y,z, heading, team)
	end
	if (randomnumber >= 2 ) then
		Spring.UnitScript.EmitSfx ( torso, BLOOD )
	end		
	return 0
end