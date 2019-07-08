function gadget:GetInfo()
	return 
	{
		name = "Instant Unload",
		desc = "Allows Flood load (V2.0)",
		author = "aZaremoth",
		date = "March, 2015",
		license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true
	}
end
------------------------------------------------------------------------
include("LuaRules/Configs/customcmds.h.lua")


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------

local GiveClampedOrderToUnit = Spring.Utilities.GiveClampedOrderToUnit
local CMD_INSERT 		= CMD.INSERT
local CMD_MOVE			= CMD.MOVE
local CMD_WAIT			= CMD.WAIT
local CMD_STOP			= CMD.STOP
local CMD_GUARD			= CMD.GUARD
local CMD_LOAD_ONTO		= CMD.LOAD_ONTO
local CMD_LOAD_UNITS	= CMD.LOAD_UNITS
local CMD_OPT_INTERNAL 	= CMD.OPT_INTERNAL
local CMD_OPT_SHIFT 	= CMD.OPT_SHIFT

local loadtheseunits = {} -- loadtheseunits[passenger] = transporter
local currenttransportcapacity = {}
local currentassigablecapacity = {}
local unitsize = {}
local unitisontransport = {}
local gameframecommand = {}
local transporter = {}

BunkerUnloadCommand = {
		id=CMD_UNLOADBUNKER,
		type=CMDTYPE.ICON,
		name="",
		texture="LuaUI/Images/commands/imperials/unload.png",
		tooltip="Unload.\r\nHint: Releases all units.",
		action="unloadbunker"
		}

local function RemoveGuardCmd(transporterID, passengerID)
    local cmds = Spring.GetCommandQueue(transporterID, 25)
    for j=1,#cmds do
        local cmd = cmds[j]
        if (cmd.id == CMD.GUARD)and(cmd.params[1] == passengerID) then
			Spring.GiveOrderToUnit(transporterID,CMD.REMOVE,{cmd.tag},{})
        end
    end
end

local function checkBunkerID(passengerID)
	local transporterID = loadtheseunits[passengerID]
	local bunkerID = nil
	if transporterID ~= nil then
		local movetype = (Spring.GetUnitMoveTypeData(transporterID)).name
		if (movetype == [[static]]) then --is it a bunker?
			bunkerID = transporterID
		end
	end
	return bunkerID
end

--[[local function GetClearPath(movingUnitID, goalUnitID)
	local mx, my, mz = Spring.GetUnitPosition(movingUnitID)
	local gx, gy, gz = Spring.GetUnitPosition(goalUnitID)
	local unitDefID = Spring.GetUnitDefID(movingUnitID)
	local ispossible = Spring.TestMoveOrder(unitDefID, mx, my, mz, gx, gy, gz, true, true, false)
	Spring.Echo("DEV:")
	Spring.Echo(ispossible)	
	return ispossible
end]]

local function GetClearPlacement(tUnitID)
	local unitDefID = Spring.GetUnitDefID(tUnitID)
	local x, y, z = Spring.GetUnitPosition(tUnitID)
	local centerX = x
	local centerZ = z	
	local spawnRadius = 50
	
	local tries = 1
	while not Spring.TestMoveOrder(unitDefID, x, y, z, 0, 0, 0, true, true, false) do
		if tries > 30 then
			spawnRadius = spawnRadius + 15
		end
		if tries > 50 then
			break
		end
		x = centerX + 2*math.random()*spawnRadius - spawnRadius
		z = centerZ + 2*math.random()*spawnRadius - spawnRadius
		y = Spring.GetGroundHeight(x,z)
		tries = tries + 1
	end
	
	return x, z
end

local function loadUpdates(passengerID, newtransID)
	local oldtransID = loadtheseunits[passengerID]
	if oldtransID and (oldtransID ~= newtransID) then
		currentassigablecapacity[oldtransID] = (currentassigablecapacity[oldtransID] + unitsize[passengerID])
		if (checkBunkerID(passengerID) == nil) then
			RemoveGuardCmd(oldtransID, passengerID)
		end
	end
	gameframecommand[passengerID] = Spring.GetGameFrame()
	loadtheseunits[passengerID] = newtransID
	currentassigablecapacity[newtransID] = (currentassigablecapacity[newtransID] - unitsize[passengerID])
	-- Spring.Echo(currentassigablecapacity[newtransID])	
end

