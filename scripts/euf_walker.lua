local base = piece 'base' 
local pelvis = piece 'pelvis' 
local chest = piece 'chest' 

local turret1 = piece 'turret1'
local turret2 = piece 'turret2'
local turret3 = piece 'turret3'

local gun11 = piece 'gun11'
local gun12 = piece 'gun12'
local gun21 = piece 'gun21'
local gun22 = piece 'gun22'
local gun3 = piece 'gun3'

local lleg1 = piece 'lleg1' 
local lleg2 = piece 'lleg2' 
local lleg3 = piece 'lleg3' 
local lfoot = piece 'lfoot' 
local rleg1 = piece 'rleg1' 
local rleg2 = piece 'rleg2' 
local rleg3 = piece 'rleg3'
local rfoot = piece 'rfoot' 

local emit11 = piece 'emit11'
local emit12 = piece 'emit12'
local emit21 = piece 'emit21'
local emit22 = piece 'emit22'
local emit3 = piece 'emit3' 
local emit_groundflash1 = piece 'emit_groundflash1'
local emit_groundflash2 = piece 'emit_groundflash2'
local emit_groundflash3 = piece 'emit_groundflash3'
local emit_lleg = piece 'emit_lleg' 
local emit_rleg = piece 'emit_rleg' 

local dusters1 = piece 'dusters1' 
local dusters2 = piece 'dusters2' 
local dusters3 = piece 'dusters3' 
local dusters4 = piece 'dusters4' 

local MOVEANIMATIONSPEED
local MOVEANIMATIONSLEEPTIME

local moving = false
local attacking = false
local smallgun = 1

local SIG_AIM1 = 2
local SIG_AIM2 = 4

local FOOTDUST = 1024+0
local BOOM = 1025+0
local FLARE = 1026+0
local GROUNDFLASH = 1027+0
local BIGFLARE = 1028+0
local unfinished = true

local factories = {
	[UnitDefNames.euf_factory.id] = "euf_factory",
	[UnitDefNames.euf_factory_ai.id] = "euf_factory_ai",
	}

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
	MOVEANIMATIONSPEED = (GetUnitValue(COB.MAX_SPEED)/1300000)
	if MOVEANIMATIONSPEED < 0.01 then 
		MOVEANIMATIONSPEED = 0.01
	end
	MOVEANIMATIONSLEEPTIME = 30/MOVEANIMATIONSPEED --33 as exported
end

