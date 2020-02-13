------------------------------------

local base = piece 'base'
local chest = piece 'chest'
local rshoulder = piece 'rshoulder'
local lshoulder = piece 'lshoulder'
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
local mask = piece 'mask'
local lhand = piece 'lhand'
local lthumb = piece 'lthumb'
local lghandle = piece 'lghandle'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local rghandle = piece 'rghandle'
local lpistol = piece 'lpistol'
local emit_lpistol = piece 'emit_lpistol'
local rpistol = piece 'rpistol'
local emit_rpistol = piece 'emit_rpistol'
local plasmagun = piece 'plasmagun'
local emit_plasma = piece 'emit_plasma'
local blaster = piece 'blaster'
local emit_blaster = piece 'emit_blaster'
local bfg = piece 'bfg'
local emit_bfg = piece 'emit_bfg'
local sgbase = piece 'sgbase'
local sgarm1 = piece 'sgarm1'
local sgarm2 = piece 'sgarm2'
local sgarm3 = piece 'sgarm3'
local sgun = piece 'sgun'
local sgsleeve = piece 'sgsleeve'
local emit_sgun = piece 'emit_sgun'
local emit_rgroundflash = piece 'emit_rgroundflash'
local emit_lgroundflash = piece 'emit_lgroundflash'
local jetpack = piece 'jetpack'
local emit_rjetpack = piece 'emit_rjetpack'
local emit_ljetpack = piece 'emit_ljetpack'
local cigtip = piece 'cigtip'

local moving
local attacking
local jumping
local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME
local flarecount = 0

local bfg_sound = 0

local SIG_WALK = 1

local BLOODSPLASH	 		= 1024+0
local BLOODSPRAY	 		= 1025+0
local GREY			 		= 1026+0
local JETFIRE	 	 		= 1027+0
local LEVELING	 	 		= 1028+0
local GUNFLARE		 		= 1029+0
local GROUNDFLASH	 		= 1030+0
local PLASMAGUNFLARE	 	= 1031+0
local PLASMAGROUNDFLASH	 	= 1032+0
local BFGFLARE	 			= 1033+0
local BFGGROUNDFLASH	 	= 1034+0

local rturn = (math.random()*50)
local lturn = (math.random()*(-50))

local team = Spring.GetUnitTeam(unitID)
local level = Spring.GetTeamRulesParam(team,"team_level") or 1

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
	MOVEANIMATIONSPEED = GetUnitValue(COB.MAX_SPEED)/3400
	MOVEANIMATIONSLEEPTIME = (42000000/GetUnitValue(COB.MAX_SPEED))	
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 10 then 
		MOVEANIMATIONSPEED = 10
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end	
end

------------------------ LEVEL VISUALS
local function LevelAdjust()
--	Hide(blaster)
	Hide(jetpack)
	Hide(plasmagun)
	Hide(lpistol)
	Hide(rpistol)
--	Hide(bfg)
	Hide(sgbase)
	Hide(sgarm1)
	Hide(sgarm2)
	Hide(sgarm3)
	Hide(sgun)	
	Hide(sgsleeve)
end

--Jumps
local function JumpExhaust()
	while jumping do 
		EmitSfx(emit_rjetpack, JETFIRE)
		EmitSfx(emit_ljetpack, JETFIRE)
		Sleep(33)
	end
end

function script.preJump(turn, distance)
end

function script.beginJump()
	if inbunker then
		return false
	end
	jumping = true
	Turn2( pelvis, x_axis, 30, MOVEANIMATIONSPEED*2 )	
	StartThread(JumpExhaust)
end

function script.jumping()
end

function script.halfJump()
	Turn2( pelvis, x_axis, -20, 50 )
	Turn2( rleg, x_axis, 10, 400 )
    Turn2( lleg, x_axis, 20, 400 )
end

function script.endJump()
	Turn2( pelvis, x_axis, 0, 200 )
	Turn2( rleg, x_axis, 0, 400 )
    Turn2( lleg, x_axis, 0, 400 )
	EmitSfx(base, GREY)	
	jumping = false
	moving = false	
end


-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)
	while true do
			if moving and not jumping then
			SetMoveAnimationSpeed()
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )				
			if not attacking then
				Turn2( chest, x_axis, 10, MOVEANIMATIONSPEED )		
				Turn2( chest, y_axis, -10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED )	
				Turn2( rshoulder, x_axis, 60, MOVEANIMATIONSPEED*2.5 )				
				Turn2( lshoulder, x_axis, 40, MOVEANIMATIONSPEED*2.5 )
				Turn2( rloarm, x_axis, -50, MOVEANIMATIONSPEED*4 )
				Turn2( lloarm, x_axis, -30, MOVEANIMATIONSPEED*4 )				
			end
			Turn2( lthigh, x_axis, -40, MOVEANIMATIONSPEED*4 )
			Turn2( rthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( lleg, x_axis, 50, MOVEANIMATIONSPEED*4 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )			
			Sleep(MOVEANIMATIONSLEEPTIME)
			-- WaitForTurn(lleg, x_axis)
		end
		if moving and not jumping then
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0, 15 )
			Sleep(MOVEANIMATIONSLEEPTIME)		
			-- WaitForTurn(lthigh, x_axis)
		end
		if moving and not jumping then	
			if not attacking then
				Turn2( chest, y_axis, 10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED )	
			end
			Turn2( lthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( rthigh, x_axis, -40, MOVEANIMATIONSPEED*4 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Turn2( rleg, x_axis, 50, MOVEANIMATIONSPEED*4 )	
			Sleep(MOVEANIMATIONSLEEPTIME)	
			-- WaitForTurn(rthigh, x_axis)
		end
		if moving and not jumping then
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 1, 10 )
			Sleep(MOVEANIMATIONSLEEPTIME)		
			-- WaitForTurn(lthigh, x_axis)
		end
		if not moving then
			Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )			
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 30 )				
			if not attacking then 
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*2 )			
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED*2 )
				Turn2( rshoulder, x_axis, 40, MOVEANIMATIONSPEED*2 )			
				Turn2( lshoulder, x_axis, 50, MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, x_axis, 30, MOVEANIMATIONSPEED*4 )
				Turn2( lloarm, x_axis, 30, MOVEANIMATIONSPEED*4 )
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
	Turn2( sgarm1, x_axis, -70 )
	Turn2( sgarm2, x_axis, -120 )	
	Turn2( sgarm3, x_axis, 145 )
