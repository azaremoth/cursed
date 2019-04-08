include "constants.lua"
include "common.lua"

-- pieces
local base = piece 'base' 
local barrack = piece 'barrack' 
local door = piece 'door' 
local extension = piece 'extension' 
local light1 = piece 'light1' 
local light2 = piece 'light2' 
local light3 = piece 'light3' 
local light4 = piece 'light4' 
local light5 = piece 'light5'
local fist = piece 'fist'

-- action pieces
local buildpoint = piece 'buildpoint' 
local smokePieces= { barrack, extension, light4 }
local nanoPieces = { base }

-- variables
local isbuilding = false

-- FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local LIGHT	 = 1026+0

---------------------------

local function Building()
	while true do
		if isbuilding then
			EmitSfx(light1,LIGHT)
			Sleep(150)
		end
		if isbuilding then
			EmitSfx(light3,LIGHT)
			Sleep(150)
		end		
		if isbuilding then
			EmitSfx(light4,LIGHT)
			Sleep(150)
		end	
		if isbuilding then
			EmitSfx(light5,LIGHT)
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
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/1500000)
	Move( barrack, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( barrack, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( barrack, y_axis, 0, 1000 )
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
