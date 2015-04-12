function gadget:GetInfo()
	return 
	{
		name = "Burrow Command",
		desc = "Allows Skeletons to burrow/unborrow.",
		author = "aZaremoth & CarRepairer",
		date = "March 12th, 2009",
		license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true
	}
end
------------------------------------------------------------------------
include("LuaRules/Configs/customcmds.h.lua")

local BurrowerUnitList = {}	


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------
Burrow = {
		id=CMD_BURROW,
		type=CMDTYPE.ICON,
		name="Burrow",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/burrow.png",
		tooltip="Burrow/Unborrow.\r\nHint: Burrowed units are hidden and unable to move or attack.",
		action="burrow"
		}

function gadget:Initialize()
	Spring.SendCommands("unbind b")  
	Spring.SendCommands("bind b burrow")
end 		

function gadget:UnitFinished(unitID, unitDefID, team)
	local canburrowdef = UnitDefs[unitDefID].customParams.canburrow
	local canburrow = false
	if canburrowdef == "true" then
		canburrow = true
	end
	if (canburrow == true) then
		Spring.InsertUnitCmdDesc(unitID, Burrow)
		BurrowerUnitList[unitID] = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, team, attacker)
	if BurrowerUnitList[unitID] ~= nil then
		BurrowerUnitList[unitID] = nil
	end
end

function gadget:CommandFallback(unitID, unitDefID, team, cmd, param, opts)
	if BurrowerUnitList[unitID] == true then
		if cmd ~= CMD_BURROW then
			return false  --// command was not used
		end
		Spring.UnitScript.CallAsUnit(unitID,Spring.UnitScript.GetScriptEnv(unitID).script.Burrow)
		return true, true  --// command was used, remove it
	end
end



------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end
