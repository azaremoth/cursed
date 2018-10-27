------------------------------------

local emit_melee = piece 'emit_melee'
local base = piece 'base'
local chest = piece 'chest'
local pelvis = piece 'pelvis'
local rthigh = piece 'rthigh'
local lthigh = piece 'lthigh'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
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
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local katana_r = piece 'katana_r'
local katana_l = piece 'katana_l'
local emit_r = piece 'emit_r'
local emit_l = piece 'emit_l'
local joint = piece 'joint'
local scabbard1 = piece 'scabbard1'
local scabbard2 = piece 'scabbard2'

local moving = false
local attacking = false
local inbunker = false
local soundsec = 1

local restore_delay, MOVEANIMATIONSPEED, MOVEANIMATIONSLEEPTIME

local SIG_WALK = 1

local BLOODSPLASH	 = 1024+0
local BLOODSPRAY	 = 1025+0
local SPARKLES		 = 1026+0
local JUMPDUST	 	 = 1027+0
local LEVELING	 	 = 1028+0
local SPARKLE	 	 = 1029+0

---- FOR BORED ANIMATION and other randomizations -----
local rturn = math.random()
local lturn = math.random()
-------------------------------------------------------
local RestoreAtkCount = 0
local WeaponRange = 0
local CirlceWeaponDamage = 0
local udid = Spring.GetUnitDefID(unitID)
local ud = UnitDefs[udid]

for i,w in ipairs(ud.weapons) do
	local circlestrike = WeaponDefs[w.weaponDef].customParams.circlestrike
	if (circlestrike == "true") then
		WeaponRange = WeaponDefs[w.weaponDef].range
		local WeaponDamagePairs = WeaponDefs[w.weaponDef].damages
		CirlceWeaponDamage = WeaponDamagePairs[1]*0.5
	end
end

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/3000)
	MOVEANIMATIONSLEEPTIME = (42000000/GetUnitValue(COB.MAX_SPEED))
	--if statements inside walkscript contain wait functions that can take forever if speed is too slow
	if MOVEANIMATIONSPEED < 10 then 
		MOVEANIMATIONSPEED = 10
	end
	if MOVEANIMATIONSLEEPTIME > 500 then 
		MOVEANIMATIONSLEEPTIME = 500
	end
end

local echo = Spring.Echo

--- Illusions ----------------------------------------------
local IllusionCast = false

function RestoreIllusionCast()
	Sleep(40000)
	IllusionCast = false
end

function script.specialskill()
	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitBuildFacing(unitID)
	local team = Spring.GetUnitTeam(unitID)
	local illusioncount = tonumber(UnitDefs[unitDefID].customParams.illusions)
--	Spring.PlaySoundFile("sounds/FLAMHVY1.WAV", 30, x, y, z)
	if not IllusionCast and illusioncount ~= nil then
		for xy = 1,illusioncount,1 do
			local createillusion = Spring.CreateUnit("tc_decoyshade", x+math.random(50),y,z+math.random(50), heading, team)		
		end
		IllusionCast = true
	end
	StartThread( RestoreIllusionCast)	
end
--- End Illusions ------------------------------------------

--Jumps ----------------------------------------------------

function script.preJump(turn, distance)
end

function script.beginJump()
	if inbunker then
		return false
	end
	
	Spring.SetUnitCloak(unitID, false)
	Spring.SetUnitStealth(unitID, false)	

	EmitSfx(base, JUMPDUST)
	EmitSfx(head, JUMPDUST)		
	
	Hide(chest)
	Hide(pelvis)
	Hide(rthigh)
	Hide(lthigh)
	Hide(lleg)
	Hide(rleg)
	Hide(rfoot)
	Hide(lfoot)
	Hide(luparm)
	Hide(lloarm)
	Hide(ruparm)
	Hide(rloarm)
	Hide(head)
	Hide(lhand)
	Hide(lthumb)
	Hide(rhand)
	Hide(rthumb)
	Hide(katana_r)
	Hide(katana_l)
	Hide(mask)	
	Hide(scabbard1)	
	Hide(scabbard2)		

	jumping = true
--	StartThread(JumpExhaust)
end

function script.jumping()
end

