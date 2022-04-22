------------------------------------

local emit_melee = piece 'emit_melee'
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
local head = piece 'head'
local lhand = piece 'lhand'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local gun = piece 'gun'
local lclaws = piece 'lclaws'
local rclaws = piece 'rclaws'
local emit = piece 'emit'
local emit_groundflash = piece 'emit_groundflash'
local bunker_emit = piece 'bunker_emit'
local bunker_turret = piece 'bunker_turret'
local emit_summon = piece 'emit_summon'

local moving = false
local attacking = false
local aiming = false
local inbunker = false
local burrowed = false
local jumping = false
local parried = false
local isparrying = false
local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 350

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 1

local BLOODSPLASH	 = 1024+0
local GUNFLARE		 = 1025+0
local GROUNDFLASH	 = 1026+0
local BLOODSPRAY	 = 1027+0
local BURROWING	 	= 1028+0

local rturn = (math.random()*50)
local lturn = (math.random()*(-50))

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/3000)
	MOVEANIMATIONSLEEPTIME = (33000000/GetUnitValue(COB.MAX_SPEED))
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
			if not attacking and not aiming then
				Turn2( ruparm, x_axis, 0, 300)
				Turn2( ruparm, y_axis, 0, 300)
				Turn2( luparm, y_axis, 0, 300)
				Turn2( ruparm, z_axis, 0, 300)
				Turn2( luparm, z_axis, 0, 300)	
				Turn2( lloarm, x_axis, -50, 90 )
				Turn2( luparm, x_axis, -10, 90 )			
				Turn2( chest, z_axis, -25, MOVEANIMATIONSPEED*1.2 )
				Turn2( chest, x_axis, 25, MOVEANIMATIONSPEED*1.2 )				
				Turn2( head, z_axis, 5, MOVEANIMATIONSPEED*0.3 )
				Turn2( rloarm, x_axis, -30, 60 )
			end
			Turn2( lthigh, x_axis, -25, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*1.8 )
			Sleep(MOVEANIMATIONSLEEPTIME)				
		end
		if moving then
--			SetMoveAnimationSpeed()
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not aiming then 
				Turn2( lloarm, x_axis, 60, 120 )	
				Turn2( luparm, x_axis, 0, 90 )			
				Turn2( chest, z_axis, 2, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, -5, MOVEANIMATIONSPEED*0.3 )
			end
			Turn2( lthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*1.8 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving then
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( pelvis, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )
			if not attacking and not aiming then 
				Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( ruparm, x_axis, 0, 300)
				Turn2( luparm, x_axis, 0, 300)
				Turn2( ruparm, y_axis, 0, 300)
				Turn2( luparm, y_axis, 0, 300)
				Turn2( ruparm, z_axis, 0, 300)
				Turn2( luparm, z_axis, 0, 300)	
				Turn2( lloarm, x_axis, 1.75*rturn, 30 )
				Turn2( rloarm, x_axis, -1.75*lturn, 30 )				
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
			end
		end
		Sleep(30)		
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking and not jumping then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( chest, y_axis, 20, MOVEANIMATIONSPEED*0.75 )
				Turn2( head, y_axis, 30, MOVEANIMATIONSPEED*1.5 )			
				WaitForTurn( chest, y_axis )
			elseif (borednumber < 5)then
				Turn2( chest, y_axis, -20, MOVEANIMATIONSPEED*0.75 )			
				Turn2( head, y_axis, -30, MOVEANIMATIONSPEED*1.5 )	
				WaitForTurn( chest, y_axis )
			else 
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*0.75 )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*1.5 )	
				WaitForTurn( chest, y_axis )				
			end
		end
	Sleep(1500)		
	end
end

------------------------ ACTIVATION -------

local function BurrowAnim()
	Signal(SIG_WALK)
	moving = false
	attacking = false
	GG.Freeze(unitID,UnitDefs,teamID)
	EmitSfx(emit_summon,BURROWING)
	Turn2( chest, x_axis, 90, 200 )
	Turn2( head, x_axis, 70, 200 )
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
	Turn2( head, x_axis, 0, 200 )
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
	if not inbunker then
		if burrowed then
			StartThread( UnBurrowAnim )
		else
			StartThread( BurrowAnim )	
		end
	end
end

------------------------

