--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Ground Decal Fix",
    desc      = "Adds ground decal to immobile builders that aren't factories",
    author    = "CarRepairer",
    date      = "2009-06-20",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


if gadgetHandler:IsSyncedCode() then
------ SYNCED ----------	

local ib = {
	[UnitDefNames['tc_obelisk'].id] = true,
	[UnitDefNames['tc_obelisk_lvl2'].id] = true,
	[UnitDefNames['tc_heart'].id] = true,
	[UnitDefNames['tc_heart_ai'].id] = true,
	-- Add more units here...
	
}

local addDecals, destroyDecals, decalList = {}, {}, {}

function gadget:UnitCreated(unitID, unitDefID, teamID)
	if ib[unitDefID] then
		addDecals[unitID] = teamID
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	addDecals[unitID] = nil
	if ib[unitDefID] then
		destroyDecals[unitID] = true
	end
end


function gadget:GameFrame(n)
	for unitID, teamID in pairs(addDecals) do
		local x,y,z = Spring.GetUnitPosition(unitID)
		local newUnitID = Spring.CreateUnit('grounddecal', x, y, z, 1, teamID)
		SendToUnsynced('hidefakeunit', newUnitID, teamID)
		decalList[unitID] = newUnitID
	end
	addDecals = {}
	
	for unitID, _ in pairs(destroyDecals) do
		if decalList[unitID] then 
			Spring.DestroyUnit(decalList[unitID], false, true)
			decalList[unitID] = nil
		else
			-- should not happen unless luarules reloaded
			Spring.Echo("Ground decal fix: Error 1")
		end
		
	end
	
	destroyDecals = {}
end

------ SYNCED ----------
else
------ UNSYNCED ----------


local spSetUnitNoMinimap    = Spring.SetUnitNoMinimap
local spSetUnitNoSelect     = Spring.SetUnitNoSelect
local spSetUnitNoDraw       = Spring.SetUnitNoDraw

local function HideFakeUnit(cmd, unitID, unitTeam)	
	if (type(unitID) ~= 'number') then
		return
	end
	spSetUnitNoDraw(unitID, true)
	spSetUnitNoMinimap(unitID, true)
	spSetUnitNoSelect(unitID, true)
end

function gadget:Initialize()
  gadgetHandler:AddSyncAction('hidefakeunit', HideFakeUnit)
end

function gadget:Shutdown(unitID)
  gadgetHandler:RemoveSyncAction('hidefakeunit') 
end

------ UNSYNCED ----------
end
