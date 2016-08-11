function gadget:GetInfo()
	return 
	{
		name = "Special commands",
		desc = "Inserts and handles special commands for The Cursed",
		author = "aZaremoth",
		date = "March 20th, 2008",
		license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true
	}
end

include("LuaRules/Configs/customcmds.h.lua")

local weaponActive = {}

local SpecialSkillPairs = {
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",	
	}
local DeployPairs = {
	[UnitDefNames.tc_purgatory.id] = "tc_purgatory",
	}	
local KamikazePairs = {
	[UnitDefNames.tc_suicide.id] = "tc_suicide",
	[UnitDefNames.tc_pestilence.id] = "tc_pestilence",
	}
local WeaponchangersPairs = {
	[UnitDefNames.euf_sarge_lvl3.id] = "euf_sarge_lvl3",
	[UnitDefNames.euf_sarge_lvl4.id] = "euf_sarge_lvl4",	
	[UnitDefNames.euf_sarge_lvl5.id] = "euf_sarge_lvl5",
	}


local MaxSizeX = Game.mapSizeX
local MaxSizeZ = Game.mapSizeZ


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCHED
----------------------------------------------------------------
------------------------------------------------------------------------
TransformPurgatory = {
		id=CMD_TRANSFORM_PURGATORY,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/deploy.png",
		tooltip="Deploy/Undeploy.\r\nHint: Activates the long range weapon.",
		action="deploy"
		}
TransformPurgatoryOff = {
		id=CMD_TRANSFORM_PURGATORY_OFF,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/deploy_off.png",
		tooltip="Deploy/Undeploy.\r\nHint: Activates the long range weapon.",
		action="deploy"
		}
KamikazeCommand = {
		id=CMD_KAMIKAZE,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/kamikaze.png",
		tooltip="Sacrifice.\r\nHint: Kill this unit.",
		action="sacrifice"
		}		
SpecialSkillCommand = {
		id=CMD_SPECIALSKILL,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/witchray.png",
		tooltip="Illusions\r\nHint: Create Shade illusions",
		action="specialstuff"
		}		
ChangeweaponCommand = {
		id=CMD_CHANGEWEAPON_LUA,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-chaingun.png",
		tooltip="Weapon-change.\r\nHint: Change between chain- and plasmagun",
		action="change"
		}

-----------------------------------
		
function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if KamikazePairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, KamikazeCommand)
	elseif DeployPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, TransformPurgatory)
	elseif SpecialSkillPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, SpecialSkillCommand)
	elseif WeaponchangersPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, ChangeweaponCommand)
		weaponActive[unitID] = 1
	end	
end

-----------------------------------

function PurgatoryTransformCommandReactivate(unitID, ud, team)
	Spring.RemoveUnitCmdDesc(unitID, TransformPurgatoryOff)
	Spring.InsertUnitCmdDesc(unitID, TransformPurgatory)
end
gadgetHandler:RegisterGlobal("PurgatoryTransformCommandReactivate", PurgatoryTransformCommandReactivate)

local function CallUnitScript(unitID, funcName, ...)
	Spring.UnitScript.CallAsUnit(unitID, Spring.UnitScript.GetScriptEnv(unitID).script[funcName], ...)
end  

function gadget:CommandFallback(unitID, unitDefID, team, cmd, param, opts)
	if cmd  == CMD_SPECIALSKILL then
		local SpecialSkiller = SpecialSkillPairs[unitDefID]
		if not SpecialSkiller then return false end
		CallUnitScript(unitID, "specialskill")
		return true, true
	elseif cmd  == CMD_TRANSFORM_PURGATORY then
		local valid = 1
		local x,y,z = Spring.GetUnitPosition(unitID)
		local height = Spring.GetGroundHeight(x,z)
		local MaxSizeX = Game.mapSizeX
		local MaxSizeZ = Game.mapSizeZ
		if x < 0  or  x > MaxSizeX or z < 0 or z > MaxSizeZ or height < -5 then valid = 0 else valid = 1 end
		if valid == 1 then
			Spring.CallCOBScript(unitID, "TransformPurgatory", 0)
			Spring.RemoveUnitCmdDesc(unitID, TransformPurgatory)
			Spring.InsertUnitCmdDesc(unitID, TransformPurgatoryOff)
		end
		return true, true
	elseif cmd  == CMD_KAMIKAZE then
		Spring.DestroyUnit(unitID,false,false)
		return true, true
	elseif cmd  == CMD_CHANGEWEAPON_LUA then
			local Weaponchangers = WeaponchangersPairs[unitDefID]
			if not Weaponchangers then return false end
			local cmdID
			local changedpic = false
			cmdID = Spring.FindUnitCmdDesc(unitID, CMD_CHANGEWEAPON_LUA)
			if cmdID ~= nil then
				if weaponActive[unitID] == 1 then
					Spring.EditUnitCmdDesc(unitID, cmdID, {
						texture = "&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-plasmagun.png",
						tooltip="Weapon-change.\r\nHint: Active weapon: Plasmagun.",
					})
					weaponActive[unitID] = 2
					changedpic = true
				elseif weaponActive[unitID] == 2 then
					Spring.EditUnitCmdDesc(unitID, cmdID, {
						texture = "&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/sarge-chaingun.png",
						tooltip="Weapon-change.\r\nHint: Active weapon: Chaingun.",
					})
					weaponActive[unitID] = 1
					changedpic = true
				else 
					changedpic = false
				end
			end	
			if changedpic == true then
				CallUnitScript(unitID, "Changeweapon")
			end
		return true, true
	else
		return false
	end
end


------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end
