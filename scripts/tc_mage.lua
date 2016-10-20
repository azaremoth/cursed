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
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local aim_point = piece 'aim_point'
local cloth1 = piece 'cloth1'
local cloth2 = piece 'cloth2'
local cloth3 = piece 'cloth3'
local cloth4 = piece 'cloth4'
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
local GREYCLOUD	 = 1025+0
local BURROWING	 = 1026+0
local AIMINGFX	 = 1027+0
local FIREFX	 = 1028+0
local TELEPORTFX	 = 1029+0

---- FOR BORED ANIMATION and other randomizations -----
local rturn = (math.random()*50)
local lturn = (math.random()*(-50))
-------------------------------------------------------

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/2000)
	MOVEANIMATIONSLEEPTIME = (38000000/GetUnitValue(COB.MAX_SPEED))
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
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )	
			if not attacking then
				Turn2( ruparm, x_axis, 30, MOVEANIMATIONSPEED*2 )
			end
			Turn2( lthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED*2 )
				Turn2( chest, z_axis, -5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, 5, MOVEANIMATIONSPEED*0.3 )
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
			if not attacking then
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED*2 )
			end
			Turn2( lthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED*2 )
				Turn2( chest, z_axis, 5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, -5, MOVEANIMATIONSPEED*0.3 )				
			end
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end	
		if not moving and not jumping and not burrowed then	
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )		
			if not attacking then
				Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*3 )			
				Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, 0, MOVEANIMATIONSPEED*0.3 )		
			end
		end
		Sleep(30)
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking and not jumping and not burrowed then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( lloarm, x_axis, -70, MOVEANIMATIONSPEED*2 )
				Turn2( chest, x_axis, 10, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 30, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, 140, MOVEANIMATIONSPEED*3.5 )	
				WaitForTurn( chest, y_axis )
			elseif (borednumber < 5)then
				Turn2( rloarm, x_axis, -70, MOVEANIMATIONSPEED*2 )
				Turn2( chest, x_axis, 20, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, -25, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, -130, MOVEANIMATIONSPEED*3.5 )
				WaitForTurn( chest, y_axis )
			else 
				Turn2( rloarm, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*3.5 )
				WaitForTurn( chest, y_axis )		
			end
		end
	Sleep(1500)		
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
	GG.UpdateUnitAttributes(unitID) -- attribute change by unit_attributes	
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
	GG.UnFreeze(unitID,UnitDefs,teamID)		
	Sleep(100)
	
	Spring.SetUnitRulesParam(unitID,'burrowed',0)
	GG.UpdateUnitAttributes(unitID) -- attribute change by unit_attributes	
	burrowed = false
	SetMoveAnimationSpeed()
	StartThread( Walkscript )
	return(1)
end

function script.Burrow()
	if not inbunker and not jumping then
		if burrowed then
			StartThread( UnBurrowAnim )
		else
			StartThread( BurrowAnim )	
		end
	end
end

------------------------

local function Clothanimation()
	while true do
		Turn2( cloth2, x_axis, 10, 40 )
		Turn2( cloth4, x_axis, 10, 35 )
		WaitForTurn( cloth2, x_axis )
		Turn2( cloth2, x_axis, 20, 30 )
		Turn2( cloth4, x_axis, 20, 25 )
		WaitForTurn( cloth2, x_axis )
		Turn2( cloth2, x_axis, 10, 30 )
		Turn2( cloth4, x_axis, 10, 25 )
		WaitForTurn( cloth2, x_axis )
		Turn2( cloth2, x_axis, -10, 40 )
		Turn2( cloth4, x_axis, -10, 35 )
		WaitForTurn( cloth2, x_axis )
		Turn2( cloth2, x_axis, -20, 30 )
		Turn2( cloth4, x_axis, -20, 25 )
		WaitForTurn( cloth2, x_axis )
		Turn2( cloth2, x_axis, -10, 30 )
		Turn2( cloth4, x_axis, -10, 25 )
		WaitForTurn( cloth2, x_axis )
		Sleep(10)
	end
end

local function AimingFX()
	while true do
		if attacking then
			EmitSfx(aim_point, AIMINGFX)
			end			
		Sleep(100)
	end
end

local function AimingAnimation()
	while true do
		if attacking then
			Turn2( ruparm, x_axis, -29, 80 )
			Turn2( luparm, x_axis, -87, 80 )
			Sleep (125)
			Turn2( ruparm, x_axis, -19, 60 )
			Turn2( luparm, x_axis, -97, 60 )
			Sleep (125)
			Turn2( ruparm, x_axis, -29, 60 )
			Turn2( luparm, x_axis, -87, 60 )
			Sleep (125)
			Turn2( ruparm, x_axis, -49, 80 )
			Turn2( luparm, x_axis, -67, 80 )
			Sleep (125)
			Turn2( ruparm, x_axis, -59, 60 )
			Turn2( luparm, x_axis, -57, 60 )
			Sleep (125)
			Turn2( ruparm, x_axis, -49, 60 )
			Turn2( luparm, x_axis, -67, 60 )
			Sleep (125)
		end			
	Sleep(10)
	end
