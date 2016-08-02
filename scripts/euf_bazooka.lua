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
local head = piece 'head'
local lhand = piece 'lhand'
local lthumb = piece 'lthumb'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local gun = piece 'gun'
local emit = piece 'emit'
local emit_groundflash = piece 'emit_groundflash'
local bunker_emit = piece 'bunker_emit'
local bunker_turret = piece 'bunker_turret'

local moving = false
local attacking = false
local inbunker = false
local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 4

local BLOODSPLASH	 = 1024+0
local GUNFLARE		 = 1025+0
local GROUNDFLASH	 = 1026+0
local BLOODSPRAY	 = 1027+0

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/2800)
	MOVEANIMATIONSLEEPTIME = (36000000/GetUnitValue(COB.MAX_SPEED))
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
		if moving then
			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, -10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED )				
			end
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( rthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( lleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Sleep(MOVEANIMATIONSLEEPTIME)				
		end
		if moving then
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0, 15 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
			if not attacking then
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED )				
			end		
			Turn2( lthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( rthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Turn2( rleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0.75, 10 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving then
			Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED*2 )	
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )					
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( pelvis, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 30 )		
			if not attacking then 
				Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*2 )	
			end
		end
		Sleep(30)		
	end
end

-- Bored Animation
local function BoredAnimation()
	while true do
		if not attacking then		
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
	restore_delay = 1000
	
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
	Sleep(1000)
	Turn2( rloarm, x_axis, 0, 120 )	
	Turn2( head, y_axis, 0, 120 )
	Sleep(2000)
	Turn2( chest, y_axis, 0, 100 )
	Sleep(100)
	attacking = false
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return pelvis end

function script.AimWeapon1(heading, pitch)
	if inbunker then
		return false
	end
	Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED )	
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( chest, y_axis, heading, 5 )
	Turn( rloarm, x_axis, -pitch, 5 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( rloarm, x_axis )
    WaitForTurn( chest, y_axis )
	return true
end

function script.FireWeapon1()
		EmitSfx( emit, GUNFLARE )
		EmitSfx( emit_groundflash, GROUNDFLASH )
--		local unitDef = Spring.GetUnitDefID(unitID)
--		local team = Spring.GetUnitTeam(unitID)
--		GG.CreateLightMe(unitID, unitDef, team, emit, 155, 233, 233, 128)
--		Sleep(300)
--		GG.DestroyLightMe(unitID, unitDef, team)
		return(1)
end

--weapon 2 for bunker -----------------------------------------------------------------

function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
	  Spring.UnitScript.Show(gun)   
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	  
   elseif (curTerrainType == 0) then
	  Spring.UnitScript.Hide(gun)   
      inbunker = true
	  Spring.SetUnitNeutral(unitID, true)	  
   end
end

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

function script.HitByWeapon ( x, z, weaponDefID, damage )
	if inbunker then
		return(0)
	elseif not inbunker then
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
		Explode(gun, SFX.FALL + SFX.NO_HEATCLOUD)	
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