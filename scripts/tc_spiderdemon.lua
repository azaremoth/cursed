-- #include "basic_spring_stuff.h"

local echo = Spring.Echo

local base = piece 'base'
local pelvis = piece 'pelvis'
local brain = piece 'brain'
local tail1 = piece 'tail1'
local tail2 = piece 'tail2'
local tail3 = piece 'tail3'
local tail4 = piece 'tail4'
local rrleg1 = piece 'rrleg1'
local rrleg2 = piece 'rrleg2'
local rrleg3 = piece 'rrleg3'
local rfleg1 = piece 'rfleg1'
local rfleg2 = piece 'rfleg2'
local rfleg3 = piece 'rfleg3'
local lfleg1 = piece 'lfleg1'
local lfleg2 = piece 'lfleg2'
local lfleg3 = piece 'lfleg3'
local lrleg1 = piece 'lrleg1'
local lrleg2 = piece 'lrleg2'
local lrleg3 = piece 'lrleg3'
local emit1 = piece 'emit1'
local emit2 = piece 'emit2'
local emit3 = piece 'emit3'
local emit4 = piece 'emit4'
local summon = piece 'summon'

local moving = false
local attacking = false

local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME

local	SIG_AIM1	=	2

local	MOVELEGMAXANGLE = 40

local SUMMONING			 = 1024+0
local GUNFLARE	 = 1025+0
local BLOODSPRAY	 = 1026+0


local legRaiseSpeed = math.rad(45)
local legRaiseAngle = math.rad(20)
local legLowerSpeed = math.rad(50)

