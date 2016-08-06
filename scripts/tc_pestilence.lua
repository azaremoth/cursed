------------------------------------

local base = piece 'base'
local torso = piece 'torso'
local lleg1 = piece 'lleg1'
local lleg2 = piece 'lleg2'
local lleg3 = piece 'lleg3'
local rleg1 = piece 'rleg1'
local rleg2 = piece 'rleg2'
local rleg3 = piece 'rleg3'
local emit_rleg = piece 'emit_rleg'
local emit_lleg = piece 'emit_lleg'
local emit_summon = piece 'emit_summon'

local moving = false
local attacking = false
local inbunker = false
local burrowed = false
local jumping = false

local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_AIM1 = 2
local SIG_WALK = 4

local SUMMONING	 = 1024+0
local FOOTDUST	 = 1025+0
local BURROWING	 = 1026+0
local BLOOD		 = 1027+0

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/3300)
	MOVEANIMATIONSLEEPTIME = (44000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 10 then 
		MOVEANIMATIONSPEED = 10
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

local echo = Spring.Echo

-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)

	while true do
	
		if moving then
			SetMoveAnimationSpeed()
			Turn2( lleg1, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg1, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Move( torso, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			end
		if moving then
--			SetMoveAnimationSpeed()
			Turn2( lleg1, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg1, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( torso, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			end
		if moving then
			SetMoveAnimationSpeed()
			Turn2( lleg1, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg1, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			end
		if moving then
			SetMoveAnimationSpeed()
			Turn2( lleg1, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg1, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( torso, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
			end
		if not moving then 
			SetMoveAnimationSpeed()
			Turn2( rleg1, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lleg1, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( rleg2, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg2, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( torso, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( lleg1, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rleg1, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( torso, y_axis, 0, 8 )
			end
		Sleep(10)
	end
end

------------------------ ACTIVATION

local function BurrowAnim()
	Signal(SIG_WALK)
	moving = false
	attacking = false
	GG.Freeze(unitID,UnitDefs,teamID)
	EmitSfx(emit_summon, BURROWING)
	Turn2( torso, x_axis, -30, 200 )
	Sleep(200)
	Turn2( torso, x_axis, 30, 200 )
	EmitSfx(emit_summon, BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digin.wav", 30, x, y, z)
	Move( torso, y_axis, -100, 200 )
	Move( emit_summon, y_axis, 10, 50 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',1)
	burrowed = true
	return(1)
end

local function UnBurrowAnim()
	Signal(SIG_WALK)
	EmitSfx(emit_summon, BURROWING)
	Turn2( torso, x_axis, 0, 200 )
	Sleep(200)
	EmitSfx(emit_summon, BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digout.wav", 30, x, y, z)
	Move( torso, y_axis, 0, 1000 )
	Move( emit_summon, y_axis, 0, 30 )
	GG.UnFreeze(unitID,UnitDefs,teamID)		
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',0)
	burrowed = false
	Spring.SetUnitBlocking(unitID, true, true, true, true, false, true, false)		 -- overwrite crushable
	SetMoveAnimationSpeed()
	StartThread( Walkscript )
	return(1)
end


function script.Burrow()
	if burrowed then
		StartThread( UnBurrowAnim )
	else
		StartThread( BurrowAnim )	
	end
end

------------------------

function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 1000
	Turn2( emit_summon, x_axis, -90 )
	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	
			EmitSfx(emit_summon, SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread( Walkscript )
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
	return torso
end

function script.AimFromWeapon1 ()
	return torso
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

	
function script.Killed( damage, health )
	EmitSfx(torso, BLOOD)
	EmitSfx(base, BLOOD)

	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitBuildFacing(unitID)
	local team = Spring.GetUnitTeam(unitID)
	local one
	local two
	local three

	Spring.PlaySoundFile("sounds/FLAMHVY1.WAV", 30, x, y, z)

		one = Spring.CreateUnit("tc_suicide", x-10,y,z+5, heading, team)
		two = Spring.CreateUnit("tc_suicide", x,y,z, heading, team)
		three= Spring.CreateUnit("tc_suicide", x+10,y,z+5, heading, team)

	return 2
end