function script.Create()
	Hide (lhand)
	Hide (rhand)
	Hide (rthumb)
	Hide (gun)	
	SetMoveAnimationSpeed()
	restore_delay = 5000
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)		
	StartThread( Walkscript )
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
	Turn2( chest, x_axis, 0, 200)
	Turn2( chest, y_axis, 0, 200)	
	Turn2( ruparm, x_axis, 0, 200)
	Turn2( luparm, x_axis, 0, 200)		
	Turn2( ruparm, y_axis, 0, 200)
	Turn2( luparm, y_axis, 0, 200)			
	Turn2( ruparm, z_axis, 0, 200)
	Turn2( luparm, z_axis, 0, 200)			
	Turn2( rloarm, x_axis, 0, 200)
	Turn2( lloarm, y_axis, 0, 200)	
	Turn2( rloarm, z_axis, 0, 200)
	Turn2( lloarm, z_axis, 0, 200)
	attacking = false
	return (0)
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit_melee
end

function script.AimFromWeapon1 ()
	return pelvis
end

function script.AimWeapon1(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if burrowed or inbunker or isparrying then
		return false
	end
   	local SIG_AIM = 2
   	Signal(SIG_AIM)
   	SetSignalMask(SIG_AIM)
 	Turn(chest, y_axis, heading, 50)
	aiming=true	
	Turn2( chest, z_axis, 0)
	Turn2( ruparm, y_axis, 45, 300)	
	Turn2( luparm, y_axis, -45, 300)	
	Turn2( ruparm, x_axis, 0, 300)	
	Turn2( luparm, x_axis, 0, 300)		
	Turn2( ruparm, z_axis, 0, 300)	
	Turn2( luparm, z_axis, 0, 300)	
	
 	WaitForTurn(chest, y_axis)
   	return true
end

function script.Shot1()
	attacking=true
	StartThread(MeleeAnimations)
	StartThread( RestoreAfterDelay) 	
end


function MeleeAnimations()
	local randomnumber = math.random()
	if attacking then
		if not moving then
			Turn2( chest, x_axis, 0)
		end	
		--lean back
		if not moving then
			Turn2( chest, x_axis, -10, 300)
			WaitForTurn(chest, x_axis)		
		end		
		--attack
		if not moving then
			Turn2( chest, x_axis, 10, 500)
			Turn2( luparm, x_axis, -30, 300)
			Turn2( ruparm, x_axis, -30, 300)			
		end			
		Turn2( ruparm, y_axis, -40, 850 )
		Turn2( luparm, y_axis, 40, 850 )			
		WaitForTurn(ruparm, y_axis)		
      	local x, y, z = Spring.GetUnitPosition(unitID)
		Spring.PlaySoundFile("sounds/swoosh.wav", 30, x, y, z)
		--back to null position				
		Sleep (300)
		return(1)
	end
	if isparrying then
		Sleep(200)
		Turn2( chest, x_axis, -40, 850)
		Turn2( ruparm, y_axis, -40, 850 )
		Turn2( luparm, y_axis, 40, 850 )
		Sleep(300)
		Turn2( chest, x_axis, -40, 600)		
		Turn2( ruparm, y_axis, 0, 850 )
		Turn2( luparm, y_axis, 0, 850 )
	end
	Sleep(300)	
	attacking=false
	isparrying = false
	return(1)	
end








--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
      inbunker = false
   elseif (curTerrainType == 0) then
      inbunker = true
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
	local severity = (damage/health) * 100
	local px, py, pz = Spring.GetUnitPosition(unitID)
	if severity > 50 then
		EmitSfx(pelvis, BLOODSPLASH)
		EmitSfx(head, BLOODSPLASH)
		Explode(gun, SFX.FALL + SFX.NO_HEATCLOUD)	
		if (math.random() > 0.5) then
			Spring.PlaySoundFile("sounds/zombie_growl.wav", 10, px, py, pz)
		else
			Spring.PlaySoundFile("sounds/zombie_growl.wav", 10, px, py, pz)
		end
		return 2
	else
		Turn2( pelvis, x_axis, 90, 250 )
		Turn2( lloarm, x_axis, -137, 15 )
		Turn2( rloarm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( base, y_axis, -50, 400)
		WaitForTurn(pelvis, x_axis)
		EmitSfx(pelvis,BLOODSPLASH)
		EmitSfx(head,BLOODSPLASH)
		if (math.random() > 0.5) then
			Spring.PlaySoundFile("sounds/zombie_growl.wav", 10, px, py, pz)	
		else
			Spring.PlaySoundFile("sounds/zombie_growl.wav", 10, px, py, pz)		
		end		
		return (1)
	end
end