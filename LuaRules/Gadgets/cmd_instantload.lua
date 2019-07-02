function gadget:GetInfo()
	return 
	{
		name = "Instant Unload",
		desc = "Allows Flood load",
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
local unitisontransport = {}





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

function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	local transportcapa = tonumber(UnitDefs[unitDefID].customParams.transportcapa)
	if transportcapa == nil then
		transportcapa = 0
	end
	currenttransportcapacity[unitID] = transportcapa
	currentassigablecapacity[unitID] = transportcapa
	unitisontransport[unitID] = false
end	

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions)
	local ud = UnitDefs[unitDefID]

	if (cmdID == 0) then -- STOPP
		if loadtheseunits[unitID] and checkBunkerID(unitID) then -- passenger received STOPP and is walkimng to a bunker. Mobile transports pick up everything.
			currentassigablecapacity[loadtheseunits[unitID]] = (currentassigablecapacity[loadtheseunits[unitID]] + 1)
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
	
	if (cmdID == 76) then -- LOAD ONTO a TRANSPORT checks for custom parameter
		local transportID = cmdParams[1]
		if ((UnitDefs[unitDefID].customParams.canbetransported == "true") and (currentassigablecapacity[transportID] > 0) and (unitisontransport[unitID] == false) and (loadtheseunits[unitID] == nil)) then
			Spring.GiveOrderToUnit(unitID, CMD_GUARD, {transportID}, {})
			loadtheseunits[unitID] = transportID
			currentassigablecapacity[transportID] = (currentassigablecapacity[transportID] - 1)
			-- Spring.Echo(currentassigablecapacity[transportID])		
		else
			return false
		end
	end
	
	if ((cmdID == 75 ) and (ud.transportCapacity > 0)) then -- LOAD UNITS // check if is transporter
		if ((currenttransportcapacity[unitID] > 0) and (currentassigablecapacity[unitID] > 0)) then
			local MyTeam = Spring.GetUnitTeam(unitID)   	
			local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
			local tx, ty, tz = Spring.GetUnitPosition(unitID) -- transport position
			local x = cmdParams[1] -- x position is passenger's unitID if only oneclicked else the x-position of center of the load circle
			local y = cmdParams[2] -- y-position of center of the load circle
			local z = cmdParams[3] -- z-position of center of the load circle
			local r = cmdParams[4] -- radius of the load circle
		------------------------------------BUNKER----------------------------------------------------
			if (movetype == [[static]]) then --is it a bunker?
				if (r == nil) then	-------- load a single unit
					local xUnitDefID = Spring.GetUnitDefID(x)
					local xTeam = Spring.GetUnitTeam(x)	
					if ((UnitDefs[xUnitDefID].customParams.canbetransported == "true") and (xTeam == MyTeam) and (currentassigablecapacity[unitID] > 0) and (unitisontransport[x] == false)  and (loadtheseunits[x] == nil)) then
						loadtheseunits[x] = unitID
						currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)
						-- Spring.Echo(currentassigablecapacity[unitID])
						-- Spring.GiveOrderToUnit(x, CMD_RAW_MOVE, {tx,ty,tz}, {})
						Spring.GiveOrderToUnit(x, CMD_GUARD, {unitID}, {})						
					end
				else -------- load multiple unit	
					local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
					for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
						local cTeam = Spring.GetUnitTeam(cUnitID)
						if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
							local cUnitDefID = Spring.GetUnitDefID(cUnitID)
							if ((UnitDefs[cUnitDefID].customParams.canbetransported == "true") and (currentassigablecapacity[unitID] > 0) and (unitisontransport[cUnitID] == false) and (loadtheseunits[cUnitID] == nil)) then	
								loadtheseunits[cUnitID] = unitID
								currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)	
								-- Spring.Echo(currentassigablecapacity[unitID])																	
								-- Spring.GiveOrderToUnit(cUnitID, CMD_RAW_MOVE, {tx,ty,tz}, {})
								-- Spring.GiveOrderToUnit(unitID, CMD_WAIT, {}, {})
								Spring.GiveOrderToUnit(cUnitID, CMD_GUARD, {unitID}, {})										
							end
						end
					end
				end
		------------------------------------MOBILE----------------------------------------------------			
			else -- it is mobile
				if (r == nil) then -- load single unit
					local xUnitDefID = Spring.GetUnitDefID(x)
					local xTeam = Spring.GetUnitTeam(x)	
					if ((UnitDefs[xUnitDefID].customParams.canbetransported == "true") and (xTeam == MyTeam) and (currentassigablecapacity[unitID] > 0) and (unitisontransport[x] == false) and (loadtheseunits[x] == nil)) then
						loadtheseunits[x] = unitID
						currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)
						-- Spring.Echo(currentassigablecapacity[unitID])
						local px, py, pz = Spring.GetUnitPosition(x) -- passenger position
						if cmdOptions.shift then
							Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_GUARD, CMD.OPT_INTERNAL, x }, {"alt"} )
						else 
							Spring.GiveOrderToUnit(unitID, CMD_GUARD, {x}, {})
						end			
					end
				else -- load multiple units
					local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
