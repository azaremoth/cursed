include "constants.lua"

local base = piece 'base' 
local chest = piece 'chest' 
local pelvis = piece 'pelvis' 
local head = piece 'head' 
local jaw = piece 'jaw' 
local teeth = piece 'teeth' 
local teeth2 = piece 'teeth2' 
local luparm = piece 'luparm' 
local lloarm = piece 'lloarm' 
local ruparm = piece 'ruparm' 
local rloarm = piece 'rloarm' 
local finger_l11 = piece 'finger_l11' 
local finger_l12 = piece 'finger_l12' 
local finger_l13 = piece 'finger_l13' 
local finger_l21 = piece 'finger_l21' 
local finger_l22 = piece 'finger_l22' 
local finger_l23 = piece 'finger_l23' 
local finger_l31 = piece 'finger_l31' 
local finger_l32 = piece 'finger_l32' 
local finger_r11 = piece 'finger_r11' 
local finger_r12 = piece 'finger_r12' 
local finger_r13 = piece 'finger_r13' 
local finger_r21 = piece 'finger_r21' 
local finger_r22 = piece 'finger_r22' 
local finger_r23 = piece 'finger_r23' 
local finger_r31 = piece 'finger_r31' 
local finger_r32 = piece 'finger_r32' 
local rtight = piece 'rtight' 
local ltight = piece 'ltight' 
local rshank = piece 'rshank' 
local lshank = piece 'lshank' 
local rfoot = piece 'rfoot' 
local lfoot = piece 'lfoot' 
local tail1 = piece 'tail1' 
local tail2 = piece 'tail2' 
local tail3 = piece 'tail3' 
local tail4 = piece 'tail4' 
local tail5 = piece 'tail5' 
local tail6 = piece 'tail6' 
local tail7 = piece 'tail7' 
local tail8 = piece 'tail8' 
local tail9 = piece 'tail9' 
local neck1 = piece 'neck1' 
local neck2 = piece 'neck2' 
local neck3 = piece 'neck3' 
local neck4 = piece 'neck4' 
local neck5 = piece 'neck5' 
local emit_gun = piece 'emit_gun' 

local moving = false
local jumping = false
local aiming = false
local shooting = false
local dying = false

local restore_delay = 3000

local BOOM	 = 1024+0
local TELEPORTFX	 = 1025+0

