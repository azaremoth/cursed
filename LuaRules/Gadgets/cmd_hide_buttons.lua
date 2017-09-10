
if (not gadgetHandler:IsSyncedCode()) then
  return false
end

function gadget:GetInfo()
  return {
    name      = "Hide Buttons",
    desc      = "Remove certain buttons.",
    author    = "CarRepairer",
    date      = "2009-5-30",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local CMD_CLOAK 			= CMD.CLOAK
local CMD_REPEAT 			= CMD.REPEAT
local CMD_WAIT 				= CMD.WAIT
local CMD_IDLEMODE 			= CMD.IDLEMODE
local CMD_AUTOREPAIRLEVEL 	= CMD.AUTOREPAIRLEVEL

local cloak = {
--	[ UnitDefNames['armflea'].id ] = true,
--	[ UnitDefNames['armtick'].id ] = true,
--	[ UnitDefNames['corroach'].id ] = true,
}

local repeater = {}

local flyer = {}

local wait = {
--	[ UnitDefNames['tc_soulstone'].id ] = true,
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
	for udid, ud in pairs(UnitDefs) do
		if not ud.canMove and not ud.isBuilder and not ud.canAttack then
			repeater[udid] 	= true
			wait[udid]		= true
		end
		if ud.canFly then
			flyer[udid]		= true
		end
	end
end


function gadget:UnitCreated(unitID, unitDefID)
	if cloak[unitDefID] then
		local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_CLOAK)
		if (cmdDescID) then
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
	if repeater[unitDefID] then
		local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_REPEAT)
		if (cmdDescID) then
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
	if wait[unitDefID] then
		local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_WAIT)
		if (cmdDescID) then
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
	if flyer[unitDefID] then
		local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_AUTOREPAIRLEVEL)
		if (cmdDescID) then
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
		end
		local cmdDescID2 = Spring.FindUnitCmdDesc(unitID, CMD_IDLEMODE)
		if (cmdDescID2) then
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID2)
		end
	end
end


--not sure if this is needed
function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID)
	if cmdID == CMD_CLOAK and cloak[unitDefID] then
		return false
	end
	return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------