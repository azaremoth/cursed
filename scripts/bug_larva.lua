------------------------------------

local base = piece 'base'
local chest = piece 'chest'
local head = piece 'head'
local emit = piece 'emit'

local neck = piece 'neck'
local tail_01 = piece 'tail_01'
local tail_02 = piece 'tail_02'
local tail_03 = piece 'tail_03'
local tail_04 = piece 'tail_04'
local tail_05 = piece 'tail_05'
local tail_06 = piece 'tail_06'

local horn_01 = piece 'horn_01'
local horn_02 = piece 'horn_02'
local horn_03 = piece 'horn_03'
local horn_04 = piece 'horn_04'
local horn_05 = piece 'horn_05'
local horn_06 = piece 'horn_06'

local leg_front_r = piece 'leg_front_r'
local leg_mid_r = piece 'leg_mid_r'
local leg_rear_r = piece 'leg_rear_r'
local leg_front_l = piece 'leg_front_l'
local leg_mid_l = piece 'leg_mid_l'
local leg_rear_l = piece 'leg_rear_l'

local bored = false
local moving = false
local aiming = false
local inbunker = false
local burrowed = false
local jumping = false
local parried = false
local isparrying = false
local indeepwater = false

local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_WALK = 4

local SUMMONING	 = 1024+0
local BLOODBLAST	 = 1025+0
local BURROWING	 = 1026+0

---- FOR BORED ANIMATION and other randomizations -----
local rturn = (math.random()*30)
local lturn = (math.random()*(-30))
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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/4000)
	MOVEANIMATIONSLEEPTIME = (80000000/GetUnitValue(COB.MAX_SPEED))

	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
end

local echo = Spring.Echo


