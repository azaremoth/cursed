------------------------------------

local base = piece 'base'
local chest = piece 'chest'
local pelvis = piece 'pelvis'
local rthigh = piece 'rthigh'
local lthigh = piece 'lthigh'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local rfoot = piece 'rfoot'
local lfoot = piece 'lfoot'
local luparm = piece 'luparm'
local lloarm = piece 'lloarm'
local ruparm = piece 'ruparm'
local rloarm = piece 'rloarm'
local neck = piece 'neck'
local head = piece 'head'
local jaw = piece 'jaw'
local lhand = piece 'lhand'
local lthumb = piece 'lthumb'
local emit_r = piece 'emit_r'
local emit_l = piece 'emit_l'
local emit_summon = piece 'emit_summon'
local emit_groundflash = piece 'emit_groundflash'
local aimpoint = piece 'aimpoint'

local moving = false
local attacking = false
local inbunker = false
local burrowed = false

local restore_delay, MOVEANIMATIONSPEED, 
local gun = 1

local SIG_AIM1 = 2
local SIG_WALK = 4

local SUMMONING	 = 1024+0
local GREYCLOUD	 = 1025+0
local BURROWING	 = 1026+0
local GROUNDFLASH	 = 1027+0

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1800)
	MOVEANIMATIONSLEEPTIME = (37000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
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
			Turn2( lthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( chest, z_axis, -5, MOVEANIMATIONSPEED )
			end
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			Turn2( lthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( chest, z_axis, 5, MOVEANIMATIONSPEED )
			end
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving and not jumping then 
--			SetMoveAnimationSpeed()
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( pelvis, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )
			Turn2( head, z_axis, 0, MOVEANIMATIONSPEED*0.3 )
			Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*3 )			
			Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )			
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
	EmitSfx(emit_summon,BURROWING)
	Turn2( chest, x_axis, 90, 200 )
	Turn2( neck, x_axis, 70, 200 )
	Turn2( luparm, x_axis, -30, 200 )
	Turn2( luparm, x_axis, -25, 200 )
	Sleep(200)
	EmitSfx(emit_summon,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digin.wav", 30, x, y, z)
	Move( pelvis, y_axis, -40, 100 )
	Move( emit_summon, y_axis, 10, 50 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',1)
	burrowed = true
	return(1)
end

local function UnBurrowAnim()
	Signal(SIG_WALK)
	EmitSfx(emit_summon,BURROWING)
	Turn2( chest, x_axis, 0, 200 )
	Turn2( neck, x_axis, 0, 200 )
	Turn2( luparm, x_axis, 0, 200 )
	Turn2( luparm, x_axis, 0, 200 )
	Sleep(200)
	EmitSfx(emit_summon,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digout.wav", 30, x, y, z)
	Move( pelvis, y_axis, 0, 400 )
	Move( emit_summon, y_axis, 0, 50 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',0)
	GG.UnFreeze(unitID,UnitDefs,teamID)		
	burrowed = false
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
	gun = 1
	restore_delay = 1000
	Turn2( emit_summon, x_axis, -90 )
	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
	Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)		
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
	Turn2( chest, y_axis, 0, 55 )
	Turn2( chest, x_axis, 0, 30 )
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	if gun >= 0 then
		return emit_r
	end
	if gun < 0 then
		return emit_l
	end
end

function script.AimFromWeapon1 ()
	return aimpoint
end

function script.AimWeapon1(heading, pitch)
	if burrowed then
		return false
	end
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( chest, y_axis, heading, 5 )
	Turn( chest, x_axis, -pitch, 5 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( chest, x_axis )
    WaitForTurn( chest, y_axis )
	return true
end

function script.FireWeapon1()
		EmitSfx( emit_groundflash, GROUNDFLASH )
		Sleep(300)
		gun = gun*(-1)
		return(1)
end

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
	
function script.Killed( damage, health )
	local severity = (damage/health) * 100
	if (burrowed) then
		return 2
	elseif severity > 50 then
		EmitSfx(pelvis,GREYCLOUD)
		EmitSfx(head,GREYCLOUD)
		Explode(rthigh, SFX.FALL + SFX.NO_HEATCLOUD)			
		Explode(luparm, SFX.FALL + SFX.NO_HEATCLOUD)			
		Explode(head, SFX.FALL + SFX.NO_HEATCLOUD)		
		return 2
	else
		Turn2( pelvis, x_axis, 90, 22 )
		Turn2( luparm, x_axis, -137, 15 )
		Turn2( ruparm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( base, y_axis, -2.6, 4.5 )
--		WaitForTurn(pelvis, x_axis)
		EmitSfx(pelvis,GREYCLOUD)
		EmitSfx(head,GREYCLOUD)
	end	
end	
