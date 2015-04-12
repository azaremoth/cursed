--pieces
local base = piece "base"
local hole = piece "hole"
local head = piece "head"
local jaw = piece "jaw"
local chest = piece "chest"
local uparm_A  = piece "uparm_A"
local uparm_B  = piece "uparm_B"
local uparm_C  = piece "uparm_C"
local uparm_D  = piece "uparm_D"
local midarm_A  = piece "midarm_A"
local midarm_B  = piece "midarm_B"
local midarm_C  = piece "midarm_C"
local midarm_D  = piece "midarm_D"
local halswirbel01 = piece "halswirbel01"
local halswirbel02 = piece "halswirbel02"
local halswirbel03 = piece "halswirbel03"
local halswirbel04 = piece "halswirbel04"
local wirbel01 = piece "wirbel01"
local wirbel02 = piece "wirbel02"
local wirbel03 = piece "wirbel03"
local wirbel04 = piece "wirbel04"
local wirbel05 = piece "wirbel05"
local wirbel06 = piece "wirbel06"
local wirbel07 = piece "wirbel07"
local wirbel08 = piece "wirbel08"
local wirbel09 = piece "wirbel09"
local wirbel10 = piece "wirbel10"
local wirbel11 = piece "wirbel11"
local wirbel12 = piece "wirbel12"
local wirbel13 = piece "wirbel13"
local wirbel14 = piece "wirbel14"
local wirbel15 = piece "wirbel15"

-- emiters etc.
local emit = piece "emit"

-- variables
local restore_delay = 8000
local randomnumber1 = math.random()
local randomnumber2 = math.random()
local randomnumber3 = math.random()
local randomnumber4 = math.random()


local isaiming

--signals
local SIG_AIM1 = 2

--FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local DUST	 = 1026+0
local GUNFLARE	 = 1027+0


-----------------------------------------------------------------

local function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

-- Motion Control
local function MotionControl()
	while true do
		if isaiming then
			Turn2( uparm_A, x_axis, 20, 80 )
			Turn2( uparm_B, x_axis, 20, 80 )
			Turn2( uparm_C, x_axis, 50, 80 )
			Turn2( uparm_D, x_axis, 50, 80 )
			Turn2( uparm_A, y_axis, -30, 80 )
			Turn2( uparm_B, y_axis, 30, 80 )
			Turn2( uparm_C, y_axis, 50, 80 )
			Turn2( uparm_D, y_axis, -50, 80 )	
		else
			Turn2( uparm_A, y_axis, 12*randomnumber1, 80 )
			Turn2( uparm_B, y_axis, -15*randomnumber2, 80 )
			Turn2( uparm_C, y_axis, -7*randomnumber3, 80 )
			Turn2( uparm_D, y_axis, 14*randomnumber4, 80 )	
			Turn2( uparm_A, x_axis, 0, 80*randomnumber1 )
			Turn2( uparm_B, x_axis, 0, 80*randomnumber2 )
			Turn2( uparm_C, x_axis, 0, 80*randomnumber3 )
			Turn2( uparm_D, x_axis, 0, 80*randomnumber4 )
			Turn2( midarm_A, y_axis, 0, 80*randomnumber1 )
			Turn2( midarm_B, y_axis, 0, 80*randomnumber2 )
			Turn2( midarm_C, y_axis, 0, 80*randomnumber3 )
			Turn2( midarm_D, y_axis, 0, 80*randomnumber4 )
			Turn2( head, x_axis, 20, 90 )
			Turn2( jaw, x_axis, 0, 90 )	

			borednumber = math.random(500)
			if (borednumber > 499) and not isaiming then
				Turn2( chest, x_axis, 50*randomnumber2-30, 30 )				
				Turn2( wirbel01, y_axis, 10, 20 )
				Turn2( wirbel02, y_axis, 10, 20 )
				Turn2( wirbel03, y_axis, 10, 20 )
				Turn2( wirbel04, y_axis, 10, 20 )
				Turn2( wirbel05, y_axis, 10, 20 )
				Turn2( wirbel06, y_axis, 10, 20 )	
				Turn2( wirbel07, y_axis, 10, 20 )
				Turn2( wirbel08, y_axis, 10, 20 )
				Turn2( wirbel09, y_axis, 10, 20 )	
				Turn2( halswirbel01, y_axis, 30, 75 )			
				WaitForTurn( wirbel01, y_axis )
				if not isaiming then 				
					Sleep(250)
				end
				if not isaiming then 				
					Sleep(250)
				end	
			elseif (borednumber < 2) and not isaiming then
				Turn2( chest, x_axis, 50*randomnumber1-30, 30 )				
				Turn2( wirbel01, y_axis, -10, 20 )
				Turn2( wirbel02, y_axis, -10, 20 )
				Turn2( wirbel03, y_axis, -10, 20 )
				Turn2( wirbel04, y_axis, -10, 20 )
				Turn2( wirbel05, y_axis, -10, 20 )
				Turn2( wirbel06, y_axis, -10, 20 )
				Turn2( halswirbel01, y_axis, -30, 75 )			
				WaitForTurn( wirbel01, y_axis )
				if not isaiming then 				
					Sleep(250)
				end
				if not isaiming then 				
					Sleep(250)
				end	
			end
			if not isaiming then
				Sleep(100)
				Turn2( chest, x_axis, 0, 50 )			
				Turn2( wirbel01, y_axis, 0, 20 )
				Turn2( wirbel02, y_axis, 0, 20 )
				Turn2( wirbel03, y_axis, 0, 20 )
				Turn2( wirbel04, y_axis, 0, 20 )
				Turn2( wirbel05, y_axis, 0, 20 )
				Turn2( wirbel06, y_axis, 0, 20 )	
				Turn2( wirbel07, y_axis, 0, 20 )
				Turn2( wirbel08, y_axis, 0, 20 )
				Turn2( wirbel09, y_axis, 0, 20 )	
				Turn2( wirbel10, y_axis, 0, 20 )
				Turn2( halswirbel01, x_axis, 0, 20 )
				Turn2( halswirbel02, x_axis, 0, 20 )
				Turn2( halswirbel03, x_axis, 0, 20 )
				Turn2( halswirbel04, x_axis, 0, 20 )		
				Turn2( halswirbel01, y_axis, 0, 75)
			end
		end
		Sleep(50)		
	end