--signals
local SIG_Aim = 1
local SIG_Aim2 = 4

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/6000)
	MOVEANIMATIONSLEEPTIME = (45000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

-- Walk Motion
local function Moveanimation()
	while true do
		SetMoveAnimationSpeed()	
		if moving then
			Move( pelvis , y_axis, 0 , MOVEANIMATIONSPEED*4 )		
			
			Turn2( pelvis , x_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( chest , x_axis, 0, MOVEANIMATIONSPEED*2 )			
			
			Turn2( luparm , x_axis, -50, MOVEANIMATIONSPEED*2 )
			Turn2( luparm , y_axis, 55, MOVEANIMATIONSPEED*2 )
			Turn2( luparm , z_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , x_axis, -50, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , y_axis, -55, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , z_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lloarm , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( rloarm , z_axis, -25, MOVEANIMATIONSPEED )
			
			Turn2( finger_l11 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l12 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l13 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l21 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l22 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l23 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l31 , y_axis, 25, MOVEANIMATIONSPEED )
			Turn2( finger_l32 , y_axis, 25, MOVEANIMATIONSPEED )
				
			Turn2( finger_r11 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r12 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r13 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r21 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r22 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r23 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r31 , y_axis, -25, MOVEANIMATIONSPEED )
			Turn2( finger_r32 , y_axis, -25, MOVEANIMATIONSPEED )

			Turn2( rtight , x_axis, 60+math.random(30), MOVEANIMATIONSPEED )	
			Turn2( ltight , x_axis, 50+math.random(30), MOVEANIMATIONSPEED )	
			Turn2( rshank , x_axis, -50, MOVEANIMATIONSPEED*2 )	
			Turn2( lshank , x_axis, -50, MOVEANIMATIONSPEED*2 )				

			Turn2( tail1 , x_axis, -3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail2 , x_axis, -math.random(5), MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail3 , x_axis, -3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail4 , x_axis, -math.random(5), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail5 , x_axis, -3, MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail6 , x_axis, -math.random(5), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail7 , x_axis, -3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail8 , x_axis, -math.random(5), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail9 , x_axis, -5, MOVEANIMATIONSPEED*0.25 )					
			
			Turn2( tail2 , z_axis, -math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail4 , z_axis, math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail6 , z_axis, -math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail8 , z_axis, math.random(10), MOVEANIMATIONSPEED*0.5 )
			
			if not aiming then		
				Turn2( neck1 , x_axis, 0, MOVEANIMATIONSPEED*0.5 )
				Turn2( neck2 , x_axis, 0, MOVEANIMATIONSPEED*0.5 )
				Turn2( neck3 , x_axis, 0, MOVEANIMATIONSPEED*0.5 )
				Turn2( neck4 , x_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( neck5 , x_axis, 5, MOVEANIMATIONSPEED*0.5 )	
			end
			Sleep(MOVEANIMATIONSLEEPTIME*4.5)				
		end
		if moving then
			Turn2( luparm , x_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( luparm , y_axis, -40, MOVEANIMATIONSPEED*3 )
			Turn2( luparm , z_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , x_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , y_axis, 40, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , z_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( lloarm , y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( rloarm , z_axis, 0, MOVEANIMATIONSPEED*2 )

			Turn2( finger_l11 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l12 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l13 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l21 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l22 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l23 , y_axis, -5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l31 , y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( finger_l32 , y_axis, 0, MOVEANIMATIONSPEED*2 )
				
			Turn2( finger_r11 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r12 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r13 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r21 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r22 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r23 , y_axis, 5, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r31 , y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( finger_r32 , y_axis, 0, MOVEANIMATIONSPEED*2 )

			Turn2( rtight , x_axis, 50+math.random(30), MOVEANIMATIONSPEED )	
			Turn2( ltight , x_axis, 60+math.random(30), MOVEANIMATIONSPEED )	

			Turn2( tail1 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail2 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail3 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail4 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail5 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail6 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail7 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail8 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail9 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )					
			
			Turn2( tail2 , z_axis, math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail4 , z_axis, -math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail6 , z_axis, math.random(10), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail8 , z_axis, -math.random(10), MOVEANIMATIONSPEED*0.5 )
			
			if not aiming then

			end
			Sleep(MOVEANIMATIONSLEEPTIME*4)	
		end
		
		
		if not moving then
			Move( pelvis , y_axis, -20 , MOVEANIMATIONSPEED*0.5 )
		
			Turn2( pelvis , x_axis, -55, MOVEANIMATIONSPEED*2 )	
			Turn2( chest , x_axis, 30, MOVEANIMATIONSPEED*2 )				
			
			Turn2( luparm , x_axis, 20, MOVEANIMATIONSPEED*2 )
			Turn2( luparm , y_axis, 70, MOVEANIMATIONSPEED*2 )
			Turn2( luparm , z_axis, -30, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , x_axis, 20, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , y_axis, -70, MOVEANIMATIONSPEED*2 )
			Turn2( ruparm , z_axis, 30, MOVEANIMATIONSPEED*2 )
			Turn2( lloarm , y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( rloarm , z_axis, 0, MOVEANIMATIONSPEED*2 )	
			
			Turn2( finger_l11 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l12 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l13 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l21 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l22 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l23 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l31 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_l32 , y_axis, 0, MOVEANIMATIONSPEED )
				
			Turn2( finger_r11 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r12 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r13 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r21 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r22 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r23 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r31 , y_axis, 0, MOVEANIMATIONSPEED )
			Turn2( finger_r32 , y_axis, 0, MOVEANIMATIONSPEED )	

			Turn2( tail1 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail2 , x_axis, math.random(20), MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail3 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail4 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail5 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )		
			Turn2( tail6 , x_axis, math.random(10), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail7 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )
			Turn2( tail8 , x_axis, math.random(7), MOVEANIMATIONSPEED*0.25 )
			Turn2( tail9 , x_axis, 3, MOVEANIMATIONSPEED*0.25 )					
			
			Turn2( tail2 , z_axis, math.random(25), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail4 , z_axis, -math.random(25), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail6 , z_axis, math.random(25), MOVEANIMATIONSPEED*0.5 )	
			Turn2( tail8 , z_axis, -math.random(25), MOVEANIMATIONSPEED*0.5 )	
			
			Turn2( rtight , x_axis, 30+math.random(50), MOVEANIMATIONSPEED*2 )	
			Turn2( ltight , x_axis, 30+math.random(50), MOVEANIMATIONSPEED*2 )	
			Turn2( rfoot , x_axis, math.random(30), MOVEANIMATIONSPEED )	
			Turn2( lfoot , x_axis, math.random(30), MOVEANIMATIONSPEED )				

			Turn2( rshank , x_axis, 0, MOVEANIMATIONSPEED )	
			Turn2( lshank , x_axis, 0, MOVEANIMATIONSPEED )				
			
			if not aiming then
				Turn2( neck1 , x_axis, 15, MOVEANIMATIONSPEED )
				Turn2( neck2 , x_axis, 15, MOVEANIMATIONSPEED )
				Turn2( neck3 , x_axis, 15, MOVEANIMATIONSPEED )
				Turn2( neck4 , x_axis, 15, MOVEANIMATIONSPEED )
				Turn2( neck5 , x_axis, 15, MOVEANIMATIONSPEED )				
			end	
			Sleep(MOVEANIMATIONSLEEPTIME*4)	
		end
		
		if not moving then
			Move( pelvis , y_axis, 20 , MOVEANIMATIONSPEED )		
		
			Turn2( luparm , x_axis, -30, MOVEANIMATIONSPEED*3 )
			Turn2( luparm , y_axis, -40, MOVEANIMATIONSPEED*3 )
			Turn2( luparm , z_axis, 30, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , x_axis, -30, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , y_axis, 40, MOVEANIMATIONSPEED*3 )
			Turn2( ruparm , z_axis, -30, MOVEANIMATIONSPEED*3 )
			Turn2( lloarm , y_axis, 0, MOVEANIMATIONSPEED*3 )
			Turn2( rloarm , z_axis, 0, MOVEANIMATIONSPEED*3 )	

			Turn2( tail1 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail2 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail3 , x_axis, -7, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail4 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail5 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail6 , x_axis, -5, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail7 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail8 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
			Turn2( tail9 , x_axis, -10, MOVEANIMATIONSPEED*0.5 )			

			Turn2( tail2 , z_axis, -math.random(25), MOVEANIMATIONSPEED )	
			Turn2( tail4 , z_axis, math.random(25), MOVEANIMATIONSPEED )	
			Turn2( tail6 , z_axis, -math.random(25), MOVEANIMATIONSPEED )	
			Turn2( tail8 , z_axis, math.random(25), MOVEANIMATIONSPEED )	

			Turn2( rtight , x_axis, -math.random(50), MOVEANIMATIONSPEED*2 )	
			Turn2( ltight , x_axis, -math.random(50), MOVEANIMATIONSPEED*2 )	
			Turn2( rfoot , x_axis, 0, MOVEANIMATIONSPEED )	
			Turn2( lfoot , x_axis, 0, MOVEANIMATIONSPEED )					
			
			if not aiming then		

			end
			Sleep(MOVEANIMATIONSLEEPTIME*2.5)	
		end
		
	Sleep(50)	
	end
end

local function AimingShooting()
	while true do
		if aiming and not shooting then
			Turn2( head, x_axis, 0, 200 )
			Turn2( jaw, x_axis, 0, 200 )
		elseif aiming and shooting then
			Turn2( head, x_axis, -30, 500 )
			Turn2( jaw, x_axis, 70, 500 )
		elseif not aiming and not shooting then
			Turn2( head, x_axis, 0, 200 )		
			Turn2( jaw, x_axis, 0, 100 )	
		end
		Sleep(50)	
	end
end

function script.Activate()
end

function script.Deactivate()
end

function script.MoveRate(curRate)
	if curRate < 0.25 then
		moving = false
	else
		moving = true
	end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	return(damage)
end

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	--		EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	StartThread( Moveanimation )
	StartThread( AimingShooting )	
end

local function RestoreAfterDelay()
	Sleep(restore_delay*0.25)
	shooting = false
	Sleep(restore_delay*0.75)
	aiming = false
	return (0)
end


function script.Shot1 ()
	shooting = true
	StartThread( RestoreAfterDelay)
end

function script.Shot2 ()
end

function script.QueryWeapon1()
	 return emit_gun
end

function script.QueryWeapon2()
	 return emit_gun
end

function script.AimFromWeapon1() return base end

function script.AimFromWeapon2() return base end

function script.AimWeapon1(heading, pitch)
	aiming = true	
	Turn2( neck1 , x_axis, 0, MOVEANIMATIONSPEED*10 )
	Turn2( neck2 , x_axis, 0, MOVEANIMATIONSPEED*10 )
	Turn2( neck4 , x_axis, 0, MOVEANIMATIONSPEED*10 )
	
	Turn( neck3, y_axis, heading, 5 )
	Turn( neck5, x_axis, -pitch, 5 )		
	
    WaitForTurn(neck3, y_axis)
	WaitForTurn(neck5, x_axis)
	
	return true
end

function script.AimWeapon2(heading, pitch)
	return true
end

--Jumps
local function JumpExhaust()
end

function script.preJump()
end

function script.beginJump()
	jumping = true
end

function script.jumping()
end

function script.halfJump()
end

function script.endJump()
	jumping = false
end	

function script.Killed(recentDamage, maxHealth)
	dying = true
	EmitSfx(base, BOOM)		
	return 3
end