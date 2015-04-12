function gadget:GetInfo()
	return {
		name = "Change weapon in COB",
		desc = "Activates unit's special skill (in the lua unit script)",
		author = "aZaremoth & CarRepairer",
		date = "July 9th, 2009",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local SpecialSkillPairs = {
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",	
	}

include("LuaRules/Configs/customcmds.h.lua")

---------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------
SpecialSkillCommand = {
		id=CMD_SPECIALSKILL,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/witchray.png",
		tooltip="Illusions\r\nHint: Create Shade illusions",
		action="specialstuff"
		}
		
function gadget:UnitCreated(unitID, unitDefID, team)
	if SpecialSkillPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, SpecialSkillCommand)
	end
end
		
function gadget:AllowCommand(unitID, unitDefID, team, cmd, param, opts)
	if cmd  == CMD_SPECIALSKILL then
			local SpecialSkiller = SpecialSkillPairs[unitDefID]
			if not SpecialSkiller then return false end
			Spring.UnitScript.CallAsUnit(unitID,Spring.UnitScript.GetScriptEnv(unitID).script.specialskill)
	end
	return true
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end


