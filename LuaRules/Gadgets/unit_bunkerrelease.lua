function gadget:GetInfo()
	return {
		name = "Bunker release",
		desc = "Releases units from bunker by one click",
		author = "aZaremoth",
		date = "March 25th, 2013",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local BunkerPairs = {
	[UnitDefNames.euf_bunker.id] = 'euf_bunker',
}

---------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then

include("LuaRules/Configs/customcmds.h.lua")

-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------
BunkerUnloadCommand = {
		id=CMD_UNLOADBUNKER,
		type=CMDTYPE.ICON,
		name="",
		texture="LuaUI/Images/commands/imperials/unload.png",
		tooltip="Unload.\r\nHint: Releases all units.",
		action="unloadbunker"
		}
		
function gadget:UnitCreated(unitID, unitDefID, team)
	if BunkerPairs [unitDefID] then
		cmdID = Spring.FindUnitCmdDesc(unitID, 80)
		if cmdID ~= nil then
			Spring.RemoveUnitCmdDesc(unitID, cmdID)
		end	
		Spring.InsertUnitCmdDesc(unitID, BunkerUnloadCommand)
	end
end
		
function gadget:AllowCommand(unitID, unitDefID, team, cmd, param, opts)
	if (cmd  == CMD_UNLOADBUNKER and BunkerPairs [unitDefID]) then
		Spring.UnitScript.CallAsUnit(unitID,Spring.UnitScript.GetScriptEnv(unitID).script.bunkerdrop)
	end
	return true
end

------------------------------------------------------------------------
------------------------------------------------------------------------
--SYNCED
else
--UNSYNCED
------------------------------------------------------------------------
------------------------------------------------------------------------

end


