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
local lthumb = piece 'lthumb'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local sword = piece 'sword'
local shield = piece 'shield'
local blade = piece 'blade'
local emit = piece 'emit'
local joint = piece 'joint'
local rshoulder = piece 'rshoulder'
local lshoulder = piece 'lshoulder'

local restore_delay, moving, attacking, MOVEANIMATIONSPEED, inbunker

local SIG_AIM1 = 2
local SIG_Walk = 1

local ATK_CHEST_SPEED_B = 300
local ATK_CHEST_SPEED_F = 400
local ATK_CHEST_SPEED_S = 400

local ATK_UPARM_SPEED_B = 450
local ATK_UPARM_SPEED_F = 400
local ATK_LOARM_SPEED_B = 450
local ATK_LOARM_SPEED_F = 1000

local ATK_RHAND_SPEED_B = 450
local ATK_RHAND_SPEED_F = 400

local BLOODSPLASH	 = 1024+0
local BLOODSPRAY	 = 1025+0
local SPARKLES		 = 1026+0

local unitteamID = Spring.GetUnitTeam(unitID)

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
	MOVEANIMATIONSLEEPTIME = (42000000/GetUnitValue(COB.MAX_SPEED))
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
			if not attacking then
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED )
				Turn2( rloarm, x_axis, -50, MOVEANIMATIONSPEED )
				Turn2( rhand, y_axis, -30, MOVEANIMATIONSPEED*3 )
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
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, -10, MOVEANIMATIONSPEED )
				Turn2( chest, x_axis, 20, MOVEANIMATIONSPEED*3 )
				Turn2( chest, y_axis, -10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED )	
				Turn2( head, z_axis, 2, MOVEANIMATIONSPEED*0.3 )
				end
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0, 15 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, -2, MOVEANIMATIONSPEED*0.3 )
			end
			Turn2( lthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( rthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Turn2( rleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( ruparm, x_axis, -10, MOVEANIMATIONSPEED*2 )
			end
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0.75, 10 )
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
			Turn2( head, z_axis, 0, MOVEANIMATIONSPEED*0.3 )	
			if not attacking then 
				Turn2( lloarm, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, x_axis, 0, MOVEANIMATIONSPEED )				
				Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
				Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*1.7 )
				Turn2( rhand, y_axis, rturn-10, MOVEANIMATIONSPEED*2 )
				Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )	
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
	moving = false
	attacking=false
	
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
  
--[[local function RestoreAfterDelay()
	Sleep(restore_delay)
	Turn( chest, x_axis, 0, 8)	
 	Turn(chest, y_axis, 0, 10)
	Turn2( rloarm, x_axis, 0, 300)
	Turn2( rloarm, y_axis, 0, 320)		
	Turn2( rhand, x_axis, 0, 150)		
	Turn2( rhand, y_axis, 0, 300)		
	Turn2( rhand, z_axis, 0, 250)
	Turn2( joint, y_axis, 0, 230)	
	return (0)
end]]--

--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
	  Show (blade)
	  Show (shield)	  
	  Show (chest)		  
	  Show (head)
	  Show (rshoulder)
	  Show (lshoulder)	  
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	  
   elseif (curTerrainType == 0) then
	  Hide (blade)
	  Hide (shield)	 	  
	  Hide (chest)	  
	  Hide (head)
	  Hide (rshoulder)
	  Hide (lshoulder)	  
      inbunker = true
	  Spring.SetUnitNeutral(unitID, true)	  
   end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	local rndnr = math.random()
	if inbunker then
		return(0)
	end
	return(damage)		
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit_melee
end

function script.AimFromWeapon1 ()
	return emit_melee
end