function script.halfJump()
end

function script.endJump()

	Show(chest)
	Show(pelvis)
	Show(rthigh)
	Show(lthigh)
	Show(lleg)
	Show(rleg)
	Show(rfoot)
	Show(lfoot)
	Show(luparm)
	Show(lloarm)
	Show(ruparm)
	Show(rloarm)
	Show(head)
	Show(lhand)
	Show(lthumb)
	Show(rhand)
	Show(rthumb)
	Show(katana_r)
	Show(katana_l)
	Show(mask)	
	Show(scabbard2)	
	Show(scabbard2)
	
	EmitSfx(base, JUMPDUST)
	EmitSfx(head, JUMPDUST)	

	StartThread( RestoreAfterDelay)	
	moving = false
	jumping = false	
end

--- Restores
function RestoreAtkAfterDelay()
	Sleep(750)
	RestoreAtkCount = RestoreAtkCount - 1
	if (RestoreAtkCount < 1) then
		RestoreAtkCount = 0
		attacking = false
	end
end

function RestoreAfterDelay()
	Sleep(2000)
	Turn( head, y_axis, 0, 4 )
	if ((ud.customParams.cloakedduring == "standing") and not moving and not attacking) then	
		Spring.SetUnitCloak(unitID, 2, 50)
		Spring.SetUnitStealth(unitID, true)	
	elseif ((ud.customParams.cloakedduring == "moving") and not attacking) then
		Spring.SetUnitCloak(unitID, 2, 50)
		Spring.SetUnitStealth(unitID, true)		
	end
end

