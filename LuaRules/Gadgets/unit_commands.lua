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

local KamikazePairs = {
	[UnitDefNames.tc_suicide.id] = "tc_suicide",
	[UnitDefNames.tc_pestilence.id] = "tc_pestilence",
	}
local DeployPairs = {
	[UnitDefNames.tc_purgatory.id] = "tc_purgatory",
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

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if KamikazePairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, KamikazeCommand)
	elseif DeployPairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, TransformPurgatory)	
	end	
end

function PurgatoryTransformCommandReactivate(unitID, ud, team)
	Spring.RemoveUnitCmdDesc(unitID, TransformPurgatoryOff)
	Spring.InsertUnitCmdDesc(unitID, TransformPurgatory)
end
gadgetHandler:RegisterGlobal("PurgatoryTransformCommandReactivate", PurgatoryTransformCommandReactivate)

function gadget:CommandFallback(unitID, ud, team, cmd, param, opts)
	if cmd  == CMD_TRANSFORM_PURGATORY then
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
		return true, true;
	elseif cmd  == CMD_KAMIKAZE then
		local valid = 1
		local x,y,z = Spring.GetUnitPosition(unitID)
		local height = Spring.GetGroundHeight(x,z)
		local MaxSizeX = Game.mapSizeX
		local MaxSizeZ = Game.mapSizeZ
		if x < 0  or  x > MaxSizeX or z < 0 or z > MaxSizeZ or height < -5 then valid = 0 else valid = 1 end
		if valid == 1 then
			Spring.DestroyUnit(unitID,false,false)
		end
		return true, true;
	end
	
	return false
end


------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end