--					if cmdOptions.shift then				
--						Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_MOVE, CMD.OPT_INTERNAL, x,y,z }, {"alt"} )
--					else
--						Spring.GiveOrderToUnit(unitID, CMD_MOVE, {x,y,z}, {})
--					end
					for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
						local cTeam = Spring.GetUnitTeam(cUnitID)
						if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
							local cUnitDefID = Spring.GetUnitDefID(cUnitID)
							if ((UnitDefs[cUnitDefID].customParams.canbetransported == "true") and (currentassigablecapacity[unitID] > 0) and (unitisontransport[cUnitID] == false) and (loadtheseunits[cUnitID] == nil)) then
								loadtheseunits[cUnitID] = unitID
								currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)
								Spring.Echo(currentassigablecapacity[unitID])									
								-- Spring.GiveOrderToUnit(cUnitID, CMD_MOVE, {x,y,z}, {})
								
								if cmdOptions.shift then
									Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_GUARD, CMD.OPT_INTERNAL, cUnitID }, {"alt"} )
								else 
									Spring.GiveOrderToUnit(unitID, CMD_GUARD, {cUnitID}, {})
								end		
							end
						end
					end
				end
			end
		end
	else
		return true
	end
end

function gadget:UnitGiven(unitID, unitDefID, team, oldteam) 
	local transporterID = loadtheseunits[unitID]
	if (transporterID ~= nil) then
		currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + 1)	-- remove dead unit from assigned units list
		-- Spring.Echo(currentassigablecapacity[transporterID])
	end
	loadtheseunits[unitID] = nil
	for pUnitID, tunitID in pairs(loadtheseunits) do	-- check if transporter was killed
		if (unitID == tunitID) then
			loadtheseunits[pUnitID] = nil			
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, team, attacker)
	local transporterID = loadtheseunits[unitID]
	if (transporterID ~= nil) then
		currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + 1)	-- remove dead unit from assigned units list
		-- Spring.Echo(currentassigablecapacity[transporterID])
	end
	loadtheseunits[unitID] = nil
	for pUnitID, tunitID in pairs(loadtheseunits) do	-- check if transporter was killed
		if (unitID == tunitID) then
			loadtheseunits[pUnitID] = nil			
		end
	end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	unitisontransport[unitID] = true	
--	loadtheseunits[unitID] = nil		
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] - 1)
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	Spring.AddUnitImpulse(unitID, 0.1, 0, 0) --add a little impulse to spread units
	unitisontransport[unitID] = false
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] + 1)
	currentassigablecapacity[transportID] = (currentassigablecapacity[transportID] + 1)
	-- Spring.Echo(currentassigablecapacity[transportID])		
end

local function RemoveGuardCmd(transporterID, passengerID)
    local cmds = Spring.GetCommandQueue(transporterID, 25)
    for j=1,#cmds do
        local cmd = cmds[j]
        if (cmd.id == CMD.GUARD)and(cmd.params[1] == passengerID) then
			Spring.GiveOrderToUnit(transporterID,CMD.REMOVE,{cmd.tag},{})
        end
    end
end

function gadget:GameFrame(f)
	if f % 32 < .1 then
		for pUnitID, unitID in pairs(loadtheseunits) do
			local x, y, z = Spring.GetUnitPosition(unitID) -- transport position
			local unitDefID = Spring.GetUnitDefID(unitID)				
			local ud = UnitDefs[unitDefID]
			local loadingradius = ud.loadingRadius
			if loadingradius == nil then
				loadingradius = 300
			end
			local UnitsAroundTransport = Spring.GetUnitsInCylinder(x,z,loadingradius)
			for _,tUnitID in ipairs(UnitsAroundTransport) do
				local tUnitDefID = Spring.GetUnitDefID(tUnitID)
				if (pUnitID == tUnitID and UnitDefs[tUnitDefID].customParams.canbetransported == "true") then
					if (Spring.UnitScript.GetScriptEnv(unitID) == nil) then -- cob/bos compatibility
						Spring.CallCOBScript( unitID, "TransportPickup", pUnitID)
					else 
						Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),pUnitID)					
					end
					RemoveGuardCmd(unitID, pUnitID)
					loadtheseunits[pUnitID] = nil
					local punitDefID = Spring.GetUnitDefID(pUnitID)				
					local pud = UnitDefs[punitDefID]
					local prepairSpeed = pud.repairSpeed	
					if (prepairSpeed > 0) then -- builder units will automatically repair the transport / bunker				
						Spring.GiveOrderToUnit(pUnitID, CMD_GUARD, {unitID}, {})
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

