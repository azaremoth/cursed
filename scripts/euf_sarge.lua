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
local rthumb = piece 'rthumb'
local rchaingun = piece 'rchaingun'
local lchaingun = piece 'lchaingun'
local rplasmagun = piece 'rplasmagun'
local lplasmagun = piece 'lplasmagun'
local rsleeve = piece 'rsleeve'
local lsleeve = piece 'lsleeve'
local emit_rgun = piece 'emit_rgun'
local emit_rgroundflash = piece 'emit_rgroundflash'
local emit_lgun = piece 'emit_lgun'
local emit_lgroundflash = piece 'emit_lgroundflash'
local emit_rjetpack = piece 'emit_rjetpack'
local emit_ljetpack = piece 'emit_ljetpack'
local cigtip = piece 'cigtip'

local restore_delay
local moving
local attacking
local jumping
local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 275
local chaingunactive
local flarecount = 0

-- local SIG_AIM1 = 2
-- local SIG_AIM2 = 4
-- local SIG_AIM3 = 8
-- local SIG_AIM4 = 16
local SIG_WALK = 1

local BLOODSPLASH	 = 1024+0
local GUNFLARE		 = 1025+0
local GROUNDFLASH	 = 1026+0
local BLOODSPRAY	 = 1027+0
local GREY			 = 1028+0
local PLASMAGUNFLARE	 	= 1029+0
local PLASMAGROUNDFLASH	 	= 1030+0
local JETFIRE	 			= 1031+0
local LEVELING	 			= 1032+0

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
	MOVEANIMATIONSPEED = GetUnitValue(COB.MAX_SPEED)/2750
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 50 then 
		MOVEANIMATIONSPEED = 50
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end	
end

local echo = Spring.Echo

function script.Changeweapon()
	chaingunactive = chaingunactive*(-1)
	if chaingunactive < 1 then
		Show (rplasmagun)
		Show (lplasmagun)	
		Hide (rchaingun)
		Hide (rsleeve)
		Hide (lchaingun)
		Hide (lsleeve)
	else
		Hide (rplasmagun)
		Hide (lplasmagun)	
		Show (rchaingun)
		Show (rsleeve)
		Show (lchaingun)
		Show (lsleeve)
	end		
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
end


-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)
	while true do
			if moving and not jumping then
			SetMoveAnimationSpeed()
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )			
			Turn2( lthigh, x_axis, -24, MOVEANIMATIONSPEED*2 ) -- -24
			Turn2( rthigh, x_axis, 23, MOVEANIMATIONSPEED*2 ) -- 33
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.6 )				--47
			Turn2( rleg, x_axis, 10, MOVEANIMATIONSPEED*1.6 )
			if not attacking then
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED*0.25 )
				Turn2( ruparm, x_axis, -26, MOVEANIMATIONSPEED*2.5 )				
				Turn2( luparm, x_axis, -20, MOVEANIMATIONSPEED*2.5 )
				Turn2( rloarm, x_axis, -18, MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, x_axis, -15, MOVEANIMATIONSPEED*2 )
			end
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)
			-- WaitForTurn(lleg, x_axis)
		end
		if moving and not jumping then
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*2 )  -- -33
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*2 )  -- 25
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*1.6)				
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*1.6 )        --65
				Move( pelvis, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)		
			-- WaitForTurn(lthigh, x_axis)
		end
		if moving and not jumping then
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*2 ) -- 24
			Turn2( rthigh, x_axis, -35, MOVEANIMATIONSPEED*2 )  -- -35
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )				
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.6 )
				Move( pelvis, y_axis, 0.3, 8 )			
			if not attacking then
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED*0.5 )
			end
			Sleep(MOVEANIMATIONSLEEPTIME)	
			-- WaitForTurn(rthigh, x_axis)
		end
		if moving and not jumping then
			Turn2( lthigh, x_axis, 23, MOVEANIMATIONSPEED*2 )   -- 33
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*2 )  -- -25
			Turn2( lleg, x_axis, 10, MOVEANIMATIONSPEED*1.6 )		-- 64		
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
				Move( pelvis, y_axis, 0, 8 )	
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
			Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )				
			if not attacking then 
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
				Turn2( ruparm, x_axis, 20, MOVEANIMATIONSPEED*2 )			
				Turn2( luparm, x_axis, 20, MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, x_axis, 50, MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, x_axis, 50, MOVEANIMATIONSPEED*2 )
				WaitForTurn( chest, y_axis )	
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
	Turn2(emit_rjetpack,x_axis, 90, 500)
	Turn2(emit_ljetpack,x_axis, 90, 500)
	SetMoveAnimationSpeed()
	moving = false
	chaingunactive = 1
	restore_delay = 1000
	Hide(rplasmagun)
	Hide(lplasmagun)
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

	Sleep(3000)
	Turn2( rloarm, y_axis, 0, 90 )
	Turn2( lloarm, y_axis, 0, 100 )
	Sleep(1000)
	Turn2( head, y_axis, 0, 120 )
	Sleep(100)
	StopSpin  ( rsleeve, z_axis, 50 )		
	StopSpin  ( lsleeve, z_axis, 50 )			
	attacking = false
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	return emit_rgun end

