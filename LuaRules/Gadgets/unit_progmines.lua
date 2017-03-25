function gadget:GetInfo()
  return {
    name      = "Progressive mining",
    desc      = "Mines will nit start with max output at once",
    author    = "TheFatController", -- GUI elements from unit_start_boost by Licho
    date      = "15 Dec 2009",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then

	local mexList = {}
	
	--local SetUnitMetalExtraction = Spring.SetUnitMetalExtraction

	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	  if (UnitDefs[unitDefID].extractsMetal > 0) then

		local maxExtracts = (Spring.GetUnitRulesParam(unitID, "mexIncome"))
		local extracts = maxExtracts * 0.25
		
		if (maxExtracts == nil) then
			maxExtracts = (UnitDefs[unitDefID].extractsMetal * 1.25)
			extracts = maxExtracts * 0.25
		end
		Spring.SetUnitResourcing(unitID, "cmm", extracts)
		--SetUnitMetalExtraction(unitID, extracts)
		local radius = 33
		if (UnitDefs[unitDefID].extractsMetal > 0.001) then
		  radius = 49
		end
		mexList[unitID] = { 
			extracts = extracts,
			frame = Spring.GetGameFrame(), 
			maxExtracts = maxExtracts,
			step = ((maxExtracts-extracts)/60),
			radius = radius
		  }
		SendToUnsynced("UpdateMine", unitID, extracts, maxExtracts, radius)
	  end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	  mexList[unitID] = nil
	  SendToUnsynced("RemoveMine", unitID)
	end

	function gadget:GameFrame(n)
		if ((n % 15) == 14) then -- 2/s
			for unitID, defs in pairs(mexList) do
				if defs.extracts < defs.maxExtracts and (select(1,Spring.GetUnitResources(unitID)) > 0) then
					  defs.extracts = defs.extracts + defs.step 
					  -- SetUnitMetalExtraction(unitID, defs.extracts)
					  Spring.SetUnitResourcing(unitID, "cmm", defs.extracts)
					  SendToUnsynced("UpdateMine", unitID, defs.extracts, defs.maxExtracts)
				elseif (defs.extracts == defs.maxExtracts or defs.extracts > defs.maxExtracts) then
					  SendToUnsynced("UpdateMine", unitID, defs.extracts, defs.maxExtracts, defs.radius-3)
					  mexList[unitID] = nil
				end
			end
		end
	end
	
	function gadget:GameStart()
	  Spring.Echo("Progressive Mine mode enabled: Mines will take time to reach full productivity.")
	end

else

	local GetLocalTeamID = Spring.GetLocalTeamID
	local GetUnitTeam = Spring.GetUnitTeam
	local AreTeamsAllied = Spring.AreTeamsAllied
	local teamID = GetLocalTeamID()
	local mineList = {}
	local teamColors = {}
	local spec = false
	
	local function GetTeamColor(teamID)
	  local color = teamColors[teamID]
	  if (color) then
		return color[1], color[2], color[3]
	  end
	  local r,g,b = Spring.GetTeamColor(teamID)
	  
	  color = { r, g, b }
	  teamColors[teamID] = color
	  return r, g, b 
    end

	function gadget:Initialize()
	  gadgetHandler:AddSyncAction("UpdateMine",UpdateMine)
	  gadgetHandler:AddSyncAction("RemoveMine",RemoveMine)
	end
	  
	function UpdateMine(_, unitID, value, valueMax, radius) 
		if not mineList[unitID] then
		  mineList[unitID] = {
		    start = value,
		    percent = 0,
		    radius = radius,
		    alpha = 0.8,
		  }
		else
		  mineList[unitID].percent = (value-mineList[unitID].start)/(valueMax-mineList[unitID].start)
		  if radius then
		    mineList[unitID].radius = radius
		    mineList[unitID].alpha = 0.0
		  end
		end
		spec, fullview = Spring.GetSpectatingState()
		spec = spec or fullview
	end
	
	function RemoveMine(_, unitID)
	  mineList[unitID] = nil
	end
	  
	local function circleLines(percentage, radius)
		gl.BeginEnd(GL.LINE_STRIP, function()
			local radstep = ((2.0 * math.pi) / 60) * -1
			for i = 0, 60 * percentage do
				local a = (i * radstep)
				gl.Vertex(math.sin(a)*radius, 0, math.cos(a)*radius)
			end
		end)
	end  

	function gadget:DrawWorldPreUnit()
		teamID = GetLocalTeamID()
		for unitID, defs in pairs(mineList) do
			local unitTeam = GetUnitTeam(unitID)
			if (unitTeam ~= nil and (spec or AreTeamsAllied(teamID, unitTeam))) then
				gl.LineWidth(5)
				gl.Color(0,0,0,defs.alpha)
				gl.DrawFuncAtUnit(unitID, false, circleLines,defs.percent, defs.radius)
				gl.LineWidth(3)
				local r,g,b = GetTeamColor(unitTeam)
				gl.Color(r,g,b,defs.alpha)
				gl.DrawFuncAtUnit(unitID, false, circleLines,defs.percent, defs.radius)
			end
		end
	end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------