-- Walk Motion
local function Walkscript()
	while true do
		if moving then 
			SetMoveAnimationSpeed()	
			Turn(chest, y_axis, 0, 20 * MOVEANIMATIONSPEED)				
			if not attacking then
				Turn(chest, z_axis, 0.034907, 1.047198 * MOVEANIMATIONSPEED) -- delta=-2.00
			end
			Turn(lfoot, x_axis, -0.197979, 11.491924 * MOVEANIMATIONSPEED) -- delta=21.95
			Turn(lleg1, x_axis, 0.239548, 12.241165 * MOVEANIMATIONSPEED) -- delta=-23.38
			Turn(lleg2, x_axis, 0.001826, 3.372927 * MOVEANIMATIONSPEED) -- delta=-6.44
			Turn(lleg3, x_axis, -0.043394, 4.122172 * MOVEANIMATIONSPEED) -- delta=7.87
			Turn(rfoot, x_axis, 0.093336, 9.298367 * MOVEANIMATIONSPEED) -- delta=-17.76
			Turn(rleg1, x_axis, -0.502866, 16.238494 * MOVEANIMATIONSPEED) -- delta=31.01
			Turn(rleg2, x_axis, 0.389768, 1.162977 * MOVEANIMATIONSPEED) -- delta=2.22
			Turn(rleg3, x_axis, -0.278019, 0.830296 * MOVEANIMATIONSPEED) -- delta=1.59
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then 
			if not attacking then
				Turn(chest, z_axis, 0.000000, 1.047198 * MOVEANIMATIONSPEED) -- delta=-2.00			
			end
			Turn(lfoot, x_axis, -0.562761, 10.943452 * MOVEANIMATIONSPEED) -- delta=20.90
			Turn(lleg1, x_axis, 0.832702, 17.794638 * MOVEANIMATIONSPEED) -- delta=-33.99
			Turn(lleg2, x_axis, -0.318914, 9.622195 * MOVEANIMATIONSPEED) -- delta=18.38
			Turn(lleg3, x_axis, 0.048973, 2.771014 * MOVEANIMATIONSPEED) -- delta=-5.29
			Turn(rfoot, x_axis, 0.458339, 10.950074 * MOVEANIMATIONSPEED) -- delta=-20.91
			Turn(rleg1, x_axis, -0.200271, 9.077833 * MOVEANIMATIONSPEED) -- delta=-17.34
			Turn(rleg2, x_axis, -0.698333, 32.643035 * MOVEANIMATIONSPEED) -- delta=62.34
			Turn(rleg3, x_axis, 0.440266, 21.548528 * MOVEANIMATIONSPEED) -- delta=-41.15
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end
		if moving then
			EmitSfx( rfoot,  FOOTDUST )				
			if not attacking then
				Turn(chest, z_axis, -0.069813, 2.094395 * MOVEANIMATIONSPEED) -- delta=-4.00
			end
			Turn(lfoot, x_axis, -0.225644, 10.113499 * MOVEANIMATIONSPEED) -- delta=-19.32
			Turn(lleg1, x_axis, 0.050994, 23.451249 * MOVEANIMATIONSPEED) -- delta=44.79
			Turn(lleg2, x_axis, 0.419028, 22.138258 * MOVEANIMATIONSPEED) -- delta=-42.28
			Turn(lleg3, x_axis, -0.244378, 8.800512 * MOVEANIMATIONSPEED) -- delta=16.81
			Turn(rfoot, x_axis, 0.178549, 8.393690 * MOVEANIMATIONSPEED) -- delta=16.03
			Turn(rleg1, x_axis, -0.160558, 1.191409 * MOVEANIMATIONSPEED) -- delta=-2.28
			Turn(rleg2, x_axis, -0.115104, 17.496877 * MOVEANIMATIONSPEED) -- delta=-33.42
			Turn(rleg3, x_axis, 0.097112, 10.294600 * MOVEANIMATIONSPEED) -- delta=19.66
			Sleep(MOVEANIMATIONSLEEPTIME)
		end
		if moving then 
			if not attacking then
				Turn(chest, z_axis, -0.034907, 1.047197 * MOVEANIMATIONSPEED) -- delta=2.00
			end
			Turn(lfoot, x_axis, 0.107267, 9.987327 * MOVEANIMATIONSPEED) -- delta=-19.07
			Turn(lleg1, x_axis, -0.511748, 16.882274 * MOVEANIMATIONSPEED) -- delta=32.24
			Turn(lleg2, x_axis, 0.387242, 0.953583 * MOVEANIMATIONSPEED) -- delta=1.82
			Turn(lleg3, x_axis, -0.280540, 1.084865 * MOVEANIMATIONSPEED) -- delta=2.07
			Turn(rfoot, x_axis, -0.190457, 11.070176 * MOVEANIMATIONSPEED) -- delta=21.14
			Turn(rleg1, x_axis, 0.230770, 11.739847 * MOVEANIMATIONSPEED) -- delta=-22.42
			Turn(rleg2, x_axis, 0.007419, 3.675679 * MOVEANIMATIONSPEED) -- delta=-7.02
			Turn(rleg3, x_axis, -0.047733, 4.345351 * MOVEANIMATIONSPEED) -- delta=8.30
			Sleep(MOVEANIMATIONSLEEPTIME)	
		end
		if moving then
			if not attacking then
				Turn(chest, z_axis, 0.000000, 1.047198 * MOVEANIMATIONSPEED) -- delta=2.00
			end
			Turn(lfoot, x_axis, 0.470887, 10.908598 * MOVEANIMATIONSPEED) -- delta=-20.83
			Turn(lleg1, x_axis, -0.222431, 8.679533 * MOVEANIMATIONSPEED) -- delta=-16.58
			Turn(lleg2, x_axis, -0.677572, 31.944415 * MOVEANIMATIONSPEED) -- delta=61.01
			Turn(lleg3, x_axis, 0.429116, 21.289682 * MOVEANIMATIONSPEED) -- delta=-40.66
			Turn(rfoot, x_axis, -0.544216, 10.612788 * MOVEANIMATIONSPEED) -- delta=20.27
			Turn(rleg1, x_axis, 0.810022, 17.377542 * MOVEANIMATIONSPEED) -- delta=-33.19
			Turn(rleg2, x_axis, -0.299802, 9.216636 * MOVEANIMATIONSPEED) -- delta=17.60
			Turn(rleg3, x_axis, 0.033997, 2.451885 * MOVEANIMATIONSPEED) -- delta=-4.68
			Sleep(MOVEANIMATIONSLEEPTIME)		
		end
   		if moving then
			EmitSfx( lfoot,  FOOTDUST )		
			if not attacking then	
				Turn(chest, z_axis, 0.069813, 2.094395 * MOVEANIMATIONSPEED) -- delta=4.00
			end
			Turn(lfoot, x_axis, 0.185085, 8.574049 * MOVEANIMATIONSPEED) -- delta=16.38
			Turn(lleg1, x_axis, -0.168491, 1.618187 * MOVEANIMATIONSPEED) -- delta=-3.09
			Turn(lleg2, x_axis, -0.110605, 17.009009 * MOVEANIMATIONSPEED) -- delta=-32.48
			Turn(lleg3, x_axis, 0.094011, 10.053146 * MOVEANIMATIONSPEED) -- delta=19.20
			Turn(rfoot, x_axis, -0.216609, 9.828212 * MOVEANIMATIONSPEED) -- delta=-18.77
			Turn(rleg1, x_axis, 0.038417, 23.148138 * MOVEANIMATIONSPEED) -- delta=44.21
			Turn(rleg2, x_axis, 0.428534, 21.850093 * MOVEANIMATIONSPEED) -- delta=-41.73
			Turn(rleg3, x_axis, -0.250342, 8.530167 * MOVEANIMATIONSPEED) -- delta=16.29
			Sleep(MOVEANIMATIONSLEEPTIME)			
		end		
		if not moving then 
			if not attacking then
				Turn(chest, z_axis, 0, 2.094395 * MOVEANIMATIONSPEED)
			end
			Turn(lfoot, x_axis, 0, 11.491924 * MOVEANIMATIONSPEED)
			Turn(lleg1, x_axis, 0, 23.451249 * MOVEANIMATIONSPEED)
			Turn(lleg2, x_axis, 0, 31.944415 * MOVEANIMATIONSPEED)
			Turn(lleg3, x_axis, 0, 21.289682 * MOVEANIMATIONSPEED)
			Turn(rfoot, x_axis, 0, 11.070176 * MOVEANIMATIONSPEED)
			Turn(rleg1, x_axis, 0, 23.148138 * MOVEANIMATIONSPEED)
			Turn(rleg2, x_axis, 0, 32.643035 * MOVEANIMATIONSPEED)
			Turn(rleg3, x_axis, 0, 21.548528 * MOVEANIMATIONSPEED)
			Sleep(MOVEANIMATIONSLEEPTIME*0.5)			
		end
		Sleep(5)
	end