function script.AimFromWeapon1 ()
	return head end

function script.AimWeapon1(heading, pitch)
	if chaingunactive < 1 then
		return false
	end
	Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
			
	attacking=true
	Spin ( rsleeve, z_axis, 300 )	
	
	local SIG_Aim = 2^1
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( rloarm, y_axis, heading, 4 )
	Turn( head, y_axis, heading, 10 )	
	Turn( rloarm, x_axis, -pitch, 4 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( rloarm, x_axis )
    WaitForTurn( rloarm, y_axis )
	return true
end

function script.FireWeapon1()
		EmitSfx( emit_rgun, GUNFLARE )
		EmitSfx( emit_rgroundflash, GROUNDFLASH )
--		local unitDef = Spring.GetUnitDefID(unitID)
--		local team = Spring.GetUnitTeam(unitID)
--		GG.CreateLightMe(unitID, unitDef, team, emit_rgun, 155, 233, 233, 128)
--		Sleep(300)
--		GG.DestroyLightMe(unitID, unitDef, team)
		return(1)
end

--weapon 2 -----------------------------------------------------------------

function script.QueryWeapon2 ()
	return emit_lgun end

function script.AimFromWeapon2 ()
	return head end

function script.AimWeapon2(heading, pitch)
	if chaingunactive < 1 then
		return false
	end
	
	Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
	
	attacking=true
	Spin ( lsleeve, z_axis, 300 )	
	
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
		EmitSfx( emit_lgun, GUNFLARE )
		EmitSfx( emit_lgroundflash, GROUNDFLASH )
--		local unitDef = Spring.GetUnitDefID(unitID)
--		local team = Spring.GetUnitTeam(unitID)
--		GG.CreateLightMe(unitID, unitDef, team, emit_rgun, 155, 233, 233, 128)
--		Sleep(300)
--		GG.DestroyLightMe(unitID, unitDef, team)
		return(1)
end
--weapon 3 -----------------------------------------------------------------
function script.QueryWeapon3 ()
	return emit_rgun
end

function script.AimFromWeapon3 ()
	return head end

function script.AimWeapon3(heading, pitch)
	if chaingunactive == 1 then
		return false
	end

	Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
	
	attacking=true
	
	local SIG_Aim = 2^3
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( rloarm, y_axis, heading, 4 )
	Turn( head, y_axis, heading, 10 )	
	Turn( rloarm, x_axis, -pitch, 4 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( rloarm, x_axis )
    WaitForTurn( rloarm, y_axis )
	return true
end

function script.FireWeapon3()
	flarecount = (flarecount + 1)
	if (flarecount > 2) then
		EmitSfx( emit_rgun, PLASMAGUNFLARE )
		flarecount = 0
	end
	EmitSfx( emit_rgroundflash, PLASMAGROUNDFLASH )
	Sleep(100)
	return(1)
end

--weapon 4 -----------------------------------------------------------------
function script.QueryWeapon4 ()
	return emit_lgun
end

function script.AimFromWeapon4 ()
	return head end

function script.AimWeapon4(heading, pitch)
	if chaingunactive == 1 then
		return false
	end
	
	Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )
	
	attacking=true
	
	local SIG_Aim = 2^4
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( lloarm, y_axis, heading, 4 )
	Turn( lloarm, x_axis, -pitch, 4 )
	StartThread( RestoreAfterDelay) 
    WaitForTurn( lloarm, x_axis )
    WaitForTurn( lloarm, y_axis )
	return true
end

function script.FireWeapon4()
	flarecount = (flarecount + 1)
	if (flarecount > 2) then
		EmitSfx( emit_lgun, PLASMAGUNFLARE )
		flarecount = 0
	end
	EmitSfx( emit_lgroundflash, PLASMAGROUNDFLASH )
	Sleep(100)
	return(1)
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
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