end

function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 2000
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
	StartThread( Clothanimation )
	StartThread( AimingFX )
	StartThread( AimingAnimation )
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
	Turn2( chest, y_axis, 0, 55 )
	Turn2( chest, x_axis, 0, 30 )

	Turn2( ruparm, x_axis, 0, 200 )
	Turn2( luparm, x_axis, 0, 200 )
	Turn2( luparm, y_axis, 0, 200 )

	Turn2( rloarm, x_axis, 0, 200 )
	Turn2( rloarm, y_axis, 0, 200 )
	Turn2( rloarm, z_axis, 0, 200 )
	Turn2( lloarm, x_axis, 0, 200 )
	Turn2( lloarm, y_axis, 0, 200 )
	Turn2( lloarm, z_axis, 0, 200 )

	Turn2( rhand, x_axis, 0, 200 )
	Turn2( rhand, y_axis, 0, 200 )
	Turn2( rhand, z_axis, 0, 200 )
	Turn2( lhand, x_axis, 0, 200 )
	Turn2( lhand, y_axis, 0, 200 )
	Turn2( lhand, z_axis, 0, 200 )

	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return aim_point
end

function script.AimFromWeapon1 ()
	return pelvis
end

function script.AimWeapon1(heading, pitch)
	if burrowed then
		return false
	end
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)

	Turn2( lloarm, x_axis, 15, 200 )
	Turn2( lloarm, y_axis, -20, 200 )
	Turn2( lloarm, z_axis, 27, 200 )
	Turn2( rloarm, x_axis, 48, 200 )
	Turn2( rloarm, y_axis, 0, 200 )
	Turn2( rloarm, z_axis, -85, 200 )

	Turn2( lhand, x_axis, -32, 200 )
	Turn2( lhand, y_axis, 0, 200 )
	Turn2( lhand, z_axis, 30, 200 )
	Turn2( rhand, x_axis, 0, 200 )
	Turn2( rhand, y_axis, -258, 200 )
	Turn2( rhand, z_axis, 8, 200 )

	Turn( chest, y_axis, heading, 8 )
	Turn( chest, x_axis, -pitch, 8 )

	StartThread( RestoreAfterDelay) 

--      WaitForTurn( chest, x_axis )
--      WaitForTurn( chest, y_axis )

	return true
end

function script.FireWeapon1()
		Turn2( ruparm, y_axis, 90, 400 )
		Turn2( luparm, y_axis, -90, 400 )
		EmitSfx( aim_point, FIREFX )
		Sleep(500)
		Turn2( ruparm, y_axis, 0, 400 )
		Turn2( luparm, y_axis, 0, 400 )
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

--Jumps
function script.preJump()
end

function script.beginJump()
	jumping = true
	EmitSfx(emit_summon,TELEPORTFX)	
	EmitSfx(head,FIREFX)		
	EmitSfx(rfoot,FIREFX)		
	EmitSfx(lfoot,FIREFX)			
	Hide(chest)
	Hide(pelvis)
	Hide(rthigh)
	Hide(lthigh)
	Hide(lleg)
	Hide(rleg)
	Hide(rfoot)
	Hide(lfoot)
	Hide(luparm)
	Hide(lloarm)
	Hide(ruparm)
	Hide(rloarm)
	Hide(neck)
	Hide(head)
	Hide(jaw)
	Hide(lhand)
	Hide(lthumb)
	Hide(rhand)
	Hide(rthumb)
	Hide(cloth1)
	Hide(cloth2)
	Hide(cloth3)
	Hide(cloth4)
end

function script.jumping()
end

function script.halfJump()
end

function script.endJump()
	Show(chest)
	Show(pelvis)
	Show(rthigh)
	Show(lthigh)
	Show(lleg)
	Show(rleg)
	Show(rfoot)
	Show(lfoot)
	Show(luparm)
	Show(lloarm)
	Show(ruparm)
	Show(rloarm)
	Show(neck)
	Show(head)
	Show(jaw)
	Show(lhand)
	Show(lthumb)
	Show(rhand)
	Show(rthumb)
	Show(cloth1)
	Show(cloth2)
	Show(cloth3)
	Show(cloth4)
	EmitSfx(emit_summon,TELEPORTFX)	
	EmitSfx(head,FIREFX)		
	EmitSfx(rfoot,FIREFX)		
	EmitSfx(lfoot,FIREFX)	
	jumping = false	
end
	
function script.HitByWeapon ( x, z, weaponDefID, damage )
	if inbunker then
		return(0)
	elseif jumping then
		return(0)
	else
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
		return 1	
	end	
end