function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	-- local transportcapa = tonumber(UnitDefs[unitDefID].customParams.transportcapa)
	local transportcapa = tonumber(UnitDefs[unitDefID].transportCapacity) or 0
	unitsize[unitID] = tonumber(UnitDefs[unitDefID].xsize) or 999
	currenttransportcapacity[unitID] = transportcapa
	currentassigablecapacity[unitID] = transportcapa
	unitisontransport[unitID] = false
	gameframecommand[unitID] = 0	
end	

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
	if (movetype == [[static]] and currenttransportcapacity[unitID] > 0) then --is it a bunker?
		local cmdID = Spring.FindUnitCmdDesc(unitID, 80)
		if cmdID ~= nil then
			Spring.RemoveUnitCmdDesc(unitID, cmdID) -- remove engine unload
		end
		Spring.InsertUnitCmdDesc(unitID, BunkerUnloadCommand)
	end
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions)
	local ud = UnitDefs[unitDefID]
	-- Spring.Echo("DEV: Command executed: " .. cmdID)
------- STOPP
	if (cmdID == 0) then
		if loadtheseunits[unitID] and checkBunkerID(unitID) then -- passenger received STOPP and is walking to a bunker. Mobile transports pick up everything.
			local tUnitID = loadtheseunits[unitID]
			currentassigablecapacity[tUnitID] = (currentassigablecapacity[tUnitID] + unitsize[unitID])
			RemoveGuardCmd(tUnitID, unitID)
			-- Spring.Echo(currentassigablecapacity[loadtheseunits[unitID]])	
			loadtheseunits[unitID] = nil		
		else
			for pUnitID, tunitID in pairs(loadtheseunits) do
				if (loadtheseunits[pUnitID] == unitID) then -- transporter received STOPP
					currentassigablecapacity[unitID] = currenttransportcapacity[unitID]
					-- Spring.Echo(currentassigablecapacity[unitID])	
					loadtheseunits[pUnitID] = nil
				end
			end
		end
	end
-------	UNLOAD ONLY ADAPTED FOR bunkers ("CMD_UNLOADBUNKER")
	if (cmdID == 32646) then
		-- Spring.Echo("DEV: CMD_UNLOADBUNKER executed")	
  		local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
		if (movetype == [[static]]) then --is it a bunker?
			-- Spring.Echo("DEV: We have a bunker that wants to unload")
			for pUnitID, _ in pairs(unitisontransport) do
				local tunitID = transporter[pUnitID]
				if (unitID == tunitID) then
					-- Spring.Echo("DEV: Unloading one unit from bunker")
					local px, pz = GetClearPlacement(pUnitID)
					local tx, ty, tz = Spring.GetUnitPosition(unitID)
					local mx = px + math.random()*(px-tx)
					local mz = pz + math.random()*(pz-tz)
					local my = Spring.GetGroundHeight(mx,mz)
					Spring.UnitDetach(pUnitID)
					Spring.SetUnitPosition(pUnitID, px, pz)
					Spring.GiveOrderToUnit(pUnitID, CMD_MOVE, {mx,my,mz}, {})					
				end
			end
		end
	end
-------	LOAD "ACTIVE" PASSENGER ONTO A TRANSPORT
	if (cmdID == 76) then -- Checks for custom parameter
		local transportID = cmdParams[1]
		-- local clearPath = GetClearPath(unitID, transportID)
		if ((not UnitDefs[unitDefID].cantBeTransported) and (currentassigablecapacity[transportID] >= unitsize[unitID]) and (unitisontransport[unitID] == false) and (loadtheseunits[unitID] == nil or gameframecommand[unitID] < Spring.GetGameFrame())) then
			Spring.GiveOrderToUnit(unitID, CMD_GUARD, {transportID}, {})
			loadUpdates(unitID, transportID)
		else
			return false
		end
	end
