local obelisk1, obelisk2, obelisk3, obelisk4, obelisk5, obelisk6 = piece ("obelisk1", "obelisk2", "obelisk3", "obelisk4", "obelisk5", "obelisk6")
local horn1, horn2, horn3, horn4, horn5, horn6, horn7 = piece ("horn1", "horn2", "horn3", "horn4", "horn5", "horn6", "horn7")

local base = piece 'base' 
local createpoint = piece 'createpoint' 
local emit = piece 'emit' 

local open = false

local SIG_ANIM = 1

--FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local BUILDERFX	 = 1026+0

local function Open()
	if open then
		return
	end
	Signal(SIG_ANIM)
	SetSignalMask(SIG_ANIM)
	open = true

	SetUnitValue(COB.BUGGER_OFF, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.YARD_OPEN, 1)
end

local function Close()
	if not open then
		return
	end
	Signal(SIG_ANIM)
	SetSignalMask(SIG_ANIM)
	open = false

	SetUnitValue(COB.BUGGER_OFF, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.YARD_OPEN, 0)
	
end

function script.Create()
	local structureheight = ((-50*GetUnitValue(COB.UNIT_HEIGHT))/3080192)
	Move( building, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( building, y_axis, outofground, 200 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( building, y_axis, 0, 1000 )
	Sleep(500)

	
	Spring.SetUnitNanoPieces(unitID, {emit})
	StartThread(Open)
end

function script.QueryNanoPiece()
--	GG.LUPS.QueryNanoPiece(unitID, unitDefID, spGetUnitTeam(unitID), emit)
	return nano
end

function script.Activate ()
	StartThread(Open)
end

local firstDeactivate = true
function script.Deactivate()
	if firstDeactivate then
		firstDeactivate = false
		return
	end
	StartThread(Close)
end

function script.QueryBuildInfo()
	return createpoint
end

function script.Killed(recentDamage, maxHealth)
	EmitSfx(base,BOOM)
	return (1)
end
