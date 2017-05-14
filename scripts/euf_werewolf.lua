------------------------------------

local emit_melee = piece 'emit_melee'
local base = piece 'base'
local chest = piece 'chest'
local rthigh = piece 'rthigh'
local lthigh = piece 'lthigh'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local luparm = piece 'luparm'
local lloarm = piece 'lloarm'
local ruparm = piece 'ruparm'
local rloarm = piece 'rloarm'
local head = piece 'head'
local jaws = piece 'jaws'
local lhand = piece 'lhand'
local lthumb = piece 'lthumb'
local rhand = piece 'rhand'
local rthumb = piece 'rthumb'
local pelvis = piece 'pelvis'
local tail = piece 'tail'
local aimpoint = piece 'aimpoint'

local moving = false
local attacking = false
local inbunker = false

local restore_delay, MOVEANIMATIONSPEED

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

local BLOOD = 1024+0


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

local echo = Spring.Echo

-- Walk Motion
local function Walkscript()
	SetSignalMask(SIG_WALK)
	while true do
		if moving then
			SetMoveAnimationSpeed()
			if not attacking then
				Turn2( ruparm, x_axis, 30, MOVEANIMATIONSPEED*2 )
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
				Turn2( luparm, x_axis, -30, MOVEANIMATIONSPEED*2 )
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
				Turn2( luparm, x_axis, 30, MOVEANIMATIONSPEED*2 )
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
				Turn2( ruparm, x_axis, -30, MOVEANIMATIONSPEED*2 )
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
			Turn2( ruparm, x_axis, 0, MOVEANIMATIONSPEED*3 )			
			Turn2( luparm, x_axis, 0, MOVEANIMATIONSPEED*3 )			
			end
		Sleep(10)
	end
end

------------------------ ACTIVATION

function script.Create()
	SetMoveAnimationSpeed()
	restore_delay = 3000
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread( Walkscript )	
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
	moving = false
end
  
local function RestoreAfterDelay()
	Sleep(restore_delay)
	Turn2( chest, y_axis, 0, 100 )
	Turn2( chest, x_axis, 0, 100 )
	return (0)
end



--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 () return emit_melee end

function script.AimFromWeapon1 () return emit_melee end

function script.AimWeapon1(heading, pitch)
 	if burrowed then
		return false
	end
    local SIG_AIM = 2
   	Signal(SIG_AIM)
   	SetSignalMask(SIG_AIM)
-- 	Turn(chest, y_axis, heading, 8)
--	WaitForTurn(chest, y_axis)
   	return true
end
   
function script.Shot1()
	StartThread(Attack)
end
	
Attack=function()
		attacking=true
		Turn2( tail, x_axis, 0)		
		Turn2( chest, x_axis, 0)		
		Turn2( ruparm, x_axis, 0)
		Turn2( luparm, x_axis, 0)		
		Turn2( ruparm, y_axis, 0)
		Turn2( luparm, y_axis, 0)			
		Turn2( ruparm, z_axis, 0)
		Turn2( luparm, z_axis, 0)			
		Turn2( rloarm, x_axis, 0)
		Turn2( lloarm, x_axis, 0)		
		Turn2( rloarm, y_axis, 0)
		Turn2( lloarm, y_axis, 0)	
		Turn2( rloarm, z_axis, 0)
		Turn2( lloarm, z_axis, 0)			
		--lean back
		Turn2( tail, x_axis, 40, ATK_CHEST_SPEED_B )		
		Turn2( chest, x_axis, -25, ATK_CHEST_SPEED_B )		
		Turn2( ruparm, z_axis, -100, ATK_UPARM_SPEED_B )
		Turn2( luparm, z_axis, 100, ATK_UPARM_SPEED_B )		
		Turn2( rloarm, x_axis, -50, ATK_UPARM_SPEED_B )
		Turn2( lloarm, x_axis, -50, ATK_UPARM_SPEED_B )		
		Turn2( rloarm, y_axis, -50, ATK_UPARM_SPEED_B )
		Turn2( lloarm, y_axis, 50, ATK_UPARM_SPEED_B )		
		WaitForTurn(ruparm, z_axis)
		--attack
		Turn2( tail, x_axis, 0, ATK_CHEST_SPEED_F )			
		Turn2( chest, x_axis, 20, ATK_CHEST_SPEED_F )			
		Turn2( ruparm, z_axis, -20, ATK_UPARM_SPEED_F )
		Turn2( luparm, z_axis, 50, ATK_UPARM_SPEED_F )			
		Turn2( ruparm, y_axis, 90, ATK_UPARM_SPEED_F )
		Turn2( luparm, y_axis, -90, ATK_UPARM_SPEED_F )		
		WaitForTurn(ruparm, y_axis)		
      	local x, y, z = Spring.GetUnitPosition(unitID)
		Spring.PlaySoundFile("sounds/swoosh.wav", 30, x, y, z)
		--back to null position
		Turn2( tail, x_axis, 0, ATK_CHEST_SPEED_B)		
		Turn2( chest, x_axis, 0, ATK_CHEST_SPEED_B)		
		Turn2( ruparm, x_axis, 0, ATK_UPARM_SPEED_B)
		Turn2( luparm, x_axis, 0, ATK_UPARM_SPEED_B)		
		Turn2( ruparm, y_axis, 0, ATK_UPARM_SPEED_B)
		Turn2( luparm, y_axis, 0, ATK_UPARM_SPEED_B)			
		Turn2( ruparm, z_axis, 0, ATK_UPARM_SPEED_B)
		Turn2( luparm, z_axis, 0, ATK_LOARM_SPEED_B)			
		Turn2( rloarm, x_axis, 0, ATK_LOARM_SPEED_B)
		Turn2( lloarm, x_axis, 0, ATK_LOARM_SPEED_B)		
		Turn2( rloarm, y_axis, 0, ATK_LOARM_SPEED_B)
		Turn2( lloarm, y_axis, 0, ATK_LOARM_SPEED_B)	
		Turn2( rloarm, z_axis, 0, ATK_LOARM_SPEED_B)
		Turn2( lloarm, z_axis, 0, ATK_LOARM_SPEED_B)			
		WaitForTurn(tail, x_axis)
		WaitForTurn(chest, x_axis)
		WaitForTurn(ruparm, x_axis)
		WaitForTurn(ruparm, y_axis)
		WaitForTurn(ruparm, z_axis)
		WaitForTurn(luparm, x_axis)
		WaitForTurn(luparm, y_axis)
		WaitForTurn(luparm, z_axis)		
		WaitForTurn(rloarm, x_axis)
		WaitForTurn(rloarm, y_axis)
		WaitForTurn(rloarm, z_axis)
		WaitForTurn(lloarm, x_axis)
		WaitForTurn(lloarm, y_axis)
		WaitForTurn(lloarm, z_axis)
		attacking=false
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
	if inbunker then
		return(0)
	elseif not inbunker then
		return(damage)
	end
end

function script.Killed( damage, health )
		Turn2( chest, x_axis, -90, 250 )
		Turn2( luparm, x_axis, -137, 15 )
		Turn2( ruparm, x_axis, 170, 15 )
		Turn2( rthigh, x_axis, 21, 15 )
		Turn2( rthigh, z_axis, -64, 15 )
		Turn2( rleg, z_axis, 252, 15 )
		Move( chest, y_axis, -50, 400 )
		WaitForTurn(chest, x_axis)
		Spring.UnitScript.EmitSfx ( chest, BLOOD )
		Spring.UnitScript.EmitSfx ( head, BLOOD )
		return (1)
end