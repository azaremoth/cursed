------------------------------------

local emit_melee = piece 'emit_melee'
local base = piece 'base'
local chest = piece 'chest'
local head = piece 'head'
local emit = piece 'emit'

local leg_front_up_r = piece 'leg_front_up_r'
local leg_front_up_l = piece 'leg_front_up_l'
local leg_front_low_r = piece 'leg_front_low_r'
local leg_front_low_l = piece 'leg_front_low_l'
local foot_front_r = piece 'foot_front_r'
local foot_front_l = piece 'foot_front_l'

local leg_rear_up_r = piece 'leg_rear_up_r'
local leg_rear_up_l = piece 'leg_rear_up_l'
local leg_rear_low_r = piece 'leg_rear_low_r'
local leg_rear_low_l = piece 'leg_rear_low_l'
local foot_rear_r = piece 'foot_rear_r'
local foot_rear_l = piece 'foot_rear_l'

local arm_up_r = piece 'arm_up_r'
local arm_up_l = piece 'arm_up_l'
local arm_low_r = piece 'arm_low_r'
local arm_low_l = piece 'arm_low_l'
local claw_r = piece 'claw_r'
local claw_l = piece 'claw_l'

local moving = false
local attacking = false
local aiming = false
local inbunker = false
local burrowed = false
local jumping = false
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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1300)
	MOVEANIMATIONSLEEPTIME = (90000000/GetUnitValue(COB.MAX_SPEED))
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
			Turn2( leg_front_up_r, y_axis, 40, MOVEANIMATIONSPEED )   	-- right front forward
			Turn2( leg_front_up_r, z_axis, -20, MOVEANIMATIONSPEED )       	-- right front up
			Turn2( leg_front_low_r, z_axis, -13, MOVEANIMATIONSPEED )
					
			Turn2( leg_rear_up_r, y_axis, -40, MOVEANIMATIONSPEED ) 	-- right back backward
			Turn2( leg_rear_up_r, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- right back down
			Turn2( leg_rear_low_r, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_front_up_l, y_axis, 40, MOVEANIMATIONSPEED ) 	-- left front backward
			Turn2( leg_front_up_l, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- left front down
			Turn2( foot_front_l, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_rear_up_l, y_axis, -40, MOVEANIMATIONSPEED ) 	-- left back forward
			Turn2( leg_rear_up_l, z_axis, 20, MOVEANIMATIONSPEED )       	-- left back up
			Turn2( foot_rear_l, z_axis, 13, MOVEANIMATIONSPEED )
	  
		if not attacking then
				Turn2( arm_up_r, x_axis, 10, MOVEANIMATIONSPEED/2 )
				Turn2( arm_up_r, y_axis, -5, MOVEANIMATIONSPEED )
				Turn2( arm_up_l, x_axis, -10, MOVEANIMATIONSPEED/2 )
				Turn2( arm_up_l, y_axis, 5, MOVEANIMATIONSPEED )			
		end
	  
		Sleep(MOVEANIMATIONSLEEPTIME)
  
   		end 
   		if moving then 
   		 
			Turn2( leg_front_up_r, y_axis, -40, MOVEANIMATIONSPEED ) 	-- right front backward
			Turn2( leg_front_up_r, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- right front down
			Turn2( leg_front_low_r, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_rear_up_r, y_axis, 40, MOVEANIMATIONSPEED )   	-- right back forward
			Turn2( leg_rear_up_r, z_axis, -20, MOVEANIMATIONSPEED )       	-- right back up
			Turn2( leg_rear_low_r, z_axis, -13, MOVEANIMATIONSPEED )
			
			Turn2( leg_front_up_l, y_axis, -40, MOVEANIMATIONSPEED ) 	-- left front forward
			Turn2( leg_front_up_l, z_axis, 20, MOVEANIMATIONSPEED )       	-- left front up
			Turn2( foot_front_l, z_axis, 13, MOVEANIMATIONSPEED )
			
			Turn2( leg_rear_up_l, y_axis, 40, MOVEANIMATIONSPEED ) 	-- left back backward
			Turn2( leg_rear_up_l, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- left back down
			Turn2( foot_rear_l, z_axis, 0, MOVEANIMATIONSPEED )
		
			if not attacking then
				Turn2( arm_up_r, x_axis, -10, MOVEANIMATIONSPEED/2 )
				Turn2( arm_up_r, y_axis, 0, MOVEANIMATIONSPEED )
				Turn2( arm_up_l, x_axis, 10, MOVEANIMATIONSPEED/2 )
				Turn2( arm_up_l, y_axis, 0, MOVEANIMATIONSPEED )	
			end
			Sleep(MOVEANIMATIONSLEEPTIME)
   		end 

		if not moving then	
			Turn2( leg_front_up_r, y_axis, rturn/2, MOVEANIMATIONSPEED ) 	-- right front backward
			Turn2( leg_front_up_r, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- right front down
			Turn2( leg_front_low_r, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_rear_up_r, y_axis, rturn, MOVEANIMATIONSPEED )   	-- right back forward
			Turn2( leg_rear_up_r, z_axis, 0, MOVEANIMATIONSPEED )       	-- right back up
			Turn2( leg_rear_low_r, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_front_up_l, y_axis, rturn, MOVEANIMATIONSPEED ) 	-- left front forward
			Turn2( leg_front_up_l, z_axis, 0, MOVEANIMATIONSPEED )       	-- left front up
			Turn2( foot_front_l, z_axis, 0, MOVEANIMATIONSPEED )
			
			Turn2( leg_rear_up_l, y_axis, rturn, MOVEANIMATIONSPEED ) 	-- left back backward
			Turn2( leg_rear_up_l, z_axis, 0, 6*MOVEANIMATIONSPEED )         	-- left back down
			Turn2( foot_rear_l, z_axis, 0, MOVEANIMATIONSPEED )
		
			if not attacking and not aiming then
				Turn2( arm_up_r, x_axis, 20, MOVEANIMATIONSPEED )
				Turn2( arm_up_r, y_axis, 30, MOVEANIMATIONSPEED )
				Turn2( arm_up_l, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( arm_up_l, y_axis, -20, MOVEANIMATIONSPEED )				
				
				Turn2( claw_r, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( claw_l, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( arm_low_l, x_axis, 0, MOVEANIMATIONSPEED )		
				Turn2( arm_low_l, y_axis, 0, MOVEANIMATIONSPEED )	
				
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED )				
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
			if (borednumber > 48) then
				Turn2( chest, x_axis, -30, MOVEANIMATIONSPEED )
				Turn2( leg_front_low_r, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( leg_rear_up_r, x_axis, 40, MOVEANIMATIONSPEED )
				Turn2( leg_front_low_l, x_axis, 30, MOVEANIMATIONSPEED )
				Turn2( leg_rear_up_l, x_axis, 40, MOVEANIMATIONSPEED )
				Turn2( arm_low_r, x_axis, 60, MOVEANIMATIONSPEED )
				Turn2( arm_low_l, x_axis, 60, MOVEANIMATIONSPEED )				
			Sleep(300)	
				Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( leg_front_low_r, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( leg_rear_up_r, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( leg_front_low_l, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( leg_rear_up_l, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( arm_low_r, x_axis, 0, MOVEANIMATIONSPEED )
				Turn2( arm_low_l, x_axis, 0, MOVEANIMATIONSPEED )				
			end
		end
	Sleep(1300)		
	end
end

------------------------ ACTIVATION

local function BurrowAnim()
	Signal(SIG_WALK)
	moving = false
	attacking = false
	GG.Freeze(unitID,UnitDefs,teamID)	
	EmitSfx(base,BURROWING)
	Move( base, y_axis, 0, 3000 )		
	Turn2( chest, x_axis, 90, 400 )
	
	Turn2( leg_front_up_r, z_axis, 100, 300 )
	Turn2( leg_rear_up_r, z_axis, 100, 300 )	
	Turn2( leg_front_up_l, z_axis, -100, 300 )
	Turn2( leg_rear_up_l, z_axis, -100, 300 )		
	Turn2( leg_front_low_r, z_axis, -60, 300 )
	Turn2( leg_rear_low_r, z_axis, -60, 300 )	
	Turn2( leg_front_low_l, z_axis, 60, 300 )
	Turn2( leg_rear_low_l, z_axis, 60, 300 )		
	
	Sleep(200)
	EmitSfx(base,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digin.wav", 30, x, y, z)
	Move( chest, y_axis, -150, 300 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',1)
	GG.UpdateUnitAttributes(unitID) -- attribute change by unit_attributes			
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
	
	Turn2( leg_front_up_r, z_axis, 0, 180 )
	Turn2( leg_rear_up_r, z_axis, 0, 180 )	
	Turn2( leg_front_up_l, z_axis, 0, 180 )
	Turn2( leg_rear_up_l, z_axis, 0, 180 )		
	Turn2( leg_front_low_r, z_axis, 0, 180 )
	Turn2( leg_rear_low_r, z_axis, 0, 180 )	
	Turn2( leg_front_low_l, z_axis, 0, 180 )
	Turn2( leg_rear_low_l, z_axis, 0, 180 )		
	Turn2( chest, x_axis, 0, 180 )	
	Move( chest, y_axis, 0, 400 )
	EmitSfx(base,BURROWING)
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
  
local function RestoreAfterDelay()
	Sleep(restore_delay)
	aiming=false	
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 () return emit_melee end

function script.AimFromWeapon1 () return emit_melee end

local function Aim(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if burrowed or inbunker then
		return false
	end
   	local SIG_AIM = 2
   	Signal(SIG_AIM)
   	SetSignalMask(SIG_AIM)
	aiming=true		
	Turn(head, y_axis, heading, 50)
	WaitForTurn(head, y_axis)
	StartThread( RestoreAfterDelay) 	
   	return true
end
   
function script.AimWeapon1(heading, pitch)
   	return Aim(heading, pitch)
end
  
function script.Shot1()
	attacking=true
	StartThread(MeleeAnimations)
end
	
function MeleeAnimations()
	if attacking then
	-- lean back
		Turn2( chest, x_axis, -30, 300 )
		Turn2( leg_front_up_r, x_axis, 40, 300 )
		Turn2( leg_rear_up_r, x_axis, 40, 300 )
		Turn2( leg_front_up_l, x_axis, 40, 300 )
		Turn2( leg_rear_up_l, x_axis, 40, 300 )

		Turn2( arm_up_r, x_axis, -20, 300 )
		Turn2( arm_up_r, y_axis, 0, 300 )
		Turn2( arm_up_l, x_axis, -20, 300 )
		Turn2( arm_up_l, y_axis, 0, 300 )
		
		Turn2( claw_r, x_axis, 0, 300 )
		Turn2( arm_low_r, x_axis, -30, 300 )
		Turn2( arm_low_r, y_axis, 0, 300 )
		Turn2( claw_l, x_axis, 0, 300 )
		Turn2( arm_low_l, x_axis, -30, 300 )		
		Turn2( arm_low_l, y_axis, 0, 300 )	
		
		WaitForTurn( arm_low_r, x_axis )		
      	local x, y, z = Spring.GetUnitPosition(unitID)
		Spring.PlaySoundFile("sounds/swoosh.wav", 30, x, y, z)
		
		Turn2( chest, x_axis, 0, 300 )
		Turn2( leg_front_up_r, x_axis, 0, 300 )
		Turn2( leg_rear_up_r, x_axis, 0, 300 )
		Turn2( leg_front_up_l, x_axis, 0, 300 )
		Turn2( leg_rear_up_l, x_axis, 0, 300 )		
		
		Turn2( arm_up_r, x_axis, 30, 800 )
		Turn2( arm_up_r, y_axis, 0, 800 )
		Turn2( arm_up_l, x_axis, 30, 1000 )
		Turn2( arm_up_l, y_axis, 0, 800 )				
		
		Turn2( claw_r, x_axis, -60, 800 )
		Turn2( arm_low_r, x_axis, 40, 800 )
		Turn2( arm_low_r, y_axis, 20, 800 )
		Turn2( claw_l, x_axis, -60, 800 )
		Turn2( arm_low_l, x_axis, 40, 800 )		
		Turn2( arm_low_l, y_axis, -15, 800 )		
	--back to null position
	end
	Sleep(300)		
	attacking=false
	return(1)	
end	

function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
      inbunker = false
   elseif (curTerrainType == 0) then
      inbunker = true
   end
end

--Jumps
function script.preJump(turn, distance)
end

function script.beginJump()
	moving = false
	jumping = true
	Turn2( chest, x_axis, -30, 400 )	
	Turn2( leg_front_low_r, x_axis, 50, 400 )
	Turn2( leg_front_low_l, x_axis, 40, 400 )
	Turn2( leg_rear_low_r, x_axis, 50, 400 )
	Turn2( leg_rear_low_l, x_axis, 60, 400 )	
	Turn2( foot_front_r, x_axis, 50, 400 )
	Turn2( foot_front_l, x_axis, 60, 400 )
	Turn2( foot_rear_r, x_axis, 50, 400 )
	Turn2( foot_rear_l, x_axis, 40, 400 )	
end


function script.jumping()
end

function script.halfJump()
	Turn2( chest, x_axis, 10, 400 )
	Turn2( leg_front_low_r, x_axis, 0, 400 )
	Turn2( leg_front_low_l, x_axis, 0, 400 )
	Turn2( leg_rear_low_r, x_axis, 0, 400 )
	Turn2( leg_rear_low_l, x_axis, 0, 400 )	
	Turn2( foot_front_r, x_axis, -20, 400 )
	Turn2( foot_front_l, x_axis, -30, 400 )
	Turn2( foot_rear_r, x_axis, -20, 400 )
	Turn2( foot_rear_l, x_axis, -40, 400 )	
end

function script.endJump() 
	Turn2( foot_front_r, x_axis, 0, 400 )
	Turn2( foot_front_l, x_axis, 0, 400 )
	Turn2( foot_rear_r, x_axis, 0, 400 )
	Turn2( foot_rear_l, x_axis, 0, 400 )
	Turn2( chest, x_axis, 0, 400 )
	jumping = false	
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	if jumping then
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
		EmitSfx(head,BLOODBLAST)
		EmitSfx(chest,BLOODBLAST)		
		return 1	
	end	
end