-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)
	while true do
		if moving then
			SetMoveAnimationSpeed()
			Turn2( rleg, y_axis, 0, MOVEANIMATIONSPEED*2 )
			Turn2( lleg, y_axis, 0, MOVEANIMATIONSPEED*2 )	
			if not attacking then 
				Turn2( ruparm, x_axis, 15, MOVEANIMATIONSPEED )
				Turn2( chest, x_axis, 20, MOVEANIMATIONSPEED)
			end
			Turn2( lthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( rthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( lleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Turn2( rleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then 
				Turn2( luparm, x_axis, -15, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, 10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, 3, MOVEANIMATIONSPEED )	
				Turn2( head, z_axis, 2, MOVEANIMATIONSPEED*0.3 )
				end
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0, 15 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then 
				Turn2( luparm, x_axis, 15, MOVEANIMATIONSPEED )
			end
			Turn2( lthigh, x_axis, 20, MOVEANIMATIONSPEED*2.7 )
			Turn2( rthigh, x_axis, -50, MOVEANIMATIONSPEED*5 )
			Turn2( lleg, x_axis, 25, MOVEANIMATIONSPEED*2.5 )
			Turn2( rleg, x_axis, 70, MOVEANIMATIONSPEED*5 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then 
				Turn2( ruparm, x_axis, -15, MOVEANIMATIONSPEED )
				Turn2( chest, y_axis, -10, MOVEANIMATIONSPEED )	
				Turn2( chest, z_axis, -3, MOVEANIMATIONSPEED )	
				Turn2( head, z_axis, -2, MOVEANIMATIONSPEED*0.3 )
			end
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*3)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*3 )
			Move( pelvis, y_axis, 0.75, 10 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving then
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )				
			if not attacking then 
				Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
				Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED*1.6 )			
				Turn2( rleg, y_axis, rturn, MOVEANIMATIONSPEED*2 )
				Turn2( lleg, y_axis, lturn, MOVEANIMATIONSPEED*2 )
				Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
				Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
				Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED*2 )	
				Turn2( ruparm, x_axis, (30*rturn), MOVEANIMATIONSPEED*2 )			
				Turn2( luparm, x_axis, (30*lturn), MOVEANIMATIONSPEED*2 )
				Turn2( rloarm, x_axis, (-60*rturn), MOVEANIMATIONSPEED*2 )
				Turn2( lloarm, x_axis, (-60*lturn), MOVEANIMATIONSPEED*2 )
				Turn2( rhand, y_axis, (45*rturn), MOVEANIMATIONSPEED*2 )
				Turn2( lhand, y_axis, (-45*lturn), MOVEANIMATIONSPEED*2 )							
			end
		end
		Sleep(30)			
	end
end



-- Attacking Animation
local function MeleeAnimations()
	while true do
		if attacking then
			if not moving then 
				Turn2( lthigh, x_axis, -20, 600 )			
				Turn2( lleg, x_axis, 50, 600 )
			end
			
			Spring.UnitScript.Spin ( pelvis, y_axis, 25, 20) 
			
			-- EmitSfx(emit_r, SPARKLE)	
			-- EmitSfx(emit_l, SPARKLE)				
			
			Turn2( head, y_axis, 30, 200 )					
			
			Turn2( ruparm, x_axis, 0, 300 )
			Turn2( ruparm, y_axis, 0, 300 )
			Turn2( ruparm, z_axis, 50, 300 )			
			Turn2( rloarm, x_axis, 0, 300 )
			Turn2( rloarm, y_axis, 60, 300 )
			Turn2( rloarm, z_axis, 0, 300 )			
			Turn2( rhand, x_axis, 35, 300 )
			Turn2( rhand, y_axis, 0, 300 )
			Turn2( rhand, z_axis, 0, 300 )	
			
			Turn2( luparm, x_axis, 0, 300 )
			Turn2( luparm, y_axis, 0, 300 )
			Turn2( luparm, z_axis, -45, 300 )			
			Turn2( lloarm, x_axis, -25, 300 )
			Turn2( lloarm, y_axis, 0, 300 )
			Turn2( lloarm, z_axis, 0, 300 )			
			Turn2( lhand, x_axis, 25, 300 )
			Turn2( lhand, y_axis, -30, 300 )
			Turn2( lhand, z_axis, 15, 300 )
					
		end
		
		if not attacking then
			Spring.UnitScript.StopSpin ( pelvis, y_axis, 1)
			Turn2( pelvis, y_axis, 0, 500 )	
			Turn2( ruparm, y_axis, 0, 400 )
			Turn2( ruparm, z_axis, 0, 400 )
			Turn2( rloarm, y_axis, 0, 400 )
			Turn2( rloarm, z_axis, 0, 400 )
			Turn2( rhand, x_axis, 0, 400 )
			Turn2( rhand, z_axis, 0, 400 )	
			
			Turn2( luparm, y_axis, 0, 400 )
			Turn2( luparm, z_axis, 0, 400 )
			Turn2( lloarm, y_axis, 0, 400 )
			Turn2( lloarm, z_axis, 0, 400 )
			Turn2( lhand, x_axis, 0, 400 )
			Turn2( lhand, z_axis, 0, 400 )
		end
		Sleep(100)	
	end
end

-- Bored Animation ------------------------
local function BoredAnimation()
	while true do
		if not attacking and not moving then		
			borednumber = math.random(50)
			if (borednumber > 45) then
				Turn2( chest, x_axis, 10, MOVEANIMATIONSPEED*0.75 )
				Turn2( chest, y_axis, 30, MOVEANIMATIONSPEED*0.75 )
				Turn2( head, y_axis, 70, MOVEANIMATIONSPEED*1.5 )
				WaitForTurn( chest, y_axis )
			elseif (borednumber < 5)then
				Turn2( chest, x_axis, 20, MOVEANIMATIONSPEED*0.75 )
				Turn2( chest, y_axis, -25, MOVEANIMATIONSPEED*0.75 )
				Turn2( head, y_axis, -60, MOVEANIMATIONSPEED*1.5 )
				WaitForTurn( chest, y_axis )
			else 
				Turn2( chest, x_axis, 0, MOVEANIMATIONSPEED*0.75 )
				Turn2( chest, y_axis, 0, MOVEANIMATIONSPEED*0.75 )
				Turn2( head, y_axis, 0, MOVEANIMATIONSPEED*1.5 )
				WaitForTurn( chest, y_axis )		
			end
		end
	Sleep(1500)		
	end
end

--make illusions die -----------------------------------------------------------------
local function LoseHP()
	local hploss = tonumber(ud.customParams.hploss)
	while true do
		local health = Spring.GetUnitHealth(unitID)
		if (hploss > health) then
			Spring.DestroyUnit(unitID,true,false,unitID)
		else
			Spring.SetUnitHealth(unitID, (health-hploss))
		end
		Sleep(500)	
	end
end

------------------------ ACTIVATION
function script.Create()
	SetMoveAnimationSpeed()
	
	restore_delay = 1000
	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	EmitSfx(base, LEVELING)	
	StartThread( Walkscript )
	StartThread( MeleeAnimations )	
	StartThread( BoredAnimation )	
	StartThread( RestoreAfterDelay)	
	if (ud.customParams.hploss ~= nil) then
		StartThread( LoseHP )	
	end
	EmitSfx(pelvis, JUMPDUST)
	EmitSfx(head, JUMPDUST)		
	
end

--move control -----------------------------------------------------------------
function script.StartMoving()
	if (ud.customParams.cloakedduring ~= "moving") then
		Spring.SetUnitCloak(unitID, false)
		Spring.SetUnitStealth(unitID, false)
	end
	moving = true
end

function script.StopMoving()
	StartThread( RestoreAfterDelay)	
	moving = false	
end

--bunker -----------------------------------------------------------------
function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
      inbunker = false
   elseif (curTerrainType == 0) then
      inbunker = true
   end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	local rndnr = math.random()
	if inbunker or jumping then
		return(0)
	end
	return(damage)		
end
  

function CircleAttack()
	-----------------------------------------------------------------	
	local x, y, z = Spring.GetUnitPosition(unitID)
	if ( soundsec > 0) then
		Spring.PlaySoundFile("sounds/laser_sword_multi.ogg", 80, x, y, z)
	end
	soundsec = (-1*soundsec)
	-----------------------------------------------------------------	
	local HitUnits = Spring.GetUnitsInSphere(x,y,z, WeaponRange)
	local MyTeam = Spring.GetUnitTeam(unitID)
	for _,eUnitID in ipairs(HitUnits) do
		local eTeam = Spring.GetUnitTeam(eUnitID)
		if (eUnitID ~= unitID) and (eTeam ~= MyTeam) and not (Spring.AreTeamsAllied(eTeam, MyTeam)) then
			local hx, hy, hz = Spring.GetUnitPosition(eUnitID)
			Spring.SpawnCEG('GREENHITSPARKLE', hx, hy+10, hz)
			local eUnitIDhealth = Spring.GetUnitHealth(eUnitID)
			if (CirlceWeaponDamage > eUnitIDhealth) then
				Spring.DestroyUnit(eUnitID,true,false,unitID)
			else
				-- Spring.SetUnitHealth(eUnitID, (eUnitIDhealth-CirlceWeaponDamage))
				Spring.AddUnitDamage(eUnitID, CirlceWeaponDamage, 0, unitID)
			end
		end
	end
	-----------------------------------------------------------------		
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit_melee
end

function script.AimFromWeapon1 ()
	return emit_melee
end

function script.AimWeapon1(heading, pitch)
	if inbunker then
		return false
	end
	
	local SIG_Aim = 2^1
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	return true
end

function script.FireWeapon1()
	attacking = true
	RestoreAtkCount = RestoreAtkCount +1
	StartThread( CircleAttack ) 
	StartThread( RestoreAtkAfterDelay )
	return(1)
end

--weapon 2 -----------------------------------------------------------------
function script.QueryWeapon2 ()
	return head
end

function script.AimFromWeapon2 ()
	return head
end

function script.AimWeapon2(heading, pitch)
	
	local SIG_Aim = 2^2
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	
	Turn( head, y_axis, heading, 4 )

	return true
end

function script.FireWeapon2()	
	Turn2( ruparm, y_axis, 90 )
	Turn2( luparm, y_axis, -90 )
	Turn2( ruparm, x_axis, -90 )
	Turn2( luparm, x_axis, -90 )
	return(1)
end

--------------------------------------------------------------------------------------

function script.Killed( damage, health )
		Turn2( pelvis, x_axis, 90, 250 )
		Turn2( luparm, x_axis, -137, 15 )
		Turn2( ruparm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( base, y_axis, -50, 400)
		Sleep (200)
		EmitSfx(pelvis,BLOODSPRAY)
		EmitSfx(head,BLOODSPRAY)
		return (1)
end