end

-- Bored Animation
local function BoredAnimation()
	while true do
		if not attacking and not moving then
			borednumber = math.random(500)
			if (borednumber > 497) and not attacking then
				Turn2( chest, y_axis, math.random(360), 30 )				
				WaitForTurn( chest, y_axis )
			end
		end
		Sleep(50)		
	end
end

-- Dusters
local function Dusters()
-----------------------------------------------------------------	
	while unfinished do
		local x, y, z = Spring.GetUnitPosition(unitID)			
		local UnitsAround = Spring.GetUnitsInSphere(x,y,z, 80)
		local factorycount = 0
		for _,eUnitID in ipairs(UnitsAround) do
			local eUnitDefId = Spring.GetUnitDefID(eUnitID)
			if factories [eUnitDefId] then
				factorycount = (factorycount + 1)
			end
		end
		if (factorycount > 0) then
			unfinished = true
		else 
			unfinished = false
		end
		EmitSfx( dusters1,  FOOTDUST )	
		EmitSfx( dusters2,  FOOTDUST )	
		EmitSfx( dusters3,  FOOTDUST )	
		EmitSfx( dusters4,  FOOTDUST )			
		Sleep(150)
	end	
-----------------------------------------------------------------	
	Move( pelvis, y_axis, 0, 40)
	StartThread( Walkscript )
	StartThread( BoredAnimation )
end

------------------------ ACTIVATION

