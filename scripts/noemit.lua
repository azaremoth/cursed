-- Blocks

local base = piece "base"
local mid = piece "mid"
local high = piece "high"

local EMIT 	= 1024+0

function script.Create( )
	SendToUnsynced('setselectable', unitID, false)
	Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, false)
	Spring.SetUnitCloak(unitID, 2, 0)	
end

function script.Killed()
	--return 0
end