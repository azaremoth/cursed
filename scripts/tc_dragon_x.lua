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
local attacking = false
local isdying = false
local flightheight = 10

local SUMMONING = 1024+0
local SUMMONING2 = 1025+0

local MOVEANIMATIONSPEED = 50

local SIG_AIM = 2

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

local function SetMoveMOVEANIMATIONSPEED()
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1900)
	MOVEANIMATIONSLEEPTIME = (20000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

local function Upanddown()
	while true do
		if isdying ~= 0 then
			SetMoveMOVEANIMATIONSPEED()
			if moving then 
				if not attacking then
				end
				Turn2( pelvis , x_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( chest , x_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail1 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail2 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail3 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail4 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail5 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail6 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail7 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail8 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )
				Turn2( tail9 , x_axis, -3, MOVEANIMATIONSPEED*0.5 )

				Turn2( luparm , x_axis, -25, MOVEANIMATIONSPEED*0.5 )
				Turn2( luparm , y_axis, 45, MOVEANIMATIONSPEED*0.5 )
				Turn2( luparm , z_axis, 60, MOVEANIMATIONSPEED*0.5 )
				
				Turn2( ruparm , x_axis, -25, MOVEANIMATIONSPEED*0.5 )
				Turn2( ruparm , y_axis, -45, MOVEANIMATIONSPEED*0.5 )
				Turn2( ruparm , z_axis, -60, MOVEANIMATIONSPEED*0.5 )

				Turn2( lloarm , y_axis, 40, MOVEANIMATIONSPEED )
				Turn2( rloarm , z_axis, -40, MOVEANIMATIONSPEED )				

				Turn2( finger_l11 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l12 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l13 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l21 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l22 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l23 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l31 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_l32 , y_axis, 5, MOVEANIMATIONSPEED*0.5 )
				
				Turn2( finger_r11 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r12 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r13 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r21 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r22 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r23 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r31 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				Turn2( finger_r32 , y_axis, -5, MOVEANIMATIONSPEED*0.5 )
				
				Sleep(MOVEANIMATIONSLEEPTIME)			
			end
			if moving then 
				if not attacking then
				end
				Turn2( pelvis , x_axis, 5, MOVEANIMATIONSPEED*0.5 )
				Turn2( chest , x_axis, -5, MOVEANIMATIONSPEED*0.5 )

				Sleep(MOVEANIMATIONSLEEPTIME)		
			end
	
	Sleep( 50)
	end
end


------------------------------------------/

--weapon 1 -----------------------------------------------------------------

local function RestoreAfterDelay()

	Sleep( 500)
	Turn( head , x_axis, 0, math.rad(150) )
	Turn( jaw , x_axis, 0, math.rad(120) )
	Sleep( 500)
	Turn( neck2 , y_axis, 0, math.rad(100) )	
	Turn( neck3 , y_axis, 0, math.rad(100) )
	Turn( neck4 , x_axis, 0, math.rad(100) )
	Turn( neck5 , x_axis, 0, math.rad(100) )

	attacking = false
end

function script.QueryWeapon1(piecenum)
		piecenum = emit_gun
end

function script.AimWeapon1(heading, pitch)

	Turn2( head , x_axis,-20, 250 )
	Turn2( jaw , x_axis, 20, 150 )
	Signal( SIG_AIM)
	SetSignalMask( SIG_AIM)
	attacking = true
	Turn2( neck3 , y_axis, heading, 350 )
	Turn2( neck5 , x_axis, 0, 250 )
	WaitForTurn(neck3, y_axis)
	WaitForTurn(jaw, x_axis)

	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	Turn2( head , x_axis, -40, 450 )
	Turn2( jaw , x_axis, 60, 150 )	
	Sleep( 300)
	return(1)
end

--AimFromWeapon

function script.AimFromWeapon1(piecenum)
		piecenum = head
end



function script.Create()

	isdying=0
	Hide( chest)
	Hide( pelvis)
	Hide( head)
	Hide( jaw)
	Hide( teeth)
	Hide( teeth2)
	Hide( luparm)
	Hide( lloarm)
	Hide( ruparm)
	Hide( rloarm)
	Hide( finger_l11)
	Hide( finger_l12)
	Hide( finger_l13)
	Hide( finger_l21)
	Hide( finger_l22)
	Hide( finger_l23)
	Hide( finger_l31)
	Hide( finger_l32)
	Hide( finger_r11)
	Hide( finger_r12)
	Hide( finger_r13)
	Hide( finger_r21)
	Hide( finger_r22)
	Hide( finger_r23)
	Hide( finger_r31)
	Hide( finger_r32)
	Hide( rtight)
	Hide( ltight)
	Hide( rshank)
	Hide( lshank)
	Hide( rfoot)
	Hide( lfoot)
	Hide( tail1)
	Hide( tail2)
	Hide( tail3)
	Hide( tail4)
	Hide( tail5)
	Hide( tail6)
	Hide( tail7)
	Hide( tail8)
	Hide( tail9)
	Hide( neck1)
	Hide( neck2)
	Hide( neck3)
	Hide( neck4)
	Hide( neck5)
	
	moving = false
--	Turn( emit_summon , x_axis, math.rad(-90) )
	--START BUILD CYCLE
	Sleep( 200)
	while  get BUILD_PERCENT_LEFT  do
	
			EmitSfx( base,  SUMMONING )
			Sleep( 300)
	end
	--END BUILD CYCLE


	Sleep( 1000)
	EmitSfx( pelvis,  SUMMONING2 )
	EmitSfx( base,  SUMMONING )
	EmitSfx( chest,  SUMMONING )
	EmitSfx( head,  SUMMONING )
	EmitSfx( luparm,  SUMMONING )
	EmitSfx( ruparm,  SUMMONING )
	EmitSfx( lloarm,  SUMMONING )
	EmitSfx( rloarm,  SUMMONING )
	EmitSfx( tail9,  SUMMONING )
	EmitSfx( tail5,  SUMMONING )
	EmitSfx( finger_r32,  SUMMONING )
	EmitSfx( finger_r11,  SUMMONING )
	EmitSfx( finger_l32,  SUMMONING )
	EmitSfx( finger_l11,  SUMMONING )
	Sleep( 200)
	Show( chest)
	Show( pelvis)
	Show( head)
	Show( jaw)
	Show( teeth)
	Show( teeth2)
	Show( luparm)
	Show( lloarm)
	Show( ruparm)
	Show( rloarm)
	Show( finger_l11)
	Show( finger_l12)
	Show( finger_l13)
	Show( finger_l21)
	Show( finger_l22)
	Show( finger_l23)
	Show( finger_l31)
	Show( finger_l32)
	Show( finger_r11)
	Show( finger_r12)
	Show( finger_r13)
	Show( finger_r21)
	Show( finger_r22)
	Show( finger_r23)
	Show( finger_r31)
	Show( finger_r32)
	Show( rtight)
	Show( ltight)
	Show( rshank)
	Show( lshank)
	Show( rfoot)
	Show( lfoot)
	Show( tail1)
	Show( tail2)
	Show( tail3)
	Show( tail4)
	Show( tail5)
	Show( tail6)
	Show( tail7)
	Show( tail8)
	Show( tail9)
	Show( neck1)
	Show( neck2)
	Show( neck3)
	Show( neck4)
	Show( neck5)
	StartThread(Upanddown)
end

function script.StartMoving()
	moving = true 
end

function script.StopMoving()
	moving = false 
end

function script.Killed(severity, corpsetype)

		isdying=1
		flightheight = (get UNIT_Y)
		flightheight = (flightheight*(-1))
		Sleep( 100)
		Spin( pelvis , y_axis, 400> accelerate <300 )
		Move( pelvis , y_axis, flightheight , 70 )
		Turn( pelvis , z_axis, math.rad(-(180)), math.rad(400) )
		Turn( luparm , z_axis, math.rad(-(-38)), math.rad(100) )
		Turn( ruparm , z_axis, math.rad(-(42)), math.rad(100) )
		Turn( lloarm , z_axis, math.rad(-(-81)), math.rad(100) )
		Turn( rloarm , z_axis, math.rad(-(55)), math.rad(100) )
		Turn( tail1 , x_axis, math.rad(-10), math.rad(100) )
		Turn( tail3 , x_axis, math.rad(-10), math.rad(100) )
		Turn( tail5 , x_axis, math.rad(-10), math.rad(100) )
		Turn( tail7 , x_axis, math.rad(-10), math.rad(100) )
		Turn( tail9 , x_axis, math.rad(-10), math.rad(100) )
		Sleep( 1400)
		EmitSfx( chest,  SUMMONING2 )
		Explode( tail1, sfxFall)
		Explode( neck1, sfxFall)
		Explode( luparm, sfxFall)	
		Explode( ruparm, sfxFall)
		Explode( lloarm, sfxFall)		
		Explode( rloarm, sfxFall)
		return (0)
end