local legForwardSpeed = math.rad(40)
local legForwardAngle = -math.rad(20)
local legBackwardSpeed = math.rad(35)
local legBackwardAngle = math.rad(45)
local legBackwardAngleMinor = math.rad(30)


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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/52000)
	
	 legRaiseSpeed = math.rad(45)*MOVEANIMATIONSPEED
	 legLowerSpeed = math.rad(50)*MOVEANIMATIONSPEED

	 legForwardSpeed = math.rad(40)*MOVEANIMATIONSPEED
	 legBackwardSpeed = math.rad(35)*MOVEANIMATIONSPEED
	
	MOVEANIMATIONSLEEPTIME = (55000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end	
end


-- Walk Motion
local function Walkscript()
	while true do
		SetMoveAnimationSpeed()	
   		if moving then 
			Turn(lrleg1, z_axis, legRaiseAngle, legRaiseSpeed)	-- LF leg up
			Turn(lrleg1, y_axis, legForwardAngle, legForwardSpeed)	-- LF leg forward
			Turn(rfleg1, y_axis, legBackwardAngle, legBackwardSpeed)	-- LB leg back		
			Turn(rrleg1, y_axis, -legBackwardAngleMinor, legBackwardSpeed)	-- RF leg back
			Turn(lfleg1, z_axis, -legRaiseAngle, legRaiseSpeed)	-- RB leg up
			Turn(lfleg1, y_axis, 0, legForwardSpeed)	-- RB leg forward	
			WaitForTurn(lrleg1, z_axis)
			WaitForTurn(lrleg1, y_axis)
			
			Turn(lrleg1, z_axis, 0, legLowerSpeed)	-- LF leg down		
			Turn(lfleg1, z_axis, 0, legLowerSpeed)	-- RB leg down
			WaitForTurn(lrleg1, z_axis)

			Turn(lrleg1, y_axis, legBackwardAngleMinor, legBackwardSpeed)	-- LF leg back
			Turn(rfleg1, z_axis, legRaiseAngle, legRaiseSpeed)	-- LB leg up
			Turn(rfleg1, y_axis, 0, legForwardSpeed)	-- LB leg forward
			Turn(rrleg1, z_axis, -legRaiseAngle, legRaiseSpeed)	-- RF leg up
			Turn(rrleg1, y_axis, -legForwardAngle, legForwardSpeed)	-- RF leg forward
			Turn(lfleg1, y_axis, -legBackwardAngle, legBackwardSpeed)	-- RB leg back	
			WaitForTurn(rrleg1, z_axis)
			WaitForTurn(rrleg1, y_axis)
			
			Turn(rfleg1, z_axis, 0, legLowerSpeed)	-- LB leg down		
			Turn(rrleg1, z_axis, 0, legLowerSpeed)	-- RF leg down
			WaitForTurn(rfleg1, z_axis)

   		end 

		if not moving and not attacking then
		
--			Turn2( lfleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lrleg1, y_axis, 20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lfleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lrleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.72)  )

			Turn2( lfleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lfleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lrleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lrleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
					
--			Turn2( rrleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( rfleg1, y_axis, 20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( rrleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rfleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
	  
			Turn2( rrleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rrleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rfleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rfleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )	
			
			Sleep(MOVEANIMATIONSLEEPTIME) 
        end
		Sleep(50)
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if (not attacking) and (not moving) then		
			local borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( brain, y_axis, 10, MOVEANIMATIONSPEED*2 )
				WaitForTurn( rrleg2, y_axis )
			elseif (borednumber < 5)then
				Turn2( lfleg1, y_axis, -40, ((MOVEANIMATIONSPEED)*2)  )
				Turn2( rrleg1, y_axis, 20, ((MOVEANIMATIONSPEED)*2)  )
				Turn2( lfleg2, x_axis, 30, ((MOVEANIMATIONSPEED)*2)  )
				Turn2( rrleg2, x_axis, 30, ((MOVEANIMATIONSPEED)*2)  )	
				WaitForTurn(rrleg2, x_axis)
				Turn2( lfleg2, x_axis, 0, ((MOVEANIMATIONSPEED)*3)  )
				Turn2( rrleg2, x_axis, 0, ((MOVEANIMATIONSPEED)*3)  )	
			else 
				Turn2( brain, y_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( lfleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*2)  )
				Turn2( rrleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*2)  )	
				
				
			end
		end
	Sleep(1500)		
	end
end
-----------------------------------------------------------------

function script.Create()

   	Turn2( summon, x_axis, -90 )
   	Turn2( lfleg1, y_axis, -20 ) 
   	Turn2( lrleg1, y_axis, 20 ) 
    Turn2( rrleg1, y_axis, -20 ) 
	Turn2( rfleg1, y_axis, 20 ) 

	moving = false
	attacking = false	


	----------------------------------START BUILD CYCLE
	while  GetUnitValue( COB.BUILD_PERCENT_LEFT ) > 0 do
			EmitSfx(summon, SUMMONING)
			Sleep(300)
	end
	--------------------------------/END BUILD CYCLE
	StartThread( Walkscript )
	StartThread( BoredAnimation )	
end

function script.StartMoving()
 moving=true 
 end

function script.StopMoving()
 moving=false 
end

--weapon 1 -----------------------------------------------------------------

local function RestoreAfterDelay()
	Sleep(2000)
	attacking = false	
end

function script.AimWeapon1(heading, pitch)
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	attacking = true	
    StartThread( RestoreAfterDelay) 
    return (1)
end

function script.FireWeapon1()
	EmitSfx(emit1, GUNFLARE)
	Turn2( pelvis, x_axis, -20, 100  )
	
   	Turn2( lfleg1, y_axis, -20 ) 
   	Turn2( lrleg1, y_axis, 20 ) 
    Turn2( rrleg1, y_axis, -20 ) 
	Turn2( rfleg1, y_axis, 20 ) 
			
	Turn2( rrleg1, x_axis, 30, 100 )
	Turn2( lrleg1, x_axis, 30, 100 )
	Turn2( rrleg2, z_axis, -20, 100 )
	Turn2( lrleg2, z_axis, 20, 100 )				
	Turn2( rfleg2, z_axis, 30, 100 )
	Turn2( lfleg2, z_axis, -30, 100 )
	Sleep(400)
	
	Turn2( pelvis, x_axis, 0, 50  )
	
	Turn2( rrleg1, x_axis, 0, 50 )
	Turn2( rfleg1, x_axis, 0, 50 )	
	Turn2( rfleg2, z_axis, 0, 50 )
	Turn2( lfleg2, z_axis, 0, 50 )
	Turn2( rrleg2, z_axis, 0, 50 )
	Turn2( lrleg2, z_axis, 0, 50 )			
	return(1)
end

--AimFromWeapon

function script.AimFromWeapon1(piecenum)
	return emit1
end

function script.QueryWeapon1(piecenum)
	return emit1
end

	
function script.Killed(recentDamage,maxHealth )

	local severity = recentDamage/maxHealth

	Explode(rrleg1, math.bit_or(SFX.FALL, SFX.EXPLODE_ON_HIT ) )
	Explode(rrleg2, math.bit_or(SFX.FALL, SFX.EXPLODE_ON_HIT ) )	
--	Explode(tail1, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.EXPLODE_ON_HIT ) )
--	Explode(tail2, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.EXPLODE_ON_HIT ) )
	EmitSfx(brain, BLOODSPRAY)
	
	if severity <= 0.5 then
		corpsetype = 1
		return (corpsetype)
	end	
	corpsetype = 2
	return (corpsetype)
	
end
