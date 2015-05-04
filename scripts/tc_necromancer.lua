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
local joint = piece 'joint'
local rthumb = piece 'rthumb'
local staff = piece 'staff'
local emit = piece 'emit'
local skull = piece 'skull'
local emit_pentagram = piece 'emit_pentagram'
local restore_delay, moving, attacking, MOVEANIMATIONSPEED, inbunker, parried, isparrying, ISBUILDING

local SIG_AIM1 = 2
local SIG_WALK = 4

local buildheading = 0

local ATK_CHEST_SPEED_B = 300
local ATK_CHEST_SPEED_F = 400
local ATK_CHEST_SPEED_S = 400

local ATK_UPARM_SPEED_B = 450
local ATK_UPARM_SPEED_F = 400
local ATK_LOARM_SPEED_B = 450
local ATK_LOARM_SPEED_F = 1000

local ATK_RHAND_SPEED_B = 450
local ATK_RHAND_SPEED_F = 400

local BUILDING_NECROMANCER 	= 1024+0
local PENTAGRAM 			= 1025+0
local SPIKES_NECROMANCER 	= 1026+0
local BLOODSPRAY 	= 1027+0

local BUILD_SPEED    = 65

local rturn = (math.random()*50)
local lturn = (math.random()*(-50))

local parrychance = 0.4 --40% parry chance

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/2500)
	MOVEANIMATIONSLEEPTIME = (25000000/GetUnitValue(COB.MAX_SPEED))
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
			if not attacking and not ISBUILDING then 
				Turn2( ruparm, x_axis, 30, MOVEANIMATIONSPEED*2 )
			end
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lthigh, x_axis, -25, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*1.8 )
			Sleep(MOVEANIMATIONSLEEPTIME)				
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not ISBUILDING then 
				Turn2( luparm, x_axis, -60, MOVEANIMATIONSPEED*2.5 )
				Turn2( chest, z_axis, -5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, 3, MOVEANIMATIONSPEED*0.3 )
				end
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not ISBUILDING then 
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( chest, z_axis, 5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, -3, MOVEANIMATIONSPEED*0.3 )
			end
			Turn2( lthigh, x_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*1.8 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking and not ISBUILDING then 
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED*2 )
			end
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end	
		if not moving and not ISBUILDING then
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )	
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
			if not attacking and not ISBUILDING then  
				Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*2 )			
				Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*2 )					
				WaitForTurn( chest, y_axis )	
			end
		end
		Sleep(30)	
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not ISBUILDING then		
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

local function Glowingstaff()
	while true do
		if ISBUILDING then
			EmitSfx( emit,  BUILDING_NECROMANCER )
--		else
--			EmitSfx( emit,  SPIKES_NECROMANCER )
		end		
		Sleep(50)
	end
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end

--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
	  Show (chest)		  
	  Show (head)
	  Show (staff)		  
	  Show (skull)  
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	
   elseif (curTerrainType == 0) then
	  Hide (chest)	  
	  Hide (head)
	  Hide (staff)	  
	  Hide (skull)
      inbunker = true
	  Spring.SetUnitNeutral(unitID, true)
   end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	local rndnr = math.random()
	isparrying = false	
	if inbunker then
		return(0)
	elseif (weaponDefID >= 0) then -- if units are crushed the weaponDefID seems to be smaller 0
		if ( WeaponDefs[weaponDefID].description == [[Melee]] and (z>0) and (rndnr < parrychance) ) then
			isparrying = true
			StartThread(MeleeAnimations)	
			return(0)
		end
	else
		return(damage)		
	end
end

----------------- Builder --------------------------------------------------
local function BuildingAnimation()
	while true do
		if ISBUILDING then
			Turn2( luparm , x_axis, -90, BUILD_SPEED )
			EmitSfx( emit_pentagram, PENTAGRAM )
			Sleep(650)
			Turn2( luparm , x_axis, -50, BUILD_SPEED )
			Sleep(650)
		end
		if ISBUILDING then
			Turn2( base , y_axis, buildheading, 100 )
		end
		if  not ISBUILDING then
			Turn2( base , y_axis, 0, 200 )
		end
	Sleep(10)
	end
end


function script.Activate()
	--spSetUnitShieldState(unitID, true)
end

function script.Deactivate()
	--spSetUnitShieldState(unitID, false)
end

function script.StopBuilding()
	ISBUILDING = false
	SetUnitValue(COB.INBUILDSTANCE, 0)	
	
	Turn2( chest , x_axis,0, BUILD_SPEED )
	Turn2( skull , x_axis,0, BUILD_SPEED )

	Turn2( luparm , x_axis,0, BUILD_SPEED )
	Turn2( lloarm , x_axis,0, BUILD_SPEED )
	Turn2( lhand , x_axis,0, BUILD_SPEED )

	Turn2( ruparm , x_axis,0, BUILD_SPEED )
	Turn2( rloarm , x_axis,0, BUILD_SPEED )
	Turn2( rloarm , y_axis,0, BUILD_SPEED )	
	
	WaitForTurn(chest, x_axis)
	WaitForTurn(luparm, x_axis)
	WaitForTurn(ruparm, x_axis)
	WaitForTurn(lloarm, x_axis)
	WaitForTurn(lhand, x_axis)
