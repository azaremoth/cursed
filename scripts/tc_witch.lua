------------------------------------
local base = piece 'base'
local rotator = piece 'rotator'
local rskull = piece 'rskull'
local lskull = piece 'lskull'
local rshoulder = piece 'rshoulder'
local relbow = piece 'relbow'
local torso = piece 'torso'
local rthigh = piece 'rthigh'
local lthigh = piece 'lthigh'
local llleg = piece 'llleg'
local rlleg = piece 'rlleg'
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
local staff = piece 'staff'
local emit_gun = piece 'emit_gun'
local emit_gun2 = piece 'emit_gun2'
local emit_groundflash = piece 'emit_groundflash'
local bunker_emit = piece 'bunker_emit'
local bunker_turret = piece 'bunker_turret'

local moving = false
local attacking = false
local isbuilding = false
local inbunker = false
local buildheading = 0
local restore_delay, MOVEANIMATIONSPEED

local MOVEANIMATIONSLEEPTIME = 340
local manacost = 75

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 1

local BLOODSPLASH	 = 1024+0
local FLARE	 = 1025+0
local DOMINATE	 = 1026+0
local GROUNDFLASH	 = 1027+0

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/7000)
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
			Turn2( rlleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, y_axis, 0, MOVEANIMATIONSPEED*2 )		
			if not attacking and not isbuilding then 
					
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED*3 )
				Turn2( ruparm, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( ruparm, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, x_axis, 20, MOVEANIMATIONSPEED*3 )
				Turn2( rloarm, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rhand, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rhand, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rhand, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED*3 )
				Turn2( luparm, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( luparm, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, x_axis, -60, MOVEANIMATIONSPEED*3 )
				Turn2( lloarm, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lhand, y_axis, 0, MOVEANIMATIONSPEED*2 )
				
			end
			Turn2( lthigh, x_axis, -35, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rlleg, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Sleep(MOVEANIMATIONSLEEPTIME)		
			end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not isbuilding then 
				Turn2( torso, z_axis, -1, MOVEANIMATIONSPEED/2 )
				Turn2( head, z_axis, 5, MOVEANIMATIONSPEED*0.3 )
				end
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rlleg, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( torso, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not isbuilding then 
				Turn2( torso, z_axis, 1, MOVEANIMATIONSPEED/2 )
				Turn2( head, z_axis, -5, MOVEANIMATIONSPEED*0.3 )
				
				Turn2( ruparm, x_axis, 30, MOVEANIMATIONSPEED*2.5	)
				Turn2( rloarm, x_axis, -60, MOVEANIMATIONSPEED*2.5 )				
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED*4 )
				Turn2( lloarm, x_axis, 45, MOVEANIMATIONSPEED*2.5 )				
				
				end
			Turn2( lthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -35, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( rlleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			end
		if moving then
			SetMoveAnimationSpeed()
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rlleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( torso, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
			end
		if moving then 
			Turn2( llleg, x_axis, 0, (MOVEANIMATIONSPEED*1.6) )
			Move( torso, y_axis, 0, 8 )
			WaitForTurn(rthigh, x_axis)
			end
		if not moving then
			Turn2( rlleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( llleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( rlleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( llleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( torso, y_axis, 0, 8 )		
			if not attacking and not isbuilding then 
				Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( ruparm, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( ruparm, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( rloarm, x_axis, -85, MOVEANIMATIONSPEED )
				Turn2( rloarm, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( rloarm, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( rhand, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rhand, y_axis, -71, MOVEANIMATIONSPEED*2 )
				Turn2( rhand, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( luparm, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( luparm, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( lloarm, x_axis, -105, MOVEANIMATIONSPEED )
				Turn2( lloarm, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( lloarm, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( lhand, x_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lhand, y_axis, -70, MOVEANIMATIONSPEED*2 )
				Turn2( lhand, z_axis, 0, MOVEANIMATIONSPEED*2 )				

				Turn2( torso, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, 0, MOVEANIMATIONSPEED )
				WaitForTurn( torso, y_axis )	
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
				Turn2( head, y_axis, 30, MOVEANIMATIONSPEED*1.5 )			
				WaitForTurn( torso, y_axis )
			elseif (borednumber < 5)then	
				Turn2( head, y_axis, -30, MOVEANIMATIONSPEED*1.5 )	
				WaitForTurn( torso, y_axis )
			else 
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*1.5 )	
				WaitForTurn( torso, y_axis )				
			end
		end
	Sleep(1500)		
	end
end

----------------- Builder --------------------------------------------------
local function BuildingAnimation()
	while true do
		if isbuilding then
--			Turn2( base , y_axis, buildheading, 100 )		
			Turn2( rloarm , x_axis, -41, MOVEANIMATIONSPEED*2 )
			Turn2( lloarm , x_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( rhand , x_axis, 63, MOVEANIMATIONSPEED*2 )
			Turn2( staff , x_axis, 21, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , x_axis, -60, MOVEANIMATIONSPEED*2 )
			WaitForTurn( ruparm, x_axis )	
		end
		if isbuilding then
			Turn2( ruparm , x_axis, -20, MOVEANIMATIONSPEED*2 )
			WaitForTurn( ruparm, x_axis )				
		end
	Sleep(50)
	end
end

local function BuildingFlare()
	while true do
		if isbuilding then
			EmitSfx(emit_gun, DOMINATE)
		end
	Sleep(50)
	end
end


function script.Activate()
end

function script.Deactivate()
end

function script.StopBuilding()
	SetUnitValue(COB.INBUILDSTANCE, 0)
	isbuilding = false
end

function script.StartBuilding(heading, pitch)
	buildheading = heading
	SetUnitValue(COB.INBUILDSTANCE, 1)	
	isbuilding = true
end

function script.QueryNanoPiece()
	return emit_gun
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
	Move( rotator, y_axis, 450 )	
	Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)	
	StartThread( Walkscript )
	StartThread( BoredAnimation )
	StartThread( BuildingAnimation )
	StartThread( BuildingFlare )
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
	Turn2( torso, y_axis, 0, 55 )
	Turn2( torso, x_axis, 0, 30 )
	return (0)
end

--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
	  Spring.UnitScript.Show(staff)   
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	  	  
   elseif (curTerrainType == 0) then
	  Spring.UnitScript.Hide(staff)   
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

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit_gun
end

function script.AimFromWeapon1 ()
	return torso
end

function script.AimWeapon1(heading, pitch)
	attacking=true
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	
	Turn2( ruparm, x_axis, -43, MOVEANIMATIONSPEED*4 )
	Turn2( rloarm, x_axis, -41, MOVEANIMATIONSPEED*4 )
	Turn2( lloarm, x_axis, 0, MOVEANIMATIONSPEED*4 )
	Turn2( rhand, x_axis, 63, MOVEANIMATIONSPEED*4 )
	Turn2( staff, x_axis, 21, MOVEANIMATIONSPEED*4 )
	
	Turn( head, y_axis, heading, MOVEANIMATIONSPEED*4 )
	Turn( rshoulder, y_axis, heading, MOVEANIMATIONSPEED*4 )
	Turn( relbow, x_axis, -pitch, MOVEANIMATIONSPEED*4 )
	
	StartThread( RestoreAfterDelay) 
      WaitForTurn( rshoulder, y_axis )
      WaitForTurn( relbow, x_axis )

	return true
end

function script.FireWeapon1()
		EmitSfx( emit_gun, FLARE )
		EmitSfx( emit_groundflash, GROUNDFLASH )
		Sleep(300)
		return(1)
end

--weapon 2 for bunker -----------------------------------------------------------------

function script.QueryWeapon2 ()
	return emit_gun2
end

function script.AimFromWeapon2 ()
	return rotator
end


function script.AimWeapon2 (heading, pitch)
	local currentmana = tonumber(Spring.GetUnitRulesParam(unitID,'mana'))
	if (currentmana < manacost) then
		-- local x, y, z = Spring.GetUnitPosition(unitID)
		-- Spring.PlaySoundFile("sounds/talk.wav", 80, x, y, z)	
		Spring.Echo("Not enough mana")
		return false
	else
		Turn( emit_gun2, y_axis, heading )
		Turn( emit_gun2, x_axis, -pitch )
	--	Signal(SIG_AIM2)
	--	SetSignalMask(SIG_AIM2)
		WaitForTurn( emit_gun2, x_axis )
		WaitForTurn( emit_gun2, y_axis )
		
		EmitSfx( emit_gun, FLARE )
		EmitSfx( staff, FLARE )
		EmitSfx( lhand, FLARE )
		EmitSfx( rhand, FLARE )		
		Spring.SetUnitRulesParam(unitID,'mana',(currentmana-manacost))	
		return true
	end
end

function script.FireWeapon2 ()
		return(1)
end

------------------------------------------------------------------------------------------

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	local px, py, pz = Spring.GetUnitPosition(unitID)
	EmitSfx(torso, BLOODSPLASH)
	Spring.PlaySoundFile("sounds/witch_death.wav", 10, px, py, pz)	
	if (severity > 0.5) then
		Explode(staff, SFX.FALL + SFX.NO_HEATCLOUD)	
		return 2
	else
		Turn2( torso, x_axis, 90, 250 )
		Turn2( lloarm, x_axis, -137, 15 )
		Turn2( rloarm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rlleg, z_axis, 252, 15 )
		Move( base, y_axis, -50, 400)
		WaitForTurn(torso, x_axis)
		return (1)
	end
end