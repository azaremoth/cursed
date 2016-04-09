-- #include "basic_spring_stuff.h"

local echo = Spring.Echo

local base = piece 'base'
local body = piece 'body'
local teeth = piece 'teeth'
local teeth2 = piece 'teeth2'
local tail1 = piece 'tail1'
local tail2 = piece 'tail2'
local tail3 = piece 'tail3'
local tail4 = piece 'tail4'
local gun = piece 'gun'
local rfleg1 = piece 'rfleg1'
local rfleg2 = piece 'rfleg2'
local rfleg3 = piece 'rfleg3'
local rrleg1 = piece 'rrleg1'
local rrleg2 = piece 'rrleg2'
local rrleg3 = piece 'rrleg3'
local lrleg1 = piece 'lrleg1'
local lrleg2 = piece 'lrleg2'
local lrleg3 = piece 'lrleg3'
local lfleg1 = piece 'lfleg1'
local lfleg2 = piece 'lfleg2'
local lfleg3 = piece 'lfleg3'
local emit1 = piece 'emit1'
local emit2 = piece 'emit2'
local summon = piece 'summon'

local moving = false
local attacking = false

local activegun

local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME

local	SIG_AIM1	=	2

local	MOVELEGMAXANGLE = 40

local SUMMONING			 = 1024+0
local DefenderGunFlare	 = 1025+0
local BLOODSPRAY	 = 1026+0