end

function script.Activate ( )
end

function script.Deactivate ( )
end

function script.Create()
	isaiming = false
	Turn2( halswirbel01, x_axis, -20, 200 )
	Turn2( halswirbel02, x_axis, -20, 200 )
	Turn2( halswirbel03, x_axis, -20, 200 )
	Turn2( halswirbel04, x_axis, -20, 200 )	
	Turn2( uparm_A, y_axis, 60, 200 )
	Turn2( uparm_B, y_axis, -60, 200 )
	Turn2( uparm_C, y_axis, -70, 200 )
	Turn2( uparm_D, y_axis, 70, 200 )
	Turn2( uparm_A, z_axis, 10, 200 )
	Turn2( uparm_B, z_axis, -10, 200 )
	Turn2( midarm_A, z_axis, 50, 200 )
	Turn2( midarm_B, z_axis, -50, 200 )

	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/1500000)
	Move( wirbel01, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
--[[		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( wirbel01, y_axis, outofground, 200 )]]--
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	EmitSfx(base,DUST)
	EmitSfx(head,DUST)	
	Move( wirbel01, y_axis, 0, 40 )
	Sleep(500)
	EmitSfx(base,DUST)
	EmitSfx(midarm_A,DUST)		
	EmitSfx(midarm_B,DUST)	
	EmitSfx(midarm_C,DUST)	
	EmitSfx(midarm_D,DUST)		
	Turn2( halswirbel01, x_axis, 0, 7 )
	Turn2( halswirbel02, x_axis, 0, 10 )
	Turn2( halswirbel03, x_axis, 0, 8 )
	Turn2( halswirbel04, x_axis, 0, 10 )
	Turn2( uparm_A, y_axis, 0, 15 )
	Turn2( uparm_B, y_axis, 0, 15 )
	Turn2( uparm_A, z_axis, 0, 15 )
	Turn2( uparm_B, z_axis, 0, 15 )
	Turn2( midarm_A, z_axis, 0, 15 )
	Turn2( midarm_B, z_axis, 0, 15 )	
	Sleep(500)
	Turn2( uparm_C, y_axis, 0, 15 )
	Turn2( uparm_D, y_axis, 0, 15 )	
	Sleep(200)
	StartThread( MotionControl )	
end

-----------------------------------------------------------------

local function RestoreAfterDelay()
	Sleep(restore_delay)
	if (restore_delay < 8000) then
		isaiming = false
	elseif (restore_delay > 32000) then
		restore_delay = 8000
	end
	return (0)
end

--weapon 1 -----------------------------------------------------------------
function script.QueryWeapon1 ()
	return emit
end

function script.AimFromWeapon1 ()
	return head
end

function script.AimWeapon1(heading, pitch)
	isaiming = true
	restore_delay = (restore_delay+100)
	Signal(SIG_AIM1)
	SetSignalMask(SIG_AIM1)
	Turn( wirbel01, y_axis, heading/10, 3.5/10 )
	Turn( wirbel02, y_axis, heading/10, 3.5/10 )
	Turn( wirbel03, y_axis, heading/10, 3.5/10 )
	Turn( wirbel04, y_axis, heading/10, 3.5/10 )
	Turn( wirbel05, y_axis, heading/10, 3.5/10 )
	Turn( wirbel06, y_axis, heading/10, 3.5/10 )	
	Turn( wirbel07, y_axis, heading/10, 3.5/10 )
	Turn( wirbel08, y_axis, heading/10, 3.5/10 )
	Turn( wirbel09, y_axis, heading/10, 3.5/10 )	
	Turn( wirbel10, y_axis, heading/10, 3.5/10 )		
	Turn( halswirbel01,  x_axis, -pitch/4, 2.0/4 ) 	
	Turn( halswirbel02,  x_axis, -pitch/4, 2.0/4 ) 
	Turn( halswirbel03,  x_axis, -pitch/4, 2.0/4 ) 
	Turn( halswirbel04,  x_axis, -pitch/4, 2.0/4 ) 	
	WaitForTurn (wirbel01, y_axis)
	WaitForTurn (halswirbel02, x_axis)
	Sleep(100)		
	Turn2( head, x_axis, -10, 90 )
	Turn2( jaw, x_axis, 20, 90 )
	Turn2( midarm_A, y_axis, 0, 200 )
	Turn2( midarm_B, y_axis, 0, 200 )
	Turn2( midarm_C, y_axis, 0, 200 )
	Turn2( midarm_D, y_axis, 0, 200 )	
	WaitForTurn (jaw, x_axis)		
	return true
end

function script.FireWeapon1()
	Turn2( head, x_axis, -40, 300 )
	Turn2( jaw, x_axis, 60, 250 )
	Turn2( midarm_A, y_axis, -30*randomnumber1+0.5, 80 )
	Turn2( midarm_B, y_axis, 30*randomnumber2+0.5, 80 )
	Turn2( midarm_C, y_axis, 50*randomnumber3+0.5, 80 )
	Turn2( midarm_D, y_axis, -50*randomnumber4+0.5, 80 )		
	EmitSfx( emit, GUNFLARE )
	StartThread( RestoreAfterDelay)
	return(1)
end
-----------------------------------------------------------------

function script.Killed( damage, health )
	Turn2( halswirbel01, x_axis, -20, 200 )
	Turn2( halswirbel02, x_axis, -20, 200 )
	Turn2( halswirbel03, x_axis, -20, 200 )
	Turn2( halswirbel04, x_axis, -20, 200 )	
	Turn2( uparm_A, y_axis, 60, 200 )
	Turn2( uparm_B, y_axis, -60, 200 )
	Turn2( uparm_C, y_axis, -70, 200 )
	Turn2( uparm_D, y_axis, 70, 200 )
	Turn2( uparm_A, z_axis, 10, 200 )
	Turn2( uparm_B, z_axis, -10, 200 )
	Turn2( midarm_A, z_axis, 50, 200 )
	Turn2( midarm_B, z_axis, -50, 200 )
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/1500000)
	Move( wirbel01, y_axis, structureheight, 100)
	Turn2( wirbel01, y_axis, 180, 200 )	
	Sleep(500)	
	Turn2( wirbel01, y_axis, 360, 200 )		
	Sleep(500)		
	EmitSfx(base,BOOM)
	return (1)
end