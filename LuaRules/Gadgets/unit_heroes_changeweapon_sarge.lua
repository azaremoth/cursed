function gadget:GetInfo()
	return {
		name = "Change weapon in LUA",
		desc = "calls a lua script",
		author = "aZaremoth & CarRepairer",
		date = "July 9th, 2009",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local WeaponchangersPairs = {
	[UnitDefNames.euf_sarge_lvl3.id] = "euf_sarge_lvl3",
	[UnitDefNames.euf_sarge_lvl4.id] = "euf_sarge_lvl4",	
	[UnitDefNames.euf_sarge_lvl5.id] = "euf_sarge_lvl5",
	}

local echo = Spring.Echo
local weaponActive = {}

local MaxSizeX = Game.mapSizeX
local MaxSizeZ = Game.mapSizeZ

include("LuaRules/Configs/customcmds.h.lua")
---------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------
ChangeweaponCommand = {
		id=CMD_CHANGEWEAPON_LUA,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-chaingun.png",
		tooltip="Weapon-change.\r\nHint: Change between chain- and plasmagun",
		action="change"
		}


local function CallUnitScript(unitID, funcName, ...)
	Spring.UnitScript.CallAsUnit(unitID, Spring.UnitScript.GetScriptEnv(unitID).script[funcName], ...)
end  
		
function gadget:UnitCreated(unitID, unitDefID, team)
	if WeaponchangersPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, ChangeweaponCommand)
		weaponActive[unitID] = 1
	end
end

function gadget:AllowCommand(unitID, unitDefID, team, cmd, param, opts)
	if cmd  == CMD_CHANGEWEAPON_LUA then
			local Weaponchangers = WeaponchangersPairs[unitDefID]
			if not Weaponchangers then return false end
			local cmdID
			local changedpig = false
			cmdID = Spring.FindUnitCmdDesc(unitID, CMD_CHANGEWEAPON_LUA)
			if cmdID ~= nil then
				if weaponActive[unitID] == 1 then
					Spring.EditUnitCmdDesc(unitID, cmdID, {
						texture = "&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-plasmagun.png",
						tooltip="Weapon-change.\r\nHint: Active weapon: Plasmagun.",
					})
					weaponActive[unitID] = 2
					changedpig = true
				elseif weaponActive[unitID] == 2 then
					Spring.EditUnitCmdDesc(unitID, cmdID, {
						texture = "&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-chaingun.png",
						tooltip="Weapon-change.\r\nHint: Active weapon: Chaingun.",
					})
					weaponActive[unitID] = 1
					changedpig = true
				else 
					changedpig = false
				end
			end	
			if changedpig == true then
				CallUnitScript(unitID, "Changeweapon")
			end
	end
	return true
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end