local forward = 2.2
local backward = 2
local up = 1
local sa = math.rad(-10)*50
local ma = math.rad(40)*50

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/7500)
	MOVEANIMATIONSLEEPTIME = (35000000/GetUnitValue(COB.MAX_SPEED))
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
		Turn2( tail1, x_axis, 0, MOVEANIMATIONSPEED*0.2 )
		Turn2( tail2, x_axis, 0, MOVEANIMATIONSPEED*0.1 )				
		Turn2( tail3, x_axis, 0, MOVEANIMATIONSPEED*0.15 )
		Turn2( tail4, x_axis, 0, MOVEANIMATIONSPEED*0.3 )

		Turn2( lfleg1, y_axis, 1.5*ma, forward*MOVEANIMATIONSPEED )   	-- right front forward
		Turn2( lfleg1, z_axis, -ma/2, up*MOVEANIMATIONSPEED )       	-- right front up
		Turn2( lfleg2, z_axis, -ma/3, up*MOVEANIMATIONSPEED )
				
		Turn2( lrleg1, y_axis, -1.5*ma, backward*MOVEANIMATIONSPEED ) 	-- right back backward
		Turn2( lrleg1, z_axis, 0, 6*up*MOVEANIMATIONSPEED )         	-- right back down
		Turn2( lrleg2, z_axis, 0, up*MOVEANIMATIONSPEED )
		
		Turn2( rfleg1, y_axis, sa, backward*MOVEANIMATIONSPEED ) 	-- left front backward
    	Turn2( rfleg1, z_axis, 0, 6*up*MOVEANIMATIONSPEED )         	-- left front down
		Turn2( rfleg3, z_axis, 0, up*MOVEANIMATIONSPEED )
		
		Turn2( rrleg1, y_axis, -sa, forward*MOVEANIMATIONSPEED ) 	-- left back forward
		Turn2( rrleg1, z_axis, ma/2, up*MOVEANIMATIONSPEED )       	-- left back up
		Turn2( rrleg3, z_axis, ma/3, up*MOVEANIMATIONSPEED )
	  
		if not attacking then
			Turn2( tail2, z_axis, 5, MOVEANIMATIONSPEED*0.5 )
			Turn2( gun, y_axis, -5, MOVEANIMATIONSPEED*0.5 )			
		end
	  
		Sleep(MOVEANIMATIONSLEEPTIME)
  
   		end 
   		if moving then 
   		 
		Turn2( lfleg1, y_axis, -sa, backward*MOVEANIMATIONSPEED ) 	-- right front backward
		Turn2( lfleg1, z_axis, 0, 6*up*MOVEANIMATIONSPEED )         	-- right front down
		Turn2( lfleg2, z_axis, 0, up*MOVEANIMATIONSPEED )
		
		Turn2( lrleg1, y_axis, sa, forward*MOVEANIMATIONSPEED )   	-- right back forward
		Turn2( lrleg1, z_axis, -ma/2, up*MOVEANIMATIONSPEED )       	-- right back up
		Turn2( lrleg2, z_axis, -ma/3, up*MOVEANIMATIONSPEED )
		
		Turn2( rfleg1, y_axis, -1.5*ma, forward*MOVEANIMATIONSPEED ) 	-- left front forward
		Turn2( rfleg1, z_axis, ma/2, up*MOVEANIMATIONSPEED )       	-- left front up
		Turn2( rfleg3, z_axis, ma/3, up*MOVEANIMATIONSPEED )
		
		Turn2( rrleg1, y_axis, 1.5*ma, backward*MOVEANIMATIONSPEED ) 	-- left back backward
		Turn2( rrleg1, z_axis, 0, 6*up*MOVEANIMATIONSPEED )         	-- left back down
		Turn2( rrleg3, z_axis, 0, up*MOVEANIMATIONSPEED )
		
		if not attacking then
			Turn2( tail2, z_axis, -5, MOVEANIMATIONSPEED*0.5 )
			Turn2( gun, y_axis, 5, MOVEANIMATIONSPEED*0.5 )			
		end
	 
		Sleep(MOVEANIMATIONSLEEPTIME)

   		end 

		if not moving then
		
			Turn2( lrleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lfleg1, y_axis, 20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lrleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( lfleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.72)  )

			Turn2( lrleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lrleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lfleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( lfleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
					
			Turn2( rfleg1, y_axis, -20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( rrleg1, y_axis, 20, ((MOVEANIMATIONSPEED)*1.72)  )
			Turn2( rfleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rrleg1, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
	  
			Turn2( rfleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rfleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rrleg2, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )
			Turn2( rrleg3, z_axis, 0, ((MOVEANIMATIONSPEED)*1.17)  )

			if not attacking then
				Turn2( tail1, x_axis, 5, MOVEANIMATIONSPEED*0.3 )
				Turn2( tail2, x_axis, 5, MOVEANIMATIONSPEED*0.15 )
				Turn2( tail3, x_axis, 5, MOVEANIMATIONSPEED*0.3 )
				Turn2( tail4, x_axis, 5, MOVEANIMATIONSPEED*0.1 )
				Turn2( tail2, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( gun, y_axis, 0, MOVEANIMATIONSPEED )					
			end			
			
			Sleep(MOVEANIMATIONSLEEPTIME)
        end
		Sleep(50)
	end
end


function script.Create()

   	Turn2( summon, x_axis, -90 )
   	Turn2( lrleg1, y_axis, -20 ) 
   	Turn2( lfleg1, y_axis, 20 ) 
    Turn2( rfleg1, y_axis, -20 ) 
	Turn2( rrleg1, y_axis, 20 ) 

	moving = false
	attacking = false	
	activegun = 1
	

		
	----------------------------------START BUILD CYCLE
	while  GetUnitValue( COB.BUILD_PERCENT_LEFT ) > 0 do
			EmitSfx(summon, SUMMONING)
			Sleep(300)
	end
	--------------------------------/END BUILD CYCLE
	StartThread( Walkscript )
end

function script.StartMoving()
 moving=true 
 end

function script.StopMoving()
 moving=false 
end

--weapon 1 -----------------------------------------------------------------

local function RestoreAfterDelay()

	Sleep(5000)
	Turn2( tail3, y_axis, 0, 55.000000 )
	Turn2( gun, x_axis, 0, 30.000000 )
	attacking = false	
    activegun = 0
end

function script.AimWeapon1(heading, pitch)

	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	attacking = true	
	
	Turn2( tail1, x_axis, 0, 100 )
	Turn2( tail2, x_axis, 0, 100 )
	Turn2( tail3, x_axis, 0, 100 )
	Turn2( tail4, x_axis, 0, 100 )	
	Turn2( tail2, z_axis, 0, 100 )
		
	Turn( tail3, y_axis, heading, 8 )
	Turn( gun, x_axis, 0 - pitch, 7 )
    WaitForTurn(tail3, y_axis)
	WaitForTurn(gun, x_axis)
    StartThread( RestoreAfterDelay) 
    return (1)
end

function script.FireWeapon1()

	if  activegun ~= 1  then
	
		EmitSfx(emit1, DefenderGunFlare)
		Sleep(100)
		activegun = 1
		return(1)
	end
	if  activegun == 1  then
	
		EmitSfx(emit2, DefenderGunFlare)
		Sleep(100)
		activegun = 0
		return(1)
	end
end

--AimFromWeapon

function script.AimFromWeapon1(piecenum)

	return gun
end

function script.QueryWeapon1(piecenum)

	if  activegun ~= 1  then
	
		return emit1
	end
	if  activegun == 1  then
	
		return emit2
	end
end

	
function script.Killed(recentDamage,maxHealth )

	local severity = recentDamage/maxHealth

	Explode(gun, math.bit_or(SFX.FALL, SFX.EXPLODE_ON_HIT ) )
	Explode(tail1, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.EXPLODE_ON_HIT ) )
	Explode(tail2, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.EXPLODE_ON_HIT ) )
	EmitSfx(body, BLOODSPRAY)
	
	if severity <= 0.5 then
		corpsetype = 1
		return (corpsetype)
	end	
	corpsetype = 2
	return (corpsetype)
	
end