-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)

	while true do
	
   		if moving then 
			Turn2( leg_front_r, y_axis, 60, MOVEANIMATIONSPEED*6 )
			Turn2( leg_rear_l, y_axis, -70, MOVEANIMATIONSPEED*6 )
			
			Turn2( leg_mid_r, y_axis, -50, MOVEANIMATIONSPEED*6 )
			Turn2( leg_mid_l, y_axis, 50, MOVEANIMATIONSPEED*6 )
			
			Turn2( leg_front_l, y_axis, -70, MOVEANIMATIONSPEED*6 )
			Turn2( leg_rear_r, y_axis, 60, MOVEANIMATIONSPEED*6 )
		
			Turn2( tail_01, y_axis, 15, MOVEANIMATIONSPEED )
			Turn2( tail_02, y_axis, 15, MOVEANIMATIONSPEED )
			Turn2( tail_03, y_axis, 15, MOVEANIMATIONSPEED )
			Turn2( tail_04, y_axis, -15, MOVEANIMATIONSPEED )
			Turn2( tail_05, y_axis, -15, MOVEANIMATIONSPEED*2 )
			Turn2( tail_06, y_axis, -15, MOVEANIMATIONSPEED*2 )

			if not aiming then
				Move( chest, x_axis, 5, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, -15, MOVEANIMATIONSPEED )
				Turn2( neck, y_axis, -15, MOVEANIMATIONSPEED )
			end
	  
		Sleep(MOVEANIMATIONSLEEPTIME)
  
   		end 
   		if moving then 

			Turn2( leg_front_r, y_axis, -70, MOVEANIMATIONSPEED*6 )
			Turn2( leg_rear_l, y_axis, 50, MOVEANIMATIONSPEED*6 )

			Turn2( leg_mid_r, y_axis, 50, MOVEANIMATIONSPEED*6 )
			Turn2( leg_mid_l, y_axis, -50, MOVEANIMATIONSPEED*6 )			
			
			Turn2( leg_front_l, y_axis, 80, MOVEANIMATIONSPEED*6 )
			Turn2( leg_rear_r, y_axis, -70, MOVEANIMATIONSPEED*6 )
		
			Turn2( tail_01, y_axis, -15, MOVEANIMATIONSPEED )
			Turn2( tail_02, y_axis, -15, MOVEANIMATIONSPEED )
			Turn2( tail_03, y_axis, -15, MOVEANIMATIONSPEED )
			Turn2( tail_04, y_axis, 15, MOVEANIMATIONSPEED )
			Turn2( tail_05, y_axis, 15, MOVEANIMATIONSPEED*2 )
			Turn2( tail_06, y_axis, 15, MOVEANIMATIONSPEED*2 )

			if not aiming then
				Move( chest, x_axis, -5, MOVEANIMATIONSPEED )
				Turn2( head, y_axis, 15, MOVEANIMATIONSPEED )
				Turn2( neck, y_axis, 15, MOVEANIMATIONSPEED )			
			end
			Sleep(MOVEANIMATIONSLEEPTIME)
   		end 

		if not moving and not bored then
			Move( chest, x_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( tail_01, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( tail_02, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( tail_03, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( tail_04, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( tail_05, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( tail_06, y_axis, 0, MOVEANIMATIONSPEED )

			Turn2( leg_front_r, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( leg_mid_r, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( leg_rear_r, y_axis, 0, MOVEANIMATIONSPEED )		
			Turn2( leg_front_l, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( leg_mid_l, y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( leg_rear_l, y_axis, 0, MOVEANIMATIONSPEED )			
		
			if not aiming then

					Turn2( head, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( neck, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_01, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_02, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_03, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_04, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_05, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( tail_06, x_axis, 0, MOVEANIMATIONSPEED )
					Turn2( head, y_axis, 0, MOVEANIMATIONSPEED )
					Turn2( neck, y_axis, 0, MOVEANIMATIONSPEED )	
		
			end			
		end
		Sleep(30)		
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not jumping and not burrowed and not aiming then			
			borednumber = math.random(50)
			if (borednumber > 48) then
				bored = true
				Turn2( head, y_axis, -20, MOVEANIMATIONSPEED )
				Turn2( neck, y_axis, -20, MOVEANIMATIONSPEED )
				Turn2( tail_03, y_axis, 15, MOVEANIMATIONSPEED )				
				Turn2( tail_04, y_axis, 30, MOVEANIMATIONSPEED )
				Turn2( tail_05, y_axis, 30, MOVEANIMATIONSPEED )
				Turn2( tail_06, y_axis, 30, MOVEANIMATIONSPEED )
				Sleep(600)	
				Turn2( head, y_axis, 20, MOVEANIMATIONSPEED )
				Turn2( neck, y_axis, 20, MOVEANIMATIONSPEED )
				Turn2( tail_03, y_axis, -15, MOVEANIMATIONSPEED )					
				Turn2( tail_04, y_axis, -30, MOVEANIMATIONSPEED )				
				Turn2( tail_05, y_axis, -30, MOVEANIMATIONSPEED )
				Turn2( tail_06, y_axis, -30, MOVEANIMATIONSPEED )
				Sleep(600)	
			end
		end
	Sleep(1300)	
	bored = false
	end
end

------------------------ ACTIVATION

local function BurrowAnim()
	Signal(SIG_WALK)
	moving = false
	GG.Freeze(unitID,UnitDefs,teamID)	
	EmitSfx(base,BURROWING)
	Move( base, y_axis, 0, 3000 )		
	Turn2( chest, x_axis, 90, 400 )
	Sleep(200)
	EmitSfx(base,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digin.wav", 30, x, y, z)
	Move( chest, y_axis, -150, 300 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',1)
	burrowed = true
	return(1)
end

local function UnBurrowAnim()
	Signal(SIG_WALK)
	EmitSfx(base,BURROWING)
	Turn2( chest, x_axis, -90, 2000 )
	Turn2( head, x_axis, 0, 400 )
	Sleep(200)
	EmitSfx(base,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digout.wav", 30, x, y, z)
	
	Turn2( chest, x_axis, 0, 180 )	
	Move( chest, y_axis, 0, 400 )
	EmitSfx(base,BURROWING)
	GG.UnFreeze(unitID,UnitDefs,teamID)	
	Sleep(100)
	
	Spring.SetUnitRulesParam(unitID,'burrowed',0)
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

local function Watercheck()
	while true do
      	local x, y, z = Spring.GetUnitPosition(unitID)
		if y < (-40) then
			indeepwater = true
			end
		if y > (-40) then
			indeepwater = false
			end
--		Spring.Echo("unit center in deep water", y, indeepwater)
		Sleep(300)
	end
end

function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 6000
	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	
			EmitSfx(base,SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread( Walkscript )
	StartThread( Watercheck )
	StartThread( BoredAnimation )
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end

----------------------------------------------------------------------------

local function RestoreAfterDelay()
	Sleep(5000)
	aiming=false	
	return (0)
end
--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 () return tail_06 end

function script.AimFromWeapon1 () return chest end

local function Aim(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if burrowed or inbunker or isparrying then
		return false
	end
   	local SIG_AIM = 2
   	Signal(SIG_AIM)
   	SetSignalMask(SIG_AIM)
	aiming=true	
	
	Turn2( head, x_axis, -20, MOVEANIMATIONSPEED*3 )
	Turn2( neck, x_axis, -20, MOVEANIMATIONSPEED*3 )
	Turn2( tail_01, x_axis, 30, MOVEANIMATIONSPEED*3 )
	Turn2( tail_02, x_axis, 30, MOVEANIMATIONSPEED*3 )
	Turn2( tail_03, x_axis, 30, MOVEANIMATIONSPEED*3 )
	Turn2( tail_04, x_axis, 30, MOVEANIMATIONSPEED*3 )
	Turn2( tail_05, x_axis, 30, MOVEANIMATIONSPEED*3 )
	Turn2( tail_06, x_axis, 30, MOVEANIMATIONSPEED*3 )	
	
	Turn(head, y_axis, heading, MOVEANIMATIONSPEED*3)

	
	WaitForTurn(head, y_axis)
	StartThread( RestoreAfterDelay) 	
	
   	return true
end
   
function script.AimWeapon1(heading, pitch)
   	return Aim(heading, pitch)
end
  
function script.Shot1()
end

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
	elseif jumping then
		return(0)
	else
		return(damage)
	end
end	

function script.HitByWeapon ( x, z, weaponDefID, damage )
	if jumping then
--		jumpingdamage = (jumpingdamage + damage)
--		Spring.Echo(jumpingdamage)
		return(0)
	elseif inbunker then
		return(0)
	else
			return(damage)	
	end
end


function script.Killed( damage, health )
	local severity = (damage/health) * 100
	if (burrowed) then
		return 2
	else
		EmitSfx(chest,BLOODBLAST)
		EmitSfx(tail_05,BLOODBLAST)	
		return 1	
	end	
end