-------	TRANSPORTER LOAD UNITS
	if ((cmdID == 75 ) and (ud.transportCapacity > 0)) then -- check if is transporter
		if ((currenttransportcapacity[unitID] > 0) and (currentassigablecapacity[unitID] > 0)) then
			local MyTeam = Spring.GetUnitTeam(unitID)   	
			local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
			local tx, ty, tz = Spring.GetUnitPosition(unitID) -- transport position
			local x = cmdParams[1] -- x position is passenger's unitID if only oneclicked else the x-position of center of the load circle
			local y = cmdParams[2] -- y-position of center of the load circle
			local z = cmdParams[3] -- z-position of center of the load circle
			local r = cmdParams[4] -- radius of the load circle
			if (r == nil) then -- load single unit
				local xUnitDefID = Spring.GetUnitDefID(x)
				local xTeam = Spring.GetUnitTeam(x)
				-- local clearPath = GetClearPath(unitID, x)
				if ((not UnitDefs[xUnitDefID].cantBeTransported) and (xTeam == MyTeam) and (currentassigablecapacity[unitID] >= unitsize[x]) and (unitisontransport[x] == false) and (loadtheseunits[x] == nil or gameframecommand[x] < Spring.GetGameFrame())) then
					loadUpdates(x, unitID)
					if (movetype == [[static]]) then --is it a bunker?
						Spring.GiveOrderToUnit(x, CMD_GUARD, {unitID}, {})		
					else -- it is mobile
						local px, py, pz = Spring.GetUnitPosition(x) -- passenger position
						Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_GUARD, CMD.OPT_INTERNAL, x }, {"alt"} )
					end
				end
			else -- load multiple units
				local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
				for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up circle
					local cTeam = Spring.GetUnitTeam(cUnitID)
					if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
						local cUnitDefID = Spring.GetUnitDefID(cUnitID)
						-- local clearPath = GetClearPath(unitID, cUnitID)	
						if ((not UnitDefs[cUnitDefID].cantBeTransported) and (currentassigablecapacity[unitID] >= unitsize[cUnitID]) and (unitisontransport[cUnitID] == false) and (loadtheseunits[cUnitID] == nil or gameframecommand[cUnitID] < Spring.GetGameFrame())) then
							loadUpdates(cUnitID, unitID)
							if (movetype == [[static]]) then --is it a bunker?
								Spring.GiveOrderToUnit(cUnitID, CMD_GUARD, {unitID}, {})		
							else -- it is mobile
								Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_GUARD, CMD.OPT_INTERNAL, cUnitID }, {"alt"} )
							end
						end
					end
				end
			end
		end
		return false
	end
-------
	return true
end

local function removeUnits(unitID)
	local transporterID = loadtheseunits[unitID]
	if (transporterID ~= nil) then
		currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + unitsize[unitID])	-- remove dead/transfered units from assigned units list
		-- Spring.Echo(currentassigablecapacity[transporterID])
	end
	loadtheseunits[unitID] = nil
	for pUnitID, tunitID in pairs(loadtheseunits) do	-- check if transporter was killed
		if (unitID == tunitID) then
			loadtheseunits[pUnitID] = nil			
		end
	end
end

function gadget:UnitGiven(unitID, unitDefID, team, oldteam) 
	removeUnits(unitID)
end

function gadget:UnitDestroyed(unitID, unitDefID, team, attacker)
	removeUnits(unitID)
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	unitisontransport[unitID] = true
	transporter[unitID] = transportID		
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] - unitsize[unitID])
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	Spring.AddUnitImpulse(unitID, 0.25, 0, 0.25) --add a little impulse to spread units, check further
	unitisontransport[unitID] = false
	transporter[unitID] = nil
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] + unitsize[unitID])
	currentassigablecapacity[transportID] = (currentassigablecapacity[transportID] + unitsize[unitID])
	-- Spring.Echo(currentassigablecapacity[transportID])		
end

function gadget:GameFrame(f)
	if f % 32 < .1 then
		for pUnitID, tUnitID in pairs(loadtheseunits) do
			local x, y, z = Spring.GetUnitPosition(tUnitID) -- transport position
			local unitDefID = Spring.GetUnitDefID(tUnitID)				
			local ud = UnitDefs[unitDefID]
			local loadingradius = ud.loadingRadius
			if loadingradius == nil then
				loadingradius = 300
			end
			local UnitsAroundTransport = Spring.GetUnitsInCylinder(x,z,loadingradius)
			for _,arUnitID in ipairs(UnitsAroundTransport) do
				local arUnitDefID = Spring.GetUnitDefID(arUnitID)
				if (pUnitID == arUnitID) then
					if (Spring.UnitScript.GetScriptEnv(tUnitID) == nil) then -- cob/bos compatibility
						Spring.CallCOBScript( tUnitID, "TransportPickup", pUnitID)
					else 
						Spring.UnitScript.CallAsUnit(tUnitID,(Spring.UnitScript.GetScriptEnv(tUnitID).script.TransportPickup),pUnitID)					
					end
					RemoveGuardCmd(tUnitID, pUnitID)
					loadtheseunits[pUnitID] = nil
					local punitDefID = Spring.GetUnitDefID(pUnitID)				
					local pud = UnitDefs[punitDefID]
					local prepairSpeed = pud.repairSpeed	
					if (prepairSpeed > 0) then -- builder units will automatically repair the transport / bunker				
						Spring.GiveOrderToUnit(pUnitID, CMD_GUARD, {tUnitID}, {})
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end

