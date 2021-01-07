local head = piece 'head'
local pelvis = piece 'pelvis'
local torso = piece 'torso'
local lfinger12 = piece 'lfinger12'
local lfinger22 = piece 'lfinger22'
local lfinger32 = piece 'lfinger32'
local lhand = piece 'lhand'
local rhand = piece 'rhand'
local lrot = piece 'lrot'
local rrot = piece 'rrot'
local lhoof = piece 'lhoof'
local llarm = piece 'llarm'
local lleg = piece 'lleg'
local lshoulder = piece 'lshoulder'
local luparm = piece 'luparm'
local lthigh = piece 'lthigh'
local rwing1 = piece 'rwing1'
local rwing2 = piece 'rwing2'
local rwing31 = piece 'rwing31'
local rwing41 = piece 'rwing41'
local rwing42 = piece 'rwing42'
local rwing51 = piece 'rwing51'
local rwing52 = piece 'rwing52'
local rfinger12 = piece 'rfinger12'
local rfinger22 = piece 'rfinger22'
local rfinger32 = piece 'rfinger32'
local rhoof = piece 'rhoof'
local rlarm = piece 'rlarm'
local rleg = piece 'rleg'
local rshoulder = piece 'rshoulder'
local ruparm = piece 'ruparm'
local rthigh = piece 'rthigh'
local lwing1 = piece 'lwing1'
local lwing2 = piece 'lwing2'
local lwing31 = piece 'lwing31'
local lwing41 = piece 'lwing41'
local lwing42 = piece 'lwing42'
local lwing51 = piece 'lwing51'
local lwing52 = piece 'lwing52'
local tail1 = piece 'tail1'
local tail3 = piece 'tail3'
local tail5 = piece 'tail5'
local tail7 = piece 'tail7'
local tail9 = piece 'tail9'

local base = piece 'base'
local aimx1 = piece 'aimx1'
local aimx2 = piece 'aimx2'

local emit_lgun = piece 'emit_lgun' 
local emit_rgun = piece 'emit_rgun' 
local emit_summon = piece 'emit_summon' 
local emit_rleg = piece 'emit_rleg' 
local emit_lleg = piece 'emit_lleg'

local moving = false
local attacking = false
local MOVEANIMATIONSPEED

local SIG_AIM1 = 2
local SIG_AIM2 = 4
local SIG_WALK = 1

local SUMMONING = 1024+0
local FOOTDUST = 1025+0
local BLOOD = 1026+0
local GUNFLARE = 1027+0

local function Turn2(piecenum, axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function SetMoveAnimationSpeed()
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/200000)
	if MOVEANIMATIONSPEED < 0.05 then 
		MOVEANIMATIONSPEED = 0.05
	end
	MOVEANIMATIONSLEEPTIME = 100/MOVEANIMATIONSPEED
end