end

function script.StartBuilding(heading, pitch)
	buildheading = heading

	Turn2( chest , x_axis, 10, BUILD_SPEED )
	Turn2( skull , x_axis, -35, BUILD_SPEED )

	Turn2( luparm , x_axis, -50, BUILD_SPEED )
	Turn2( lloarm , x_axis, 73, BUILD_SPEED )
	Turn2( lhand , x_axis, 39, BUILD_SPEED )

	Turn2( ruparm , x_axis, -77, BUILD_SPEED )
	Turn2( rloarm , x_axis, 11, BUILD_SPEED )
	Turn2( rloarm , y_axis, -13, BUILD_SPEED )	

	WaitForTurn(chest, x_axis)
	WaitForTurn(luparm, x_axis)
	WaitForTurn(ruparm, x_axis)
	WaitForTurn(lloarm, x_axis)
	WaitForTurn(lhand, x_axis)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	ISBUILDING = true
end

function script.QueryNanoPiece()
--	GG.LUPS.QueryNanoPiece(unitID,unitDefID,Spring.GetUnitTeam(unitID),nanospray)
	return emit
end

--------------------------------------------------------------------------------

function script.Create()
	SetMoveAnimationSpeed()
	moving = false
	parried = false
	attacking=false
	isparrying = false
	restore_delay = 1000
    ISBUILDING = false

	Turn2( emit_pentagram , x_axis, -90)

	Move( pelvis , y_axis, -2  )
	Turn2( lthigh , x_axis, -73 )
	Turn2( lleg , x_axis, 72 )
	Turn2( rleg , x_axis, 72 )	
	Turn2( rfoot , x_axis, 53 )
	Turn2( luparm , x_axis, -88 )
	Turn2( lloarm , x_axis, 70 )
	Turn2( head , x_axis, 35 )
	Turn2( ruparm , x_axis, -20 )	
	Turn2( ruparm , y_axis, 70 )	
	Turn2( ruparm , z_axis, 20 )
	Turn2( rloarm , y_axis, 50 )	
	Turn2( rloarm , z_axis, 65 )	
	
	----------------------------------START BUILD CYCLE
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--------------------------------/END BUILD CYCLE
	
	Move( pelvis , y_axis, 0 , 500 )
	Turn2( lthigh , x_axis, 0, 200 )
	Turn2( lleg , x_axis, 0, 200 )
	Turn2( rleg , x_axis, 0, 200 )	
	Turn2( rfoot , x_axis, 0, 200 )			
	Turn2( luparm , x_axis, 0, 200 )
	Turn2( lloarm , x_axis, 0, 200 )
	Turn2( head , x_axis, 0, 200 )
	Turn2( ruparm , x_axis, 0, 200 )	
	Turn2( ruparm , y_axis, 0, 200 )	
	Turn2( ruparm , z_axis, 0, 200 )
	Turn2( rloarm , y_axis, 0, 200 )	
	Turn2( rloarm , z_axis, 0, 200 )	

	Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)
	StartThread(Walkscript)
	StartThread(Glowingstaff)
	StartThread(BuildingAnimation)
	StartThread( BoredAnimation )	
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return chest
end

function script.AimWeapon1(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if inbunker or isparrying then
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
--[[	if attacking then
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
			Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*4 )		
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
			Turn2( rloarm, x_axis, 30, 500 )
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
	end]]--
	if isparrying then
		Turn2( lloarm, x_axis, 0, 400 )
		Turn2( lloarm, y_axis, 0, 400 )
		Turn2( lloarm, z_axis, 0, 400 )
		Turn2( lhand, x_axis, 0, 400 )
		Turn2( lhand, y_axis, 0, 400 )
		Turn2( lhand, z_axis, 90, 400 )
		Turn2( luparm, x_axis, 30, 500 )
		Turn2( luparm, y_axis, 0, 450 )
		Turn2( luparm, z_axis, 0, 500 )
		Sleep(300)
		EmitSfx(lhand, SPIKES_NECROMANCER)		
		Sleep(200)
		Turn2( luparm, x_axis,0, 400 )
		Turn2( lhand, z_axis, 0, 400 )
	end
	Sleep(300)	
	attacking=false
	isparrying = false
	return(1)	
end

function script.Killed( damage, health )
	local severity = (damage/health) * 100
	if severity > 50 then
		EmitSfx(pelvis, BLOODSPRAY)
		EmitSfx(head, BLOODSPRAY)
		Explode(staff, SFX.FALL + SFX.NO_HEATCLOUD)		
		return 2
	else
		Turn2( pelvis, x_axis, 90, 250 )
		Turn2( luparm, x_axis, -137, 15 )
		Turn2( ruparm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( base, y_axis, -50, 400)
		Sleep(200)
		EmitSfx(pelvis,BLOODSPRAY)
		EmitSfx(head,BLOODSPRAY)
		return (1)
	end
end