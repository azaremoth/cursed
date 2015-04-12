function gadget:GetInfo()
	return 
	{
		name = "DeployPurgatoryCommand.lua",
		desc = "Allows Purgatory to deploy.",
		author = "Argh, small changes by aZaremoth, credits to Argh",
		date = "March 20th, 2008",
		license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true
	}
end

include("LuaRules/Configs/customcmds.h.lua")

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

function PurgatoryTransformCommand(u, ud, team)
	Spring.InsertUnitCmdDesc(u, TransformPurgatory)
end
gadgetHandler:RegisterGlobal("PurgatoryTransformCommand", PurgatoryTransformCommand)

function PurgatoryTransformCommandReactivate(u, ud, team)
	Spring.RemoveUnitCmdDesc(u, TransformPurgatoryOff)
	Spring.InsertUnitCmdDesc(u, TransformPurgatory)
end
gadgetHandler:RegisterGlobal("PurgatoryTransformCommandReactivate", PurgatoryTransformCommandReactivate)

function gadget:CommandFallback(u, ud, team, cmd, param, opts)
	if cmd  == CMD_TRANSFORM_PURGATORY then
		local valid = 1
		local x,y,z = Spring.GetUnitPosition(u)
		local height = Spring.GetGroundHeight(x,z)
		local MaxSizeX = Game.mapSizeX
		local MaxSizeZ = Game.mapSizeZ
		if x < 0  or  x > MaxSizeX or z < 0 or z > MaxSizeZ or height < -5 then valid = 0 else valid = 1 end
		if valid == 1 then
			Spring.CallCOBScript(u, "TransformPurgatory", 0)
			Spring.RemoveUnitCmdDesc(u, TransformPurgatory)
			Spring.InsertUnitCmdDesc(u, TransformPurgatoryOff)
		end
	return true, true;
	end
	return false
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end
