local base = piece "base"
local emit1 = piece "emit1"
local emit2 = piece "emit2"
local emit3 = piece "emit3"
local emit4 = piece "emit4"

local EMIT 	= 1024+0

local function Emiting()
	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitBuildFacing(unitID)
	local team = Spring.GetUnitTeam(unitID)
	Sleep(5000)
	local emit_smoke = Spring.CreateUnit('emit_smoke', x, y, z, heading, team, false, false)
	Sleep(3000)	
	EmitSfx( emit1,  EMIT )	
	Sleep(300)
	EmitSfx( emit2,  EMIT )	
	Sleep(250)
	EmitSfx( emit3,  EMIT )
	EmitSfx( emit4,  EMIT )
	Sleep(150)
	local tower_open = Spring.CreateFeature('artower_open', x, y, z, heading, team)
	local emit_beam = Spring.CreateUnit('noemit_high', x, y, z, heading, team, false, false)
	local emit_beam = Spring.CreateUnit('emit_medsmoke', x+150, y-50, z, heading, team, false, false)	
	Sleep(30)	
	Spring.DestroyUnit(unitID, false, false)
end

function script.Create( )
	SendToUnsynced('setselectable', unitID, false)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		Sleep(100)
	end
	StartThread(Emiting)
end

function script.Killed()
	--return 0
end