--	Turn2( mask, x_axis, -120 )
--	Move( mask, y_axis, -0.5)
	LevelAdjust()	
--	Hide(mask)	
	
	Turn2(emit_rjetpack,x_axis, 90, 500)
	Turn2(emit_ljetpack,x_axis, 90, 500)
	SetMoveAnimationSpeed()
	moving = false
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	EmitSfx(base, LEVELING)	
	StartThread( Walkscript )
	StartThread( BoredAnimation )
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 	moving = false
end
  
local function RestoreAfterDelay()

	Sleep(1500)
	Turn2( rloarm, y_axis, 0, MOVEANIMATIONSPEED*4 )
	Turn2( lloarm, y_axis, 0, MOVEANIMATIONSPEED*4 )	
--	Turn2( mask, x_axis, -120, 300 )
--	Move( mask, y_axis, -0.5, 20)	
	Sleep(400)	
--	Hide(mask)
	Sleep(600)	
	Turn2( sgarm3, y_axis, 0, MOVEANIMATIONSPEED*3 )
	Turn2( sgarm3, z_axis, 0, MOVEANIMATIONSPEED*3 )
	attacking = false	
	Sleep(1000)
	Turn2( head, y_axis, 0, 120 )
	Sleep(100)	
	StopSpin  ( sgsleeve, z_axis, 50 )
	Turn2( sgarm1, x_axis, -70, MOVEANIMATIONSPEED*3 )
	Turn2( sgarm2, x_axis, -120, MOVEANIMATIONSPEED*3 )	
	Turn2( sgarm3, x_axis, 145, MOVEANIMATIONSPEED*3 )
	
	bfg_sound = 0
	return (0)
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
			return emit_bfg 
end

function script.AimFromWeapon1 ()
	return rloarm end

function script.AimWeapon1(heading, pitch)
	if ((level > 5) and (bfg_sound < 1)) then
		local x, y, z = Spring.GetUnitPosition(unitID)
		Spring.PlaySoundFile("sounds/bfg_aim.wav", 80, x, y, z)	
		bfg_sound = bfg_sound+1
	end

	Turn2( rshoulder, x_axis, 0, MOVEANIMATIONSPEED*6 )
	attacking=true
	
	local SIG_Aim = 2
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( rloarm, y_axis, heading, 4 )
	Turn( head, y_axis, heading, 10 )	
	Turn( rloarm, x_axis, -pitch, 4 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( rloarm, x_axis )
    WaitForTurn( rloarm, y_axis )
	
	if (level > 5) then
		Sleep(400)	
	end	
	
	return true
end

function script.FireWeapon1()
			bfg_sound = 0
			EmitSfx( emit_bfg, BFGFLARE )
			EmitSfx( emit_rgroundflash, BFGGROUNDFLASH )
		return(1)
end

--weapon 2 -----------------------------------------------------------------
function script.QueryWeapon2 ()
			return emit_blaster 
end

function script.AimFromWeapon2 ()
	return lloarm end

function script.AimWeapon2(heading, pitch)
			
	Turn2( lshoulder, x_axis, 0, MOVEANIMATIONSPEED*6 )
	attacking=true
	
	local SIG_Aim = 2^2
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( lloarm, y_axis, heading, 4 )
	Turn( lloarm, x_axis, -pitch, 4 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( lloarm, x_axis )
    WaitForTurn( lloarm, y_axis )
	return true
end

function script.FireWeapon2()
--			EmitSfx( emit_plasma, PLASMAGUNFLARE )
--			EmitSfx( emit_lgroundflash, PLASMAGROUNDFLASH )
		return(1)
end
---------------------------------------------------------------------------

function script.HitByWeapon ( x, z, weaponDefID, damage )
--	Turn2( mask, x_axis, 0, 300 )
--	Move( mask, y_axis, 0, 20)	
--	Show(mask)	
	if jumping then
		return(0)
	else
		return(damage)
	end
end	

function script.Killed( damage, health )
		Turn2( pelvis, x_axis, 90, 250 )
		Turn2( luparm, x_axis, -137, 15 )
		Turn2( ruparm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( base, y_axis, -50, 400)
		WaitForTurn(pelvis, x_axis)
		EmitSfx(pelvis,BLOODSPLASH)
		EmitSfx(head,BLOODSPLASH)
		return (1)
end
