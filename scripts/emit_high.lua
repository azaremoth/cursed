-- Blocks

local base = piece "base"
local mid = piece "mid"
local high = piece "high"

local EMIT 	= 1024+0

local function Emiting()
	while true do
		EmitSfx( high,  EMIT )	
		Sleep(50)
	end
end

function script.Create( )
	StartThread(Emiting)
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	Spring.SetUnitCloak(unitID, 2, 0)	
end

function script.Killed()
	--return 0
end