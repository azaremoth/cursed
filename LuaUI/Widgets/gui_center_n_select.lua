function widget:GetInfo()
return {
 	name      = "Select n Center!",
 	desc      = "Selects and centers units at start of the game",
 	author    = "quantum, Evil4Zerggin, TheFatController",
 	date      = "12 Feb 2009",
 	license   = "GNU GPL, v2 or later",
 	layer     = 5,
 	enabled   = true
 	}
 end

local myTeamID = Spring.GetMyTeamID()
 	
if select(3,Spring.GetPlayerInfo(myTeamID)) then -- spectator check
 	return false
end
 	
local playerCount = 0
for _, playerID in ipairs(Spring.GetPlayerList(myTeamID)) do
 	if not select(3,Spring.GetPlayerInfo(playerID)) then
		playerCount = playerCount + 1
	end
end

if (playerCount > 1) then
 	    return false
end

 	
function widget:UnitFinished(unitID, unitDefID, unitTeam)
 	if (unitTeam ~= myTeamID) then return end
 	Spring.SelectUnitArray({unitID})
 	local x,y,z = Spring.GetUnitPosition(unitID)
 	Spring.SetCameraTarget(x,200,z)
 	widgetHandler:RemoveWidget()
 end
 	
 --------------------------------------------------------------------------------
 --------------------------------------------------------------------------------