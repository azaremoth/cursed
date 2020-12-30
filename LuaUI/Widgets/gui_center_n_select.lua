function widget:GetInfo()
  return {
    name      = "Select n Center",
    desc      = "Selects always and centers at the start of a campaign mission.",
    author    = "quantum, Evil4Zerggin, azaremoth",
    date      = "19 April 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 1003,
    enabled   = true  --  loaded by default?
  }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local go = true
local runtimesec = 3
local zDist = 750
local yDist = 1750

local modOptions = Spring.GetModOptions()
local campaignBattleID = modOptions.singleplayercampaignbattleid

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Update()
	local t = Spring.GetGameSeconds()
	if (select(3,Spring.GetPlayerInfo(Spring.GetMyPlayerID(),false)) or t > runtimesec) then
		widgetHandler:RemoveWidget(self)
		return
	end
	if (t > 0 and t < runtimesec) then
		local unitArray = Spring.GetTeamUnits(Spring.GetMyTeamID())
		if unitArray[1] and go then
			Spring.SelectUnitArray{unitArray[1]}
			go = false
		end
		if unitArray[1] and campaignBattleID then
			local camera = Spring.GetCameraState()		
			local x, y, z = Spring.GetUnitPosition(unitArray[1])
		  
			camera.px = x
			camera.py = y+yDist
			camera.pz = z+zDist	  
			camera.dx = 0
			camera.dy = -0.90
			camera.dz = -0.45
			camera.rx = -1.02
			camera.ry = 3.14
			camera.rz = 0
			
			Spring.SetCameraState(camera)
			if WG.COFC_SetCameraTarget ~= nil then
				WG.COFC_SetCameraTarget(x,y,z,0.5,true,yDist)
			end
		end
	end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------