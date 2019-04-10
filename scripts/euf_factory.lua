include "constants.lua"
include "common.lua"

-- pieces
local base = piece 'base' 
local factory = piece 'factory' 
local door = piece 'door' 
local emit_sparkles1 = piece 'emit_sparkles1' 
local emit_sparkles2 = piece 'emit_sparkles2' 
local emit_sparkles3 = piece 'emit_sparkles3' 
local emit_smoke1 = piece 'emit_smoke1' 
local emit_smoke2 = piece 'emit_smoke2' 
local fist = piece 'fist'

-- action pieces
local buildpoint = piece 'buildpoint' 
local smokePieces= { factory, fist }
local nanoPieces = { base }

-- variables
local isbuilding = false

-- FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local FUNNELSMOKE = 1027+0
local SPARKS	 = 1026+0

---------------------------

local function Building()
	while true do
		if isbuilding then
			EmitSfx(emit_sparkles1,SPARKS)
			EmitSfx(emit_smoke1,FUNNELSMOKE)			
			Sleep(150)
		end
		if isbuilding then
			EmitSfx(emit_sparkles2,SPARKS)
			Sleep(150)
		end		
		if isbuilding then
			EmitSfx(emit_sparkles3,SPARKS)
			EmitSfx(emit_smoke2,FUNNELSMOKE)				
		end		
		Sleep(250)		
	end
end

local function Open ()
	SetSignalMask (1)

	Move( door , y_axis, -40 , 40 )
	WaitForMove (door, y_axis)

	-- set values
	SetUnitValue (COB.YARD_OPEN, 1)
	SetUnitValue (COB.INBUILDSTANCE, 1)
	SetUnitValue (COB.BUGGER_OFF, 1)
end

local function Close()
	Signal (1)

	-- set values
	SetUnitValue (COB.YARD_OPEN, 0)
	SetUnitValue (COB.BUGGER_OFF, 0)
	SetUnitValue (COB.INBUILDSTANCE, 0)

	-- move pieces back to original spots
	Move( door , y_axis, 0 , 40 )

end

function script.Create()
	Spring.Echo("NotAI():")
	Spring.Echo(NotAI())
	if NotAI() then
		Hide(fist)
	end
	local structureheight = ((-15*GetUnitValue(COB.UNIT_HEIGHT))/1000000)
	Move( base, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( base, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( base, y_axis, 0, 1000 )
	Sleep(500)

	StartThread (SmokeUnit, smokePieces)
	StartThread( Building )	
	Spring.SetUnitNanoPieces (unitID, nanoPieces)
end

function script.QueryNanoPiece ()
	return base
end

function script.Activate ()
	isbuilding = true
	StartThread (Open) -- animation needs its own thread because Sleep and WaitForTurn will not work otherwise
end

function script.Deactivate ()
	isbuilding = false
	StartThread (Close)
end

function script.QueryBuildInfo ()
	return buildpoint
end

function script.Killed (recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if (severity <= .5) then
		EmitSfx(base,BOOM)
		Explode (door, SFX.SHATTER)
		
		return 1
	else
		EmitSfx(base,BOOM)
		Explode (door, SFX.SHATTER)

		return 2
	end
end
