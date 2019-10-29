local base = piece "base"
local emit1 = piece "emit1"
local emit2 = piece "emit2"
local emit3 = piece "emit3"
local emit4 = piece "emit4"

local EMIT 	= 1024+0
local BOOM 	= 1025+0

local function Emiting()
	local x, y, z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitBuildFacing(unitID)
	local team = Spring.GetUnitTeam(unitID)
	Sleep(3000)
	local emit_smoke = Spring.CreateUnit('emit_smoke', x, y, z, heading, team, false, false)
	Sleep(6000)	
	Spring.PlaySoundFile("sounds/explosion/ex_large5.wav", 20, x, y, z)
	EmitSfx( emit1,  EMIT )	
	Sleep(300)
	EmitSfx( emit2,  EMIT )	
	Spring.PlaySoundFile("sounds/explosion/ex_large3.wav", 20, x, y, z)	
	Sleep(450)
	EmitSfx( emit3,  EMIT )
	EmitSfx( emit4,  EMIT )
	Spring.PlaySoundFile("sounds/explosion/ex_large5.wav", 20, x, y, z)	
	Sleep(150)
	EmitSfx( emit4,  BOOM )	
	Spring.PlaySoundFile("sounds/explosion/mini_nuke.wav", 20, x, y, z)	
	local tower_open = Spring.CreateFeature('artower_open', x, y, z, heading, team)
	local emit_beam = Spring.CreateUnit('noemit_high', x, y, z, heading, team, false, false)
	
	Spring.SpawnCEG('BURROWING_BIGGEST', x-100, y, z+160)
	local rubble = Spring.CreateFeature('rubble2', x-100, y, z+160, heading, team)	
	local emit_smoke = Spring.CreateUnit('emit_medsmoke', x-100, y, z+160, heading, team, false, false)	
	Sleep(100)	
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