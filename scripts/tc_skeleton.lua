------------------------------------

local emit_melee = piece 'emit_melee'
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
local neck = piece 'neck'
local head = piece 'head'
local jaw = piece 'jaw'
local lhand = piece 'lhand'
local lthumb = piece 'lthumb'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local emit = piece 'emit'
local scythe = piece 'scythe'
local shield = piece 'shield'
local emit_summon = piece 'emit_summon'
local aimpoint = piece 'aimpoint'

local moving = false
local attacking = false
local inbunker = false
local burrowed = false
local parried = false
local isparrying = false
local indeepwater = false

local restore_delay, MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME = 340

local SIG_WALK = 1


local ATK_CHEST_SPEED_B = 150
local ATK_CHEST_SPEED_F = 400
local ATK_CHEST_SPEED_S = 400

local ATK_UPARM_SPEED_B = 450
local ATK_UPARM_SPEED_F = 400
local ATK_LOARM_SPEED_B = 450
local ATK_LOARM_SPEED_F = 400

local ATK_RHAND_SPEED_B = 450
local ATK_RHAND_SPEED_F = 400

local SUMMONING	 = 1024+0
local GREYCLOUD	 = 1025+0
local BURROWING	 = 1026+0
local SPARKLES	 = 1027+0

local echo = Spring.Echo

local parrychance = 0.4 --40% parry chance

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/2000)
	MOVEANIMATIONSLEEPTIME = (38000000/GetUnitValue(COB.MAX_SPEED))
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
	SetSignalMask(SIG_WALK)
	while true do
		if moving then
			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( ruparm, x_axis, 30, MOVEANIMATIONSPEED*1.2 )
			end
			Turn2( lthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED*1.2 )
				Turn2( chest, z_axis, -5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, 5, MOVEANIMATIONSPEED*0.3 )
				end
			Turn2( lthigh, x_axis, -23, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, 15, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, -15, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, 40, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED*1.2 )
				Turn2( chest, z_axis, 5, MOVEANIMATIONSPEED )
				Turn2( head, z_axis, -5, MOVEANIMATIONSPEED*0.3 )
			end
			Turn2( lthigh, x_axis, 40, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -25, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 10, MOVEANIMATIONSPEED*1.4 )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.4 )
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then
--			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED*1.2 )
			end
			Turn2( lthigh, x_axis, 15, MOVEANIMATIONSPEED*1.8 )
			Turn2( rthigh, x_axis, -23, MOVEANIMATIONSPEED*1.8 )
			Turn2( lleg, x_axis, 40, MOVEANIMATIONSPEED*1.4)
			Turn2( rleg, x_axis, -15, MOVEANIMATIONSPEED*1.4 )
			Move( pelvis, y_axis, 0.3, 8 )
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end		
		if not moving and not jumping then 
