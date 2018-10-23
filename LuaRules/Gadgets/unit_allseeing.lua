function gadget:GetInfo()
  return {
    name      = "All Seeing",
    desc      = "Certain units get vision of any unit within sight range",
    author    = "CarRepairer",
    date      = "2009-07-19",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

local spGetUnitAllyTeam		= Spring.GetUnitAllyTeam
local spGetUnitPosition		= Spring.GetUnitPosition
local spGetUnitsInSphere	= Spring.GetUnitsInSphere
local spGetAllyTeamList		= Spring.GetAllyTeamList
local spSetUnitLosState		= Spring.SetUnitLosState
local spSetUnitLosMask		= Spring.SetUnitLosMask
local spGetUnitDefID    	= Spring.GetUnitDefID
--local spGetTeamInfo    		= Spring.GetTeamInfo

local Echo = Spring.Echo
local cloakedUnits = {}
local sightrange = 512

local seerTypes = {
	[UnitDefNames.tc_seer.id] = true,
	[UnitDefNames.euf_sensorbot.id] = true,
	[UnitDefNames.euf_priest.id] = true,	
	[UnitDefNames.euf_wolf.id] = true,

	[UnitDefNames.tc_shade.id] = true,
	[UnitDefNames.tc_shade_lvl1.id] = true,
	[UnitDefNames.tc_shade_lvl2.id] = true,
	[UnitDefNames.tc_shade_lvl3.id] = true,
	[UnitDefNames.tc_shade_lvl4.id] = true,
	[UnitDefNames.tc_shade_lvl5.id] = true,
	[UnitDefNames.tc_shade_lvl6.id] = true,
	[UnitDefNames.tc_shade_lvl7.id] = true,
	[UnitDefNames.tc_shade_lvl8.id] = true,
	[UnitDefNames.tc_shade_lvl9.id] = true,
	[UnitDefNames.tc_shade_lvl10.id] = true,
	
	[UnitDefNames.euf_sarge.id] = true,
	[UnitDefNames.euf_sarge_lvl1.id] = true,
	[UnitDefNames.euf_sarge_lvl2.id] = true,
	[UnitDefNames.euf_sarge_lvl3.id] = true,
	[UnitDefNames.euf_sarge_lvl4.id] = true,
	[UnitDefNames.euf_sarge_lvl5.id] = true,
	[UnitDefNames.euf_sarge_lvl6.id] = true,
	[UnitDefNames.euf_sarge_lvl7.id] = true,
	[UnitDefNames.euf_sarge_lvl8.id] = true,
	[UnitDefNames.euf_sarge_lvl9.id] = true,
	[UnitDefNames.euf_sarge_lvl10.id] = true,
	
}
local seers = {}
local seen = {}

--local gaiaAlliance, gaiaTeam


function gadget:GameFrame(f)
	if f % 16 ~= 0 then return end
	
	for unitID, data in pairs(seers) do
		local x,y,z = spGetUnitPosition(unitID)
		local alliance = data.alliance
		local units = spGetUnitsInSphere(x,y,z, data.sight)
		for _, unitID2 in ipairs(units) do
			
			local seenAlliance = spGetUnitAllyTeam(unitID2)
			if seenAlliance ~= alliance then
				spSetUnitLosMask(unitID2, alliance, {los=true} )
				spSetUnitLosState(unitID2, alliance, {los=true} )
				seen[alliance][unitID2] = 2
			end
		end
	end
	for alliance, seenUnits in pairs(seen) do
		for seenUnit,num in pairs(seenUnits) do
			seen[alliance][seenUnit] = num-1
			if num == 1 then
				spSetUnitLosMask(seenUnit, alliance, {los=false} )
				seen[alliance][seenUnit] = nil
			end
		end
	end
end

function gadget:UnitTaken(unitID, unitDefID, oldTeamID, teamID)
	if seerTypes[unitDefID] then
		seers[unitID] = {sight = sightrange, alliance = spGetUnitAllyTeam(unitID) }
	end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if seerTypes[unitDefID] then
		seers[unitID] = {sight = sightrange, alliance = spGetUnitAllyTeam(unitID) }
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	seers[unitID] = nil
end

function gadget:Initialize()
	--gaiaTeam = Spring.GetGaiaTeamID()
	--_,_,_,_,_, gaiaAlliance = spGetTeamInfo(gaiaTeam)
	
	for _, alliance in ipairs(spGetAllyTeamList()) do
		seen[alliance] = {}
	end
	
	local allUnits = Spring.GetAllUnits()
	for _, unitID in ipairs(allUnits) do
		gadget:UnitCreated(unitID, spGetUnitDefID(unitID), _)
	end
end