function script.AimWeapon1(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if inbunker then
		return false
	end
	Sleep(50)
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
--	StartThread( RestoreAfterDelay) 
	return true
end

function script.Shot1()
	attacking=true
	StartThread(MeleeAnimations)
end



function MeleeAnimations()
	local randomnumber = math.random()
	if attacking then
		Turn2( rhand, y_axis, 0, MOVEANIMATIONSPEED*4 )
		Turn2( lshoulder, x_axis, 20, 400 )		
		Turn2( luparm, x_axis, 20, 500 )
		Turn2( lloarm, x_axis, 0, 400 )			
		if (randomnumber > 0.5) then
			Turn2( chest, x_axis, 0, 400 )
			Turn2( chest, y_axis, 0, 400 )
			Turn2( chest, z_axis, 0, 400 )
			Turn2( ruparm, x_axis, 0, 400 )
			Turn2( ruparm, y_axis, 0, 400 )
			Turn2( ruparm, z_axis, 0, 400 )
			Turn2( rloarm, x_axis, 0, 400 )
			Turn2( rloarm, y_axis, 0, 400 )
			Turn2( rloarm, z_axis, 0, 400 )
			Turn2( rloarm, x_axis, -25, ATK_UPARM_SPEED_B*2 )
			Turn2( rloarm, y_axis, -45, ATK_UPARM_SPEED_B*2 )		
			Turn2( rhand, x_axis, 25, ATK_RHAND_SPEED_F*2 )		
			Turn2( rhand, y_axis, 0, ATK_RHAND_SPEED_F*2 )		
			Turn2( rhand, z_axis, 90, ATK_RHAND_SPEED_F*2 )
			Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*4 )
			Turn2( chest, x_axis, -5, ATK_CHEST_SPEED_B*2 )		
			Turn2( joint, y_axis, 0, ATK_UPARM_SPEED_B*2 )
			WaitForTurn(rloarm, y_axis)			
			Turn2( chest, x_axis, 5, ATK_CHEST_SPEED_B )		
			Turn2( joint, y_axis, 120, ATK_LOARM_SPEED_F )
			local x, y, z = Spring.GetUnitPosition(unitID)
			Spring.PlaySoundFile("sounds/swoosh.wav", 80, x, y, z)
			WaitForTurn(chest, x_axis)
			WaitForTurn(joint, y_axis)
			Turn2( joint, y_axis, 0, ATK_LOARM_SPEED_B)
			Turn2( chest, x_axis, 0, 400 )
			Turn2( chest, y_axis, 0, 400 )
			Turn2( chest, z_axis, 0, 400 )
			Turn2( ruparm, x_axis, 0, 400 )
			Turn2( ruparm, y_axis, 0, 400 )
			Turn2( ruparm, z_axis, 0, 400 )
			Turn2( rloarm, x_axis, 0, 400 )
			Turn2( rloarm, y_axis, 0, 400 )
			Turn2( rloarm, z_axis, 0, 400 )
			Turn2( rhand, x_axis, 0, 400 )
			Turn2( rhand, y_axis, 0, 400 )
			Turn2( rhand, z_axis, 0, 400 )
			Turn2( joint, y_axis, 0, 400 )			
			WaitForTurn(chest, x_axis)
			WaitForTurn(chest, y_axis)
			WaitForTurn(chest, z_axis)
			WaitForTurn(ruparm, x_axis)
			WaitForTurn(ruparm, y_axis)
			WaitForTurn(ruparm, z_axis)
			WaitForTurn(rloarm, x_axis)
			WaitForTurn(rloarm, y_axis)
			WaitForTurn(rloarm, z_axis)
			WaitForTurn(rhand, x_axis)
			WaitForTurn(rhand, y_axis)
			WaitForTurn(rhand, z_axis)
		else
			Turn2( chest, x_axis, -25, 300 )
			Turn2( chest, y_axis, 20, 300 )		
			Turn2( ruparm, x_axis, -10, 300 )
			Turn2( rloarm, x_axis, -80, 300 )
			Turn2( rhand, x_axis, -20, 300 )		
			WaitForTurn(rhand, x_axis)
			WaitForTurn(rloarm, x_axis)
			Turn2( chest, x_axis, 22.5, 500 )
			Turn2( chest, y_axis, -30, 500 )			
			Turn2( ruparm, x_axis, 10, 500 )
			Turn2( rloarm, x_axis, -20, 500 )
			Turn2( rhand, x_axis, 20, 800 )
			local x, y, z = Spring.GetUnitPosition(unitID)
			Spring.PlaySoundFile("sounds/swoosh.wav", 80, x, y, z)
			WaitForTurn(ruparm, x_axis)
			WaitForTurn(rloarm, x_axis)
			WaitForTurn(rhand, x_axis)
			Sleep(300)
			Turn2( chest, x_axis, 0, 400 )
			Turn2( chest, y_axis, 0, 400 )
			Turn2( chest, z_axis, 0, 400 )
			Turn2( ruparm, x_axis, 0, 400 )
			Turn2( ruparm, y_axis, 0, 400 )
			Turn2( ruparm, z_axis, 0, 400 )
			Turn2( rloarm, x_axis, 0, 400 )
			Turn2( rloarm, y_axis, 0, 400 )
			Turn2( rloarm, z_axis, 0, 400 )
			Turn2( rhand, x_axis, 0, 400 )
			Turn2( rhand, y_axis, 0, 400 )
			Turn2( rhand, z_axis, 0, 400 )	
			WaitForTurn(chest, x_axis)
			WaitForTurn(chest, y_axis)
			WaitForTurn(chest, z_axis)
			WaitForTurn(ruparm, x_axis)
			WaitForTurn(ruparm, y_axis)
			WaitForTurn(ruparm, z_axis)
			WaitForTurn(rloarm, x_axis)
			WaitForTurn(rloarm, y_axis)
			WaitForTurn(rloarm, z_axis)
			WaitForTurn(rhand, x_axis)
			WaitForTurn(rhand, y_axis)
			WaitForTurn(rhand, z_axis)
		end
	end
	Turn2( lshoulder, x_axis, 0, 400 )	
	Turn2( luparm, x_axis, 0, 500 )
	Turn2( lloarm, x_axis, 0, 400 )	
	Turn2( chest, x_axis, 0, 300 )	
	Sleep(300)
	attacking=false
	return(1)	
end

------------------------------------------------------------------------------------------

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	local px, py, pz = Spring.GetUnitPosition(unitID)
	EmitSfx(pelvis, BLOODSPLASH)
	EmitSfx(head, BLOODSPRAY)
	if (math.random() > 0.5) then
		Spring.PlaySoundFile("sounds/dying_man.wav", 10, px, py, pz)	
	else
		Spring.PlaySoundFile("sounds/dying_man_2.wav", 10, px, py, pz)		
	end		
	if (severity > 0.5) then
		Explode(shield, SFX.FALL + SFX.NO_HEATCLOUD)	
		Explode(sword, SFX.FALL + SFX.NO_HEATCLOUD)		
		return 2
	else
		Turn2( pelvis, x_axis, 90, 250 )
		Turn2( lloarm, x_axis, -137, 15 )
		Turn2( rloarm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Explode(shield, SFX.FALL + SFX.NO_HEATCLOUD)	
		Explode(sword, SFX.FALL + SFX.NO_HEATCLOUD)			
		Move( base, y_axis, -50, 400)
		WaitForTurn(pelvis, x_axis)
		return (1)
	end
end