--			SetMoveAnimationSpeed()
			Turn2( rthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, x_axis, 0, MOVEANIMATIONSPEED )
			Turn2( rleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( lleg, x_axis, 0, MOVEANIMATIONSPEED*1.6 )
			Turn2( pelvis, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( chest, z_axis, 0, MOVEANIMATIONSPEED )
			Turn2( lthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Turn2( rthigh, z_axis, 0, MOVEANIMATIONSPEED*0.8 )
			Move( pelvis, y_axis, 0, 8 )
			Turn2( head, z_axis, 0, MOVEANIMATIONSPEED*0.3 )
			end
		Sleep(10)
	end
end

------------------------ ACTIVATION

local function BurrowAnim()
	Signal(SIG_WALK)
	moving = false
	attacking = false
	GG.Freeze(unitID,UnitDefs,teamID)
	EmitSfx(emit_summon,BURROWING)
	Turn2( chest, x_axis, 90, 200 )
	Turn2( neck, x_axis, 70, 200 )
	Turn2( luparm, x_axis, -30, 200 )
	Turn2( luparm, x_axis, -25, 200 )
	Sleep(200)
	EmitSfx(emit_summon,BURROWING)
      local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digin.wav", 30, x, y, z)
	Move( pelvis, y_axis, -40, 100 )
	Move( emit_summon, y_axis, 10, 50 )
	Sleep(100)
	Spring.SetUnitRulesParam(unitID,'burrowed',1)
	GG.UpdateUnitAttributes(unitID) -- attribute change by unit_attributes	
	burrowed = true
	return(1)
end

local function UnBurrowAnim()
	Signal(SIG_WALK)

	EmitSfx(emit_summon,BURROWING)
	Turn2( chest, x_axis, 0, 200 )
	Turn2( neck, x_axis, 0, 200 )
	Turn2( luparm, x_axis, 0, 200 )
	Turn2( luparm, x_axis, 0, 200 )
	Sleep(200)
	EmitSfx(emit_summon,BURROWING)
    local x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/digout.wav", 30, x, y, z)
	Move( pelvis, y_axis, 0, 400 )
	Move( emit_summon, y_axis, 0, 50 )
	EmitSfx(emit_summon,BURROWING)
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
	if not inbunker then
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
		Sleep(500)
	end
end

function script.Create()
	Hide (scythe)	
	SetMoveAnimationSpeed()
	restore_delay = 3000
	Turn2( emit_summon, x_axis, -90 )
	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
	
			EmitSfx(emit_summon,SUMMONING)
			Sleep(300)
	end
	--END BUILD CYCLE
	Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)	
	StartThread( Walkscript )
	StartThread( Watercheck )
	Show (scythe)	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
 
	moving = false
end
  
--[[local function RestoreAfterDelay()
	Sleep(restore_delay)
	Turn2( chest, y_axis, 0, 100 )
	Turn2( chest, x_axis, 0, 100 )
	return (0)
end]]--



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 () return emit_melee end

function script.AimFromWeapon1 () return pelvis end

local function Aim(heading, pitch)
	randomsleeptime = math.random(100)
	Sleep(randomsleeptime)
	if burrowed or inbunker or isparrying then
		return false
	end
   	local SIG_AIM = 2
   	Signal(SIG_AIM)
   	SetSignalMask(SIG_AIM)
 	Turn(chest, y_axis, heading, 8)
	if indeepwater ~= true then
		Turn2( chest, x_axis, 0 - pitch, 50 )
		end
	if indeepwater then
		if pitch < 0.6 then
			Turn2( chest, x_axis, 0 - pitch, 50 )
		else
			return false
		end
	end
 	WaitForTurn(chest, y_axis)
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
		Turn2( chest, x_axis, 0 )
		Turn2( chest, z_axis, 0 )
		Turn2( ruparm, x_axis, 0 )		
		Turn2( ruparm, y_axis, 0 )
		Turn2( ruparm, z_axis, 0 )
		Turn2( luparm, x_axis, 0 )		
		Turn2( luparm, y_axis, 0 )
		Turn2( luparm, z_axis, 0 )
		Turn2( rloarm, x_axis, 0 )
		Turn2( rloarm, y_axis, 0 )
		Turn2( rloarm, z_axis, 0 )
		Turn2( lloarm, x_axis, 0 )
		Turn2( lloarm, y_axis, 0 )
		Turn2( lloarm, z_axis, 0 )
		Turn2( rhand, x_axis, 0 )		
		Turn2( rhand, y_axis, 0 )		
		Turn2( rhand, z_axis, 0 )
		--lean back
		Turn2( chest, x_axis, -25, ATK_CHEST_SPEED_B )
		Turn2( ruparm, x_axis, -155, ATK_UPARM_SPEED_B )
		Turn2( ruparm, y_axis, 14, ATK_UPARM_SPEED_B )
		Turn2( ruparm, z_axis, 32, ATK_UPARM_SPEED_B )
		WaitForTurn(ruparm, x_axis)
		--attack
		Turn2( chest, x_axis, 22.5, ATK_CHEST_SPEED_F )
		Turn2( ruparm, x_axis, -50, ATK_UPARM_SPEED_F )
		Turn2( ruparm, y_axis, 19, ATK_UPARM_SPEED_F )
		Turn2( ruparm, z_axis, 12.5, ATK_UPARM_SPEED_F )
		Turn2( rloarm, x_axis, 62, ATK_LOARM_SPEED_F )
		Turn2( rloarm, y_axis, -23.5, ATK_LOARM_SPEED_F )
		Turn2( rloarm, z_axis, 54.5, ATK_LOARM_SPEED_F )
		Turn2( luparm, y_axis, -40, ATK_UPARM_SPEED_B )
		Turn2( luparm, z_axis, -50, ATK_UPARM_SPEED_B )
		Turn2( rhand, x_axis, 24, ATK_RHAND_SPEED_F		 )
		Turn2( rhand, y_axis, -1.5, ATK_RHAND_SPEED_F		 )
		Turn2( rhand, z_axis, -17, ATK_RHAND_SPEED_F )
      	local x, y, z = Spring.GetUnitPosition(unitID)
		local randomnumber = math.random(100)
		if (randomnumber < 33) then
			Spring.PlaySoundFile("sounds/swoosh.wav", 30, x, y, z)
		elseif (randomnumber > 66) then
			Spring.PlaySoundFile("sounds/swoosh_soft.wav", 30, x, y, z)
		else
			Spring.PlaySoundFile("sounds/swoosh_fast.wav", 30, x, y, z)
		end
		WaitForTurn(ruparm, x_axis)
		WaitForTurn(ruparm, y_axis)
		WaitForTurn(ruparm, z_axis)
		WaitForTurn(rloarm, x_axis)
		WaitForTurn(rloarm, y_axis)
		WaitForTurn(rloarm, z_axis)
		WaitForTurn(rhand, x_axis)
		WaitForTurn(rhand, y_axis)
		WaitForTurn(rhand, z_axis)				
		--back to null position
--		Turn2( chest, x_axis, 0, ATK_CHEST_SPEED_B )
		Turn2( chest, y_axis, 0, ATK_CHEST_SPEED_B )
		Turn2( ruparm, x_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( ruparm, y_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( ruparm, z_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( rloarm, x_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( rloarm, y_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( rloarm, z_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( luparm, x_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( luparm, y_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( luparm, z_axis, 0, ATK_UPARM_SPEED_B )
		Turn2( lloarm, x_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( lloarm, y_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( lloarm, z_axis, 0, ATK_LOARM_SPEED_B )
		Turn2( rhand, x_axis, 0, ATK_RHAND_SPEED_B )
		Turn2( rhand, y_axis, 0, ATK_RHAND_SPEED_B )
		Turn2( rhand, z_axis, 0, ATK_RHAND_SPEED_B )
		WaitForTurn(chest, x_axis)
--		WaitForTurn(chest, y_axis)
		WaitForTurn(chest, z_axis)
		WaitForTurn(ruparm, x_axis)
		WaitForTurn(ruparm, y_axis)
		WaitForTurn(ruparm, z_axis)
		WaitForTurn(rloarm, x_axis)
		WaitForTurn(rloarm, y_axis)
		WaitForTurn(rloarm, z_axis)
		WaitForTurn(luparm, x_axis)
		WaitForTurn(luparm, y_axis)
		WaitForTurn(luparm, z_axis)
		WaitForTurn(lloarm, x_axis)
		WaitForTurn(lloarm, y_axis)
		WaitForTurn(lloarm, z_axis)
		WaitForTurn(rhand, x_axis)
		WaitForTurn(rhand, y_axis)
		WaitForTurn(rhand, z_axis)
	end
	if isparrying then
		Turn2( luparm, x_axis, -80, 700 )
		Turn2( luparm, y_axis, 0, 600 )
		Turn2( luparm, z_axis, 0, 600 )
		Turn2( lloarm, x_axis, 40, 400 )
		Turn2( lloarm, y_axis, 60, 500 )
		Turn2( lloarm, z_axis, 115, 550 )
		Sleep(300)
		EmitSfx(shield,SPARKLES)		
		Sleep(300)
		Turn2( luparm, x_axis, 0, 400 )
		Turn2( luparm, y_axis, 0, 400 )
		Turn2( luparm, z_axis, 0, 400 )
		Turn2( lloarm, x_axis, 0, 400 )
		Turn2( lloarm, y_axis, 0, 400 )
		Turn2( lloarm, z_axis, 0, 400 )
	end
	Sleep(300)		
	attacking=false
	isparrying = false
	return(1)	
end

function script.setSFXoccupy ( curTerrainType )
   if (curTerrainType > 0) then
      inbunker = false
	  Spring.SetUnitNeutral(unitID, false)	  
   elseif (curTerrainType == 0) then
      inbunker = true
	  Spring.SetUnitNeutral(unitID, true)
   end
end

function script.HitByWeapon ( x, z, weaponDefID, damage )
	local rndnr = math.random()
	isparrying = false
	if inbunker then
		return(0)
	end -- added this line for non-parrying
--	elseif (weaponDefID >= 0) then -- if units are crushed the weaponDefID seems to be smaller 0
--		if ( WeaponDefs[weaponDefID].description == [[Melee]] and (z>0) and (rndnr < parrychance) ) then
--			isparrying = true		
--			StartThread(MeleeAnimations)
--			return(0)
--		end
--	else
	return(damage)		
--	end
end

function script.Killed( damage, health )
	local severity = (damage/health) * 100
	if (burrowed) then
		return 2
	elseif severity > 50 then
		EmitSfx(pelvis,GREYCLOUD)
		EmitSfx(head,GREYCLOUD)
		Explode(rthigh, SFX.FALL + SFX.NO_HEATCLOUD)			
		Explode(scythe, SFX.FALL + SFX.NO_HEATCLOUD)			
		Explode(head, SFX.FALL + SFX.NO_HEATCLOUD)		
		return 2
	else
		Turn2( pelvis, x_axis, 90, 350 )
		Turn2( luparm, y_axis, -30, 250 )
		Turn2( ruparm, y_axis, 50, 250 )
		Turn2( rthigh, x_axis, 21, 150 )
		Turn2( rthigh, z_axis, -64, 150 )
		Turn2( rleg, z_axis, 252, 150 )
		Move( base, y_axis, -10, 400 )
		Sleep(500)
		EmitSfx(pelvis,GREYCLOUD)
		EmitSfx(head,GREYCLOUD)
		return (1)		
	end	
end	