function script.Create()
	SetMoveAnimationSpeed()
	
	unfinished = true
	attacking = false	
	restore_delay = 1000
	smallgun = 1	

	Move( pelvis, y_axis, -45)
	
	Turn(lleg1, x_axis, math.rad(-20.000000))
	Turn(lleg2, x_axis, math.rad(50.000000))
	Turn(lleg3, x_axis, math.rad(-60.000000))
	Turn(lfoot, x_axis, math.rad(30.000000))
	
	Turn(rleg1, x_axis, math.rad(-20.000000))
	Turn(rleg2, x_axis, math.rad(50.000000))
	Turn(rleg3, x_axis, math.rad(-60.000000))
	Turn(rfoot, x_axis, math.rad(30.000000))

	
	--START BUILD CYCLE
	Sleep(200)
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(300)
	end
	--END BUILD CYCLE
	StartThread( Dusters )
end

function script.StartMoving()
	moving = true
end

function script.StopMoving()
	moving = false 
end

local function RestoreAfterDelay()
	Sleep( 5000)
	Turn2( turret1 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , x_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret1 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , y_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret1 , z_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret2 , z_axis, 0, MOVEANIMATIONSPEED )
	Turn2( turret3 , z_axis, 0, MOVEANIMATIONSPEED )
	attacking = false
	return (0)
end

--weapon 1 -----------------------------------------------------------------

function script.QueryWeapon1 ()
	if (smallgun == 1) then
		return emit11
	elseif (smallgun == 2) then
		return emit12
	elseif (smallgun == 3) then
		return emit21
	else
		return emit22
	end
end

function script.AimFromWeapon1 ()
	return chest	
end

function script.AimWeapon1(heading, pitch)
	Turn2( chest, y_axis, 0, 300 )		
	Turn2( turret1, z_axis, 0, MOVEANIMATIONSPEED*5 )
	Turn2( turret2, z_axis, 0, MOVEANIMATIONSPEED*5 )	

	attacking = true
	Signal( SIG_AIM1)
	SetSignalMask( SIG_AIM1)
	
	Turn( chest, y_axis, heading, 5 )
	Turn( turret1, x_axis, -pitch, 5 )		
	Turn( turret2, x_axis, -pitch, 5 )	
	
	WaitForTurn(turret1, x_axis)
	WaitForTurn(turret2, x_axis)    	
	WaitForTurn(chest, y_axis)
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot1()
	if (smallgun == 1) then
		Move( gun11, z_axis, -7 )	
		EmitSfx( emit11,  FLARE )
		EmitSfx( emit_groundflash1,  GROUNDFLASH )
		Move( gun11, z_axis, 0, 20 )			
		smallgun = 2
	elseif (smallgun == 2) then
		Move( gun12, z_axis, -7 )	
		EmitSfx( emit12,  FLARE )
		EmitSfx( emit_groundflash1,  GROUNDFLASH )
		Move( gun12, z_axis, 0, 20 )		
	    smallgun = 3
	elseif (smallgun == 3) then
		Move( gun21, z_axis, -7 )	
		EmitSfx( emit21,  FLARE )
		EmitSfx( emit_groundflash2,  GROUNDFLASH )
		Move( gun21, z_axis, 0, 20 )		
		smallgun = 4
	else
		Move( gun22, z_axis, -7 )	
		EmitSfx( emit22,  FLARE )
		EmitSfx( emit_groundflash2,  GROUNDFLASH )
		Move( gun22, z_axis, 0, 20 )		
		smallgun = 1
	end
	return (0)
end


--weapon 2 -----------------------------------------------------------------

function script.QueryWeapon2 (piecenum)
	return emit3	
end

function script.AimFromWeapon2 (piecenum)
	return turret3	
end

function script.AimWeapon2 (heading, pitch)

	attacking = true
	Signal( SIG_AIM2)
	SetSignalMask( SIG_AIM2)

	Turn( chest, y_axis, heading, 5 )
	Turn( turret3, x_axis, -pitch, 1 )	
 
    WaitForTurn(chest, y_axis)
	WaitForTurn(turret3, x_axis)
	
	StartThread(RestoreAfterDelay) 
    return (1)
end

function script.Shot2()
	Move( gun3, z_axis, -15 )	
	EmitSfx( emit3,  BIGFLARE )	
	EmitSfx( emit_groundflash3,  GROUNDFLASH )
	Move( gun3, z_axis, 0, 15 )	
	return (0)
end

	
function script.Killed(severity, corpsetype)
	Turn2( chest, y_axis, 0, 60 )
	Move( pelvis, y_axis, -45, 100)
	EmitSfx( pelvis,  BOOM )
	Sleep( 500)
	return (0)
end