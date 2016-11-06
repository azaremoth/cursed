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
local lthumb = piece 'lthumb' 
local remit = piece 'remit' 
local lemit = piece 'lemit' 
local emit_groundflash_r = piece 'emit_groundflash_r' 
local emit_groundflash_l = piece 'emit_groundflash_l' 
local emit_rjet = piece 'emit_rjet' 
local emit_ljet = piece 'emit_ljet' 
local bunker_turret = piece 'bunker_turret' 
local bunker_emit = piece 'bunker_emit' 

local moving = false
local jumping = false
local attacking = false
local inbunker = false
local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 275
local gun = 1

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_AIM3 = 8
local SIG_WALK = 4

local BLOODSPLASH = 1024+0
local JUMP = 1025+0
local GROUNDFLASH = 1026+0
local BLOODSPRAY = 1027+0
local DUST = 1028+0

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
	MOVEANIMATIONSPEED = GetUnitValue(COB.MAX_SPEED)/3000
	MOVEANIMATIONSLEEPTIME = (40000000/GetUnitValue(COB.MAX_SPEED))	
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 10 then 
		MOVEANIMATIONSPEED = 10
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end	
end

-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)

	while true do
	
		if moving and not jumping then
			SetMoveAnimationSpeed()
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )				
			if not attacking then
				Turn2( chest, x_axis, 20, MOVEANIMATIONSPEED*3 )
				Turn2( chest, y_axis, -10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED )
			end
			Turn2( lthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( rthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( lleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving and not jumping then
--			SetMoveAnimationSpeed()
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0, 15 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving and not jumping then
			if not attacking then
				Turn2( chest, y_axis, 10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED )
			end
			Turn2( lthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( rthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Turn2( rleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving and not jumping then
--			SetMoveAnimationSpeed()
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0.75, 10 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving and not jumping then
			Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*2 )	
			Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED*2 )	
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 30 )		
			if not attacking then
				Turn2( lloarm, x_axis, 1.5*rturn, 30 )
				Turn2( rloarm, x_axis, -1.5*lturn, 30 )		
			end
		end
		Sleep(30)
	end
end

-- Bored Animation
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

------------------------ ACTIVATION
function script.Create()
	SetMoveAnimationSpeed()
	gun = 1
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
	Sleep(2000)
	Turn2( luparm , y_axis, 0, 100 )
	Turn2( ruparm , y_axis, 0, 100 )
	Turn2( head , y_axis, 0, 150 )
	attacking=false	
	return (0)
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


--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	if gun >= 0 then
		return remit
	else
		return lemit
	end
end

function script.AimFromWeapon1 ()
	return head end

function script.AimWeapon1(heading, pitch)
	if inbunker then
		return false
	end
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( luparm, y_axis, heading, 5 )
	Turn( ruparm, y_axis, heading, 5 )	
	Turn( rloarm, x_axis, -pitch, 5 )
	Turn( lloarm, x_axis, -pitch, 5 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( rloarm, x_axis )
    WaitForTurn( ruparm, y_axis )
	return true
end

function script.FireWeapon1()
	if gun>(-1) then
		EmitSfx( emit_groundflash_r, GROUNDFLASH )
	else
		EmitSfx( emit_groundflash_l, GROUNDFLASH )
	end
--		local unitDef = Spring.GetUnitDefID(unitID)
--		local team = Spring.GetUnitTeam(unitID)
--		GG.CreateLightMe(unitID, unitDef, team, emit, 155, 233, 233, 128)
--		Sleep(300)
--		GG.DestroyLightMe(unitID, unitDef, team)
	gun = gun*(-1)
	return(1)
end

--weapon 2 for bunker -----------------------------------------------------------------
function script.QueryWeapon2 ()
	return bunker_emit
end

function script.AimFromWeapon2 ()
	return bunker_turret
end

function script.AimWeapon2 (heading, pitch)
	if  not inbunker then
		return false
	end
	Turn( bunker_turret, y_axis, heading, 50 )
	Turn( bunker_turret, x_axis, -pitch, 50 )
--	Signal(SIG_AIM2)
--	SetSignalMask(SIG_AIM2)
    WaitForTurn( bunker_turret, x_axis )
    WaitForTurn( bunker_turret, y_axis )	
	return true
end

function script.FireWeapon2 ()
		return(1)
end
------------------------------------------------------------------------------------------
--Jumps
local function JumpExhaust()
	while jumping do 
		EmitSfx(emit_rjet, JUMP)
		EmitSfx(emit_ljet, JUMP)
		Sleep(33)
	end
end

function script.preJump()
end

function script.beginJump()
	if inbunker then
		return false
	end
	jumping = true
	Turn2( pelvis, x_axis, 30, MOVEANIMATIONSPEED*2 )	
	StartThread(JumpExhaust)
end

function script.jumping()
end

function script.halfJump()
	Turn2( pelvis, x_axis, -20, 50 )
	Turn2( rleg, x_axis, 10, 400 )
    Turn2( lleg, x_axis, 20, 400 )
end

function script.endJump()
	Turn2( pelvis, x_axis, 0, 200 )
	Turn2( rleg, x_axis, 0, 400 )
    Turn2( lleg, x_axis, 0, 400 )
	EmitSfx(base, DUST)	
	jumping = false
	moving = false	
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

------------------------------------------------------------------------------------------

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	local px, py, pz = Spring.GetUnitPosition(unitID)
	EmitSfx(pelvis, BLOODSPLASH)
	EmitSfx(head, BLOODSPRAY)
	if (math.random() > 0.5) then
		Spring.PlaySoundFile("sounds/dying_man.ogg", 10, px, py, pz)	
	else
		Spring.PlaySoundFile("sounds/dying_man_2.ogg", 10, px, py, pz)		
	end		
	if (severity > 0.5) then
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
		return (1)
	end
end