-- Walk Motion
local function Walkscript()
	while true do
		if moving then
			SetMoveAnimationSpeed()		
			if not attacking then
				Turn2( llarm, x_axis, -17.5, MOVEANIMATIONSPEED*1.74 )
				Turn2( llarm, z_axis, -5.2, MOVEANIMATIONSPEED*6.76 )
				Turn2( llarm, y_axis, -7.4, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, 33, MOVEANIMATIONSPEED*65 )
				Turn2( lshoulder, z_axis, 1.1, MOVEANIMATIONSPEED*2.93 )
				Turn2( lshoulder, y_axis, 3.5, MOVEANIMATIONSPEED*3.25 )
				Turn2( rlarm, z_axis, 4.5, MOVEANIMATIONSPEED*15.56 )
				Turn2( rlarm, y_axis, 9.5, MOVEANIMATIONSPEED*50 )
				Turn2( rshoulder, x_axis, -40, MOVEANIMATIONSPEED*60 )
				Turn2( rshoulder, y_axis, -0.4, MOVEANIMATIONSPEED*7.64 )
				Turn2( torso, z_axis, 6.4, MOVEANIMATIONSPEED*6.79 )				
			end
			Turn2( lhoof, x_axis, 10.4, MOVEANIMATIONSPEED*87.47 )
			Turn2( lleg, x_axis, 39.9, MOVEANIMATIONSPEED*234.63 )
			Turn2( lthigh, x_axis, -30, MOVEANIMATIONSPEED*147.16 )
			Turn2( rhoof, x_axis, -32.8, MOVEANIMATIONSPEED*52.41 )
			Turn2( rleg, x_axis, 30.4, MOVEANIMATIONSPEED*21.26 )
			Turn2( rthigh, x_axis, 2.4, MOVEANIMATIONSPEED*73.67 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
			if not attacking then
				Turn2( llarm, x_axis, -17.6, MOVEANIMATIONSPEED*1.45 )
				Turn2( llarm, z_axis, -5.8, MOVEANIMATIONSPEED*6.09 )
				Turn2( llarm, y_axis, -6.6, MOVEANIMATIONSPEED*8.47 )
				Turn2( lshoulder, x_axis, 40, MOVEANIMATIONSPEED*65 )
				Turn2( lshoulder, z_axis, 1.3, MOVEANIMATIONSPEED*2.78 )
				Turn2( lshoulder, y_axis, 3.7, MOVEANIMATIONSPEED*1.51 )
				Turn2( rlarm, x_axis, -33.7, MOVEANIMATIONSPEED*1.36 )
				Turn2( rlarm, z_axis, 2.9, MOVEANIMATIONSPEED*15.95 )
				-- Turn2( rlarm, y_axis, 10.1, MOVEANIMATIONSPEED*50 )
				Turn2( rshoulder, x_axis, -40, MOVEANIMATIONSPEED*90 )
				Turn2( rshoulder, y_axis, -1, MOVEANIMATIONSPEED*6.06 )
				Turn2( torso, z_axis, 5.7, MOVEANIMATIONSPEED*6.79 )				
			end
			Turn2( lhoof, x_axis, 39.9, MOVEANIMATIONSPEED*294.65 )
			Turn2( lhoof, z_axis, -6.7, MOVEANIMATIONSPEED*67.78 )
			Turn2( lhoof, y_axis, 1.4, MOVEANIMATIONSPEED*14.2 )
			Turn2( lleg, x_axis, -16.4, MOVEANIMATIONSPEED*563.11 )
			Turn2( lleg, z_axis, 9.2, MOVEANIMATIONSPEED*92.56 )
			Turn2( lleg, y_axis, 6.2, MOVEANIMATIONSPEED*62.52 )
			Turn2( lthigh, x_axis, -24.1, MOVEANIMATIONSPEED*262.94 )
			Turn2( rhoof, x_axis, -35.2, MOVEANIMATIONSPEED*23.9 )
			Turn2( rleg, x_axis, 24.1, MOVEANIMATIONSPEED*63.14 )
			Turn2( rthigh, x_axis, 11.1, MOVEANIMATIONSPEED*87.04 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
			if not attacking then
				Turn2( llarm, z_axis, -5.3, MOVEANIMATIONSPEED*8.19 )
				Turn2( llarm, y_axis, -7.1, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, 34, MOVEANIMATIONSPEED*94 )
				Turn2( lshoulder, z_axis, 0.9, MOVEANIMATIONSPEED*6.77 )
				Turn2( lshoulder, y_axis, 2.9, MOVEANIMATIONSPEED*11.35 )			
				Turn2( rlarm, z_axis, 3.8, MOVEANIMATIONSPEED*13.45 )
				Turn2( rlarm, y_axis, 20, MOVEANIMATIONSPEED*50 )
				Turn2( rshoulder, x_axis, 0, MOVEANIMATIONSPEED*90 )
				Turn2( rshoulder, y_axis, -0.5, MOVEANIMATIONSPEED*6.93 )
				Turn2( torso, z_axis, 5.3, MOVEANIMATIONSPEED*6.79 )				
			end
			Turn2( rwing1, x_axis, -100, MOVEANIMATIONSPEED*20 )
			Turn2( rwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
			Turn2( rwing31, x_axis, -65, MOVEANIMATIONSPEED*50 )
			Turn2( rwing41, x_axis, -65, MOVEANIMATIONSPEED*50 )
			Turn2( rwing51, x_axis, -65, MOVEANIMATIONSPEED*80 )		
			Turn2( lhoof, x_axis, 16.3, MOVEANIMATIONSPEED*353.36 )
			Turn2( lhoof, z_axis, 0, MOVEANIMATIONSPEED*101.14 )
			Turn2( lhoof, y_axis, 0, MOVEANIMATIONSPEED*21.34 )
			Turn2( lleg, x_axis, 16.6, MOVEANIMATIONSPEED*494.46 )
			Turn2( lleg, z_axis, 0, MOVEANIMATIONSPEED*138.18 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*93.67 )
			Turn2( lthigh, x_axis, -32.9, MOVEANIMATIONSPEED*132.82 )
			Move( pelvis, y_axis, -9.3, MOVEANIMATIONSPEED*44.87 )
			Turn2( rhoof, x_axis, -34.6, MOVEANIMATIONSPEED*9.21 )
			Turn2( rleg, x_axis, 16.6, MOVEANIMATIONSPEED*111.84 )
			Turn2( rthigh, x_axis, 18, MOVEANIMATIONSPEED*102.62 )
			Sleep(MOVEANIMATIONSLEEPTIME*0.65)		
		end
		if moving then
			if not attacking then
				Turn2( llarm, z_axis, -4.3, MOVEANIMATIONSPEED*9.42 )
				-- Turn2( llarm, y_axis, -7.7, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, 24, MOVEANIMATIONSPEED*94 )
				Turn2( lshoulder, z_axis, 0.4, MOVEANIMATIONSPEED*4.79 )
				Turn2( lshoulder, y_axis, 1.9, MOVEANIMATIONSPEED*10.41 )
				Turn2( rlarm, z_axis, 5.1, MOVEANIMATIONSPEED*13.15 )
				Turn2( rshoulder, x_axis, 0, MOVEANIMATIONSPEED*60 )
				Turn2( rshoulder, y_axis, 0, MOVEANIMATIONSPEED*5.75 )
				Turn2( torso, z_axis, 4.6, MOVEANIMATIONSPEED*6.79 )				
			end
			Turn2( lhoof, x_axis, 2, MOVEANIMATIONSPEED*143.23 )
			Turn2( lleg, x_axis, 29.2, MOVEANIMATIONSPEED*126.09 )
			Turn2( lthigh, x_axis, -31.2, MOVEANIMATIONSPEED*17.14 )
			Turn2( rhoof, x_axis, -47.4, MOVEANIMATIONSPEED*128.25 )
			Turn2( rleg, x_axis, 70, MOVEANIMATIONSPEED*319.32 ) --48.6
			Turn2( rthigh, x_axis, -1.1, MOVEANIMATIONSPEED*191.07 )
			Turn2( tail1, y_axis, 0, MOVEANIMATIONSPEED*30 )
			Turn2( tail3, y_axis, 0, MOVEANIMATIONSPEED*30 )
			Turn2( tail5, y_axis, 0, MOVEANIMATIONSPEED*30 )
			Turn2( tail7, y_axis, 0, MOVEANIMATIONSPEED*30 )
			Turn2( tail9, y_axis, 0, MOVEANIMATIONSPEED*30 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
			if not attacking then
				Turn2( llarm, z_axis, 1.2, MOVEANIMATIONSPEED*11.86 )
				Turn2( llarm, y_axis, -8.1, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, -40, MOVEANIMATIONSPEED*120 )
				Turn2( lshoulder, z_axis, 0.1, MOVEANIMATIONSPEED*0.68 )
				Turn2( lshoulder, y_axis, -0.5, MOVEANIMATIONSPEED*5.1 )
				Turn2( rlarm, x_axis, -33.3, MOVEANIMATIONSPEED*0.73 )
				Turn2( rlarm, z_axis, 10.3, MOVEANIMATIONSPEED*11.11 )
				Turn2( rlarm, y_axis, 8.1, MOVEANIMATIONSPEED*50 )
				Turn2( llarm, y_axis, -20, MOVEANIMATIONSPEED*50 )				
				Turn2( rshoulder, x_axis, 30, MOVEANIMATIONSPEED*63.14 )
				Turn2( rshoulder, z_axis, 0.2, MOVEANIMATIONSPEED*0.41 )
				Turn2( rshoulder, y_axis, 0.7, MOVEANIMATIONSPEED*1.45 )
				Turn2( torso, z_axis, 1.4, MOVEANIMATIONSPEED*6.79 )				
			end	
			EmitSfx( lhoof, FOOTDUST )				
			Turn2( lwing1, x_axis, -50, MOVEANIMATIONSPEED*20 )
			Turn2( lwing2, x_axis, 0, MOVEANIMATIONSPEED*50 )
			Turn2( lwing31, x_axis, 30, MOVEANIMATIONSPEED*70 )
			Turn2( lwing41, x_axis, 20, MOVEANIMATIONSPEED*70 )
			Turn2( lwing51, x_axis, 10, MOVEANIMATIONSPEED*80 )
			Turn2( lhoof, x_axis, -27.5, MOVEANIMATIONSPEED*63.21 )
			Turn2( lleg, x_axis, 24.6, MOVEANIMATIONSPEED*9.82 )
			Turn2( lthigh, x_axis, 2.9, MOVEANIMATIONSPEED*73.04 )
			Move( pelvis, y_axis, -5.8, MOVEANIMATIONSPEED*7.48 )
			Turn2( rhoof, x_axis, -8.4, MOVEANIMATIONSPEED*83.68 )
--			Turn2( rleg, x_axis, -74.1, MOVEANIMATIONSPEED*54.69 ) ---74.1 // 54.69
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*0.27 )
			Turn2( rthigh, x_axis, -65, MOVEANIMATIONSPEED*138.37 )
			Turn2( tail1, y_axis, -math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail3, y_axis, -math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail5, y_axis, -math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail7, y_axis, -math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail9, y_axis, -math.random(5,15), MOVEANIMATIONSPEED*30 )			
			Sleep(MOVEANIMATIONSLEEPTIME*4.65)
		end		
		if moving then
			if not attacking then
				Turn2( llarm, x_axis, -17.8, MOVEANIMATIONSPEED*1.49 )
				Turn2( llarm, z_axis, -0.2, MOVEANIMATIONSPEED*7 )
				Turn2( llarm, y_axis, -7.8, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, -10, MOVEANIMATIONSPEED*65 )
				Turn2( lshoulder, y_axis, 0, MOVEANIMATIONSPEED*2.46 )
				Turn2( rlarm, x_axis, -33.1, MOVEANIMATIONSPEED*0.78 )
				Turn2( rlarm, z_axis, 11.5, MOVEANIMATIONSPEED*5.82 )
				Turn2( rlarm, y_axis, 7, MOVEANIMATIONSPEED*50 )
				Turn2( rshoulder, x_axis, 40, MOVEANIMATIONSPEED*50.05 )
				Turn2( rshoulder, z_axis, 0, MOVEANIMATIONSPEED*0.96 )
				Turn2( rshoulder, y_axis, 0, MOVEANIMATIONSPEED*3.6 )
				Turn2( torso, z_axis, 0, MOVEANIMATIONSPEED*7.2 )				
			end
			Turn2( lhoof, x_axis, -33.6, MOVEANIMATIONSPEED*30.66 )
			Turn2( lleg, x_axis, 12.5, MOVEANIMATIONSPEED*60.72 )
			Turn2( lthigh, x_axis, 21.2, MOVEANIMATIONSPEED*91.38 )
			Move( pelvis, y_axis, -9.3, MOVEANIMATIONSPEED*17.45 )
			Turn2( rhoof, x_axis, 27, MOVEANIMATIONSPEED*176.99 )
			Turn2( rleg, x_axis, 3.6, MOVEANIMATIONSPEED*352.5 )
			Turn2( rthigh, x_axis, -30, MOVEANIMATIONSPEED*175.51 )
			Sleep(MOVEANIMATIONSLEEPTIME*2)	
		end
		if moving then 
			if not attacking then
				Turn2( lfinger12, y_axis, -50, MOVEANIMATIONSPEED*3.59 )
				Turn2( lfinger22, y_axis, -65, MOVEANIMATIONSPEED*9.07 )
				Turn2( lfinger32, y_axis, -75, MOVEANIMATIONSPEED*74.42 )
				Turn2( rfinger12, y_axis, 60, MOVEANIMATIONSPEED*10.2 )
				Turn2( rfinger22, y_axis, 75, MOVEANIMATIONSPEED*9.76 )
				Turn2( rfinger32, y_axis, 65, MOVEANIMATIONSPEED*2.63 )			
				Turn2( llarm, x_axis, -17.3, MOVEANIMATIONSPEED*0.8 )
				Turn2( llarm, z_axis, -4.5, MOVEANIMATIONSPEED*7.66 )
				Turn2( llarm, y_axis, -8.2, MOVEANIMATIONSPEED*50 )
				Turn2( lshoulder, x_axis, 27, MOVEANIMATIONSPEED*65 )
				Turn2( lshoulder, z_axis, 0.8, MOVEANIMATIONSPEED*1.34 )
				Turn2( lshoulder, y_axis, 3.2, MOVEANIMATIONSPEED*5.7 )	
				Turn2( rlarm, x_axis, -33.9, MOVEANIMATIONSPEED*1.36 )
				Turn2( rlarm, z_axis, 6.1, MOVEANIMATIONSPEED*9.57 )
				Turn2( rlarm, y_axis, 8.6, MOVEANIMATIONSPEED*50 ) --8.6
				Turn2( rshoulder, x_axis, -40, MOVEANIMATIONSPEED*65.26 )
				Turn2( rshoulder, y_axis, 0.4, MOVEANIMATIONSPEED*0.55 )
				Turn2( torso, z_axis, 7.1, MOVEANIMATIONSPEED*12.34 )
				Turn2( torso, y_axis, 0, MOVEANIMATIONSPEED*25 )				
			end
			EmitSfx( rhoof, FOOTDUST )			
			Turn2( lwing1, x_axis, -100, MOVEANIMATIONSPEED*20 )
			Turn2( lwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
			Turn2( lwing31, x_axis, -65, MOVEANIMATIONSPEED*50 )
			Turn2( lwing41, x_axis, -65, MOVEANIMATIONSPEED*50 )
			Turn2( lwing51, x_axis, -65, MOVEANIMATIONSPEED*80 )
			Turn2( rwing1, x_axis, -50, MOVEANIMATIONSPEED*20 )
			Turn2( rwing2, x_axis, 0, MOVEANIMATIONSPEED*50 )
			Turn2( rwing31, x_axis, 30, MOVEANIMATIONSPEED*70 )
			Turn2( rwing41, x_axis, 20, MOVEANIMATIONSPEED*70 )
			Turn2( rwing51, x_axis, 10, MOVEANIMATIONSPEED*80 )
			Turn2( lhoof, x_axis, 1.7, MOVEANIMATIONSPEED*72.34 )	
			Turn2( lleg, x_axis, 63.4, MOVEANIMATIONSPEED*75.41 )
			Turn2( lthigh, x_axis, -65, MOVEANIMATIONSPEED*147.75 )
			Move( pelvis, y_axis, -6.3, MOVEANIMATIONSPEED*7.92 )
			Turn2( rhoof, x_axis, -27.6, MOVEANIMATIONSPEED*80.25 )
			Turn2( rleg, x_axis, 32.5, MOVEANIMATIONSPEED*20 )	--SPEED 22.71		
			Turn2( rthigh, x_axis, -4.9, MOVEANIMATIONSPEED*45 )	--SPEED 57.55
			Turn2( tail1, y_axis, math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail3, y_axis, math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail5, y_axis, math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail7, y_axis, math.random(5,15), MOVEANIMATIONSPEED*30 )
			Turn2( tail9, y_axis, math.random(5,15), MOVEANIMATIONSPEED*30 )			
			Sleep(MOVEANIMATIONSLEEPTIME*5.5) -- 5.65
		end		
		if not moving then
			if not attacking then		
				Turn2( lshoulder, x_axis, 0, MOVEANIMATIONSPEED*94.55 )
				Turn2( lshoulder, y_axis, 0, MOVEANIMATIONSPEED*11.35 )
				Turn2( lshoulder, z_axis, 0, MOVEANIMATIONSPEED*6.77 )
				Turn2( llarm, x_axis, 0, MOVEANIMATIONSPEED*1.74 )
				Turn2( llarm, y_axis, 0, MOVEANIMATIONSPEED*50 )
				Turn2( llarm, z_axis, 0, MOVEANIMATIONSPEED*11.86 )
				Turn2( rshoulder, x_axis, 0, MOVEANIMATIONSPEED*65.26 )
				Turn2( rshoulder, y_axis, 0, MOVEANIMATIONSPEED*7.64 )
				Turn2( rshoulder, z_axis, 0, MOVEANIMATIONSPEED*0.96 )
				Turn2( rlarm, x_axis, 0, MOVEANIMATIONSPEED*1.36 )
				-- Turn2( rlarm, y_axis, 0, MOVEANIMATIONSPEED*50 )
				Turn2( rlarm, z_axis, 0, MOVEANIMATIONSPEED*15.95 )
--				Turn2( torso, y_axis, 0, MOVEANIMATIONSPEED*12.34 )
				Turn2( torso, z_axis, 0, MOVEANIMATIONSPEED*12.34 )					
			end
			Turn2( lwing1, x_axis, -100, MOVEANIMATIONSPEED*50 )
			Turn2( lwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
			Turn2( rwing1, x_axis, -100, MOVEANIMATIONSPEED*50 )
			Turn2( rwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
			Turn2( lwing31, x_axis, -65, MOVEANIMATIONSPEED*30 )
			Turn2( lwing41, x_axis, -65, MOVEANIMATIONSPEED*30 )
			Turn2( lwing51, x_axis, -65, MOVEANIMATIONSPEED*80 )	
			Turn2( rwing31, x_axis, -65, MOVEANIMATIONSPEED*30 )
			Turn2( rwing41, x_axis, -65, MOVEANIMATIONSPEED*30 )
			Turn2( rwing51, x_axis, -65, MOVEANIMATIONSPEED*80 )
			Move( pelvis, y_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lhoof, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lhoof, y_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lhoof, z_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lleg, z_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( rhoof, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( rleg, z_axis, 0, MOVEANIMATIONSPEED*200 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*200 )
			Turn2( tail1, y_axis, 5, MOVEANIMATIONSPEED*30 )
			Turn2( tail3, y_axis, 25, MOVEANIMATIONSPEED*30 )
			Turn2( tail5, y_axis, 25, MOVEANIMATIONSPEED*50 )
			Turn2( tail7, y_axis, 35, MOVEANIMATIONSPEED*50 )
			Turn2( tail9, y_axis, 15, MOVEANIMATIONSPEED*50 )
			Sleep(MOVEANIMATIONSLEEPTIME)		
		end
		Sleep(5)
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( torso, y_axis, 30, MOVEANIMATIONSPEED*10 )
				Turn2( head, y_axis, 10, MOVEANIMATIONSPEED*15 )			
				WaitForTurn( torso, y_axis )
			elseif (borednumber < 5)then
				Turn2( torso, y_axis, -30, MOVEANIMATIONSPEED*10 )			
				Turn2( head, y_axis, -10, MOVEANIMATIONSPEED*15 )	
				WaitForTurn( torso, y_axis )
			else 
				Turn2( torso, y_axis, 0, MOVEANIMATIONSPEED*30 )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*25 )
				WaitForTurn( torso, y_axis )				
			end
		end
	Sleep(1500)		
	end
end

function script.Create()
	SetMoveAnimationSpeed()
	moving = false
	attacking = false
	Turn2( emit_summon , x_axis, -90 )
	Turn2( rrot , x_axis, 90, MOVEANIMATIONSPEED*50 )
	Turn2( lrot , x_axis, 90, MOVEANIMATIONSPEED*50 )	
	Turn2( tail1, x_axis, -55, MOVEANIMATIONSPEED*50 )
	Turn2( tail3, x_axis, 10, MOVEANIMATIONSPEED*50 )
	Turn2( tail5, x_axis, 10, MOVEANIMATIONSPEED*50 )
	Turn2( tail7, x_axis, 10, MOVEANIMATIONSPEED*50 )
	Turn2( tail9, x_axis, 15, MOVEANIMATIONSPEED*50 )
	Turn2( lwing1, x_axis, -100, MOVEANIMATIONSPEED*50 )
	Turn2( lwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
	Turn2( lwing31, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( lwing41, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( lwing42, x_axis, -55, MOVEANIMATIONSPEED*50 )
	Turn2( lwing51, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( lwing52, x_axis, -55, MOVEANIMATIONSPEED*50 )
	Turn2( rwing1, x_axis, -100, MOVEANIMATIONSPEED*50 )
	Turn2( rwing2, x_axis, 80, MOVEANIMATIONSPEED*50 )
	Turn2( rwing31, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( rwing41, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( rwing42, x_axis, -55, MOVEANIMATIONSPEED*50 )
	Turn2( rwing51, x_axis, -65, MOVEANIMATIONSPEED*50 )
	Turn2( rwing52, x_axis, -55, MOVEANIMATIONSPEED*50 )
	Turn2( lwing1, z_axis, 10, MOVEANIMATIONSPEED*20 )
	Turn2( lwing1, y_axis, -25, MOVEANIMATIONSPEED*20 )
	Turn2( rwing1, z_axis, -10, MOVEANIMATIONSPEED*20 )
	Turn2( rwing1, y_axis, 25, MOVEANIMATIONSPEED*20 )	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread(Walkscript)
	StartThread( BoredAnimation )	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
	moving = false 
end

local function RestoreAfterDelay()
	Sleep( 2000)
	Turn2( ruparm , y_axis, 0, MOVEANIMATIONSPEED*70 )
	Turn2( luparm , y_axis, 0, MOVEANIMATIONSPEED*70 )
	Turn2( rrot , x_axis, 90, MOVEANIMATIONSPEED*70 )
	Turn2( lrot , x_axis, 90, MOVEANIMATIONSPEED*70 )
	Turn2( rhand , y_axis, 0, MOVEANIMATIONSPEED*70 )
	Turn2( rhand , z_axis, 0, MOVEANIMATIONSPEED*70 )
	Turn2( lhand , y_axis, 0, MOVEANIMATIONSPEED*70 )
	Turn2( lhand , z_axis, 0, MOVEANIMATIONSPEED*70 )	
	Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*5 )
	Turn2( lfinger12, y_axis, -50, MOVEANIMATIONSPEED*30 )
	Turn2( lfinger22, y_axis, -65, MOVEANIMATIONSPEED*30 )
	Turn2( lfinger32, y_axis, -75, MOVEANIMATIONSPEED*30 )
	Turn2( rfinger12, y_axis, 60, MOVEANIMATIONSPEED*30 )
	Turn2( rfinger22, y_axis, 75, MOVEANIMATIONSPEED*30 )
	Turn2( rfinger32, y_axis, 65, MOVEANIMATIONSPEED*30 )	
	attacking = false
	return (0)
end

---------------------------------------------------------------------------
local function RestoreForAim()
	Turn2( rhand, y_axis, -90, 300 )
	Turn2( rhand, z_axis, -55, 300 )
	Turn2( lhand, y_axis, 90, 300 )
	Turn2( lhand, z_axis, 55, 300 )
	Turn2( torso, x_axis, 0, 300 )
	Turn2( torso, y_axis, 0, 300 )
	Turn2( torso, z_axis, 0, 300 )
	Turn2( rrot , x_axis, 0, 300 )
	Turn2( lrot , x_axis, 0, 300 )	
	Turn2( luparm, x_axis, 0, 300 )
	Turn2( luparm, z_axis, 0, 300 )
	Turn2( llarm, y_axis, 0, 300 )
	Turn2( llarm, z_axis, 0, 300 )
	Turn2( ruparm, x_axis, 0, 300 )
	Turn2( ruparm, z_axis, 0, 300 )
	Turn2( rlarm, y_axis, 0, 300 )
	Turn2( rlarm, z_axis, 0, 300 )
	Turn2( lfinger12, y_axis, 0, 150 )
	Turn2( lfinger22, y_axis, 0, 150 )
	Turn2( lfinger32, y_axis, 0, 150 )
	Turn2( rfinger12, y_axis, 0, 150 )
	Turn2( rfinger22, y_axis, 0, 150 )
	Turn2( rfinger32, y_axis, 0, 150 )
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit_rgun	
end

function script.AimFromWeapon1 ()
	return rlarm	
end

function script.AimWeapon1(heading, pitch)
	RestoreForAim()
	attacking = true
	Signal( SIG_AIM1)
	SetSignalMask( SIG_AIM1)
	Turn( head, y_axis, heading, 1 )	
	Turn( ruparm, y_axis, heading, 5 )
	Turn( rlarm, x_axis, -pitch, 5 )		
    WaitForTurn(ruparm, y_axis)
 	WaitForTurn(rlarm, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	EmitSfx( emit_rgun, GUNFLARE )	
	return (0)
end

--weapon 2 -----------------------------------------------------------------
function script.QueryWeapon2 (piecenum)
	return emit_lgun	
end

function script.AimFromWeapon2 (piecenum)
	return llarm
end

function script.AimWeapon2 (heading, pitch)
	RestoreForAim()
	attacking = true
	Signal( SIG_AIM2)
	SetSignalMask( SIG_AIM2)	
	Turn( luparm, y_axis, heading, 5 )
	Turn( llarm, x_axis, -pitch, 5 )	 
	WaitForTurn(luparm, y_axis)
	WaitForTurn(llarm, x_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot2()
	EmitSfx( emit_lgun,  GUNFLARE )	
	return (0)
end

function script.Killed(severity, corpsetype)

	local px, py, pz = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/demoncry.wav", 10, px, py, pz)
			
	Turn( torso , x_axis, math.rad(-43), math.rad(300) )
	Turn( torso , y_axis, math.rad(15), math.rad(50) )
	Turn( luparm , z_axis, math.rad(-50), math.rad(200) )
	Turn( ruparm , z_axis, math.rad(-30), math.rad(200) )

	Turn( rthigh , y_axis, math.rad(-45), math.rad(500) )
	Turn( lthigh , z_axis, math.rad(-17), math.rad(500) )

	Turn( base , x_axis, math.rad(-25), math.rad(75) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-50), math.rad(200) )
	WaitForTurn(base, x_axis)
	Turn( base , x_axis, math.rad(-75), math.rad(400) )
	WaitForTurn(base, x_axis)
	
	EmitSfx( torso,  BLOOD )
	EmitSfx( head,  BLOOD )

	EmitSfx( rleg, FOOTDUST )
	EmitSfx( lleg, FOOTDUST )
	
	Sleep( 100)

	return (0)
end