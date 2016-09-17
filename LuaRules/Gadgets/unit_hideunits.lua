--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Hide Units",
    desc      = "Unsynced function to hide units from being drawn.",
    author    = "CarRepairer",
    date      = "2009-12-05",
    license   = "GNU GPL, v2 or later",
    layer     = -1,
    enabled   = true,
  }
end


local echo = Spring.Echo

if not gadgetHandler:IsSyncedCode() then
------ UNSYNCED ----------


local spSetUnitNoMinimap    = Spring.SetUnitNoMinimap
local spSetUnitNoSelect     = Spring.SetUnitNoSelect
local spSetUnitNoDraw       = Spring.SetUnitNoDraw

local function HideUnit(cmd, unitID)
	if (type(unitID) ~= 'number') then
		return
	end
	spSetUnitNoDraw(unitID, true)
	spSetUnitNoMinimap(unitID, true)
	spSetUnitNoSelect(unitID, true)
end
local function ShowUnit(cmd, unitID)
	if (type(unitID) ~= 'number') then
		return
	end
	spSetUnitNoDraw(unitID, false)
	spSetUnitNoMinimap(unitID, false)
	spSetUnitNoSelect(unitID, false)
end


local function SetSelectable(cmd, unitID, selectable)
	if (type(unitID) ~= 'number') then
		return
	end
	spSetUnitNoSelect(unitID, not selectable)
end

function gadget:Initialize()
  gadgetHandler:AddSyncAction('hideunit', HideUnit)
  gadgetHandler:AddSyncAction('showunit', ShowUnit)
  gadgetHandler:AddSyncAction('setselectable', SetSelectable)
end

function gadget:Shutdown(unitID)
  gadgetHandler:RemoveSyncAction('hideunit') 
  gadgetHandler:RemoveSyncAction('showunit') 
  gadgetHandler:RemoveSyncAction('setselectable') 
end

------ UNSYNCED ----------
end
