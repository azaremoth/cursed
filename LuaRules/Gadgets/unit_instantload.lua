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

local loadtheseunits = {}
local passengerstillmoves = {}
local transportstillmoves = {}
local currenttransportcapacity = {}
local currentassigablecapacity = {}
local unitisontransport = {}


function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	local transportcapa = tonumber(UnitDefs[unitDefID].customParams.transportcapa)
	if (transportcapa == nil ) then
		transportcapa = 0
	end
	currenttransportcapacity[unitID] = transportcapa
	currentassigablecapacity[unitID] = transportcapa
	unitisontransport[unitID] = false
	passengerstillmoves[unitID] = false
	transportstillmoves[unitID] = false
end	

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions)
	local ud = UnitDefs[unitDefID]
	local transportcapacity = ud.transportCapacity
	local loadingradius = ud.loadingRadius

	if (cmdID == 0) then -- STOPP
		for pUnitID, tunitID in pairs(loadtheseunits) do
			local transporterID = loadtheseunits[pUnitID]
			if (pUnitID == unitID) then -- passenger received STOPP
				currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + 1)
				-- Spring.Echo(currentassigablecapacity[transporterID])	
				loadtheseunits[pUnitID] = nil			
			elseif (loadtheseunits[pUnitID] == unitID) then -- transporter received STOPP
				currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + 1)
				-- Spring.Echo(currentassigablecapacity[transporterID])	
				loadtheseunits[pUnitID] = nil
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
			passengerstillmoves[unitID] = true			
		else
			return false
		end
	end
	
	if ((cmdID == 75 ) and (transportcapacity > 0)) then -- LOAD UNITS // check if is transporter
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
						passengerstillmoves[x] = true
						Spring.GiveOrderToUnit(x, CMD_MOVE, {tx,ty,tz}, {})						
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
								passengerstillmoves[cUnitID] = true										
								Spring.GiveOrderToUnit(cUnitID, CMD_MOVE, {tx,ty,tz}, {})
	--							Spring.GiveOrderToUnit(unitID, CMD_WAIT, {}, {})
							end
						end
					end
				end
		------------------------------------MOBILE----------------------------------------------------			
			else -- it is mobile
				transportstillmoves[unitID] = true -- the transporter will receive a move order anyway
				if (r == nil) then -- load single unit
					local xUnitDefID = Spring.GetUnitDefID(x)
					local xTeam = Spring.GetUnitTeam(x)	
					if ((UnitDefs[xUnitDefID].customParams.canbetransported == "true") and (xTeam == MyTeam) and (currentassigablecapacity[unitID] > 0) and (unitisontransport[x] == false) and (loadtheseunits[x] == nil)) then
						loadtheseunits[x] = unitID
						currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)
						-- Spring.Echo(currentassigablecapacity[unitID])
						passengerstillmoves[x] = true
						local px, py, pz = Spring.GetUnitPosition(x) -- passenger position
						if cmdOptions.shift then
							Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_MOVE, CMD.OPT_INTERNAL, px,py,pz }, {"alt"} )
						else
							Spring.GiveOrderToUnit(unitID, CMD_MOVE, {px,py,pz}, {})
						end			
					end
				else -- load multiple units
					local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
					if cmdOptions.shift then				
						Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_MOVE, CMD.OPT_INTERNAL, x,y,z }, {"alt"} )
					else
						Spring.GiveOrderToUnit(unitID, CMD_MOVE, {x,y,z}, {})
					end
					for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
						local cTeam = Spring.GetUnitTeam(cUnitID)
						if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
							local cUnitDefID = Spring.GetUnitDefID(cUnitID)
							if ((UnitDefs[cUnitDefID].customParams.canbetransported == "true") and (currentassigablecapacity[unitID] > 0) and (unitisontransport[cUnitID] == false) and (loadtheseunits[cUnitID] == nil)) then
								loadtheseunits[cUnitID] = unitID
								currentassigablecapacity[unitID] = (currentassigablecapacity[unitID] - 1)
								-- Spring.Echo(currentassigablecapacity[unitID])									
								passengerstillmoves[cUnitID] = true
								Spring.GiveOrderToUnit(cUnitID, CMD_MOVE, {x,y,z}, {})
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

function gadget:UnitIdle(unitID, unitDefID, unitTeam)
	for mpUnitID, _ in pairs(passengerstillmoves) do -- remove arrived passengers 
		if (unitID == mpUnitID) then
			passengerstillmoves[mpUnitID] = false	-- passenger arrived at pick-up point or was stopped
		end
	end
	for mtUnitID, _ in pairs(transportstillmoves) do -- remove arrived passengers 
		if (unitID == mtUnitID) then
			transportstillmoves[mtUnitID] = false	-- transport arrived at pick-up point or was stopped
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
	passengerstillmoves[unitID] = nil
	for pUnitID, tunitID in pairs(loadtheseunits) do	-- check if transporter was killed
		if (unitID == tunitID) then
			loadtheseunits[pUnitID] = nil
			transportstillmoves[unitID] = nil			
		end
	end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	unitisontransport[unitID] = true	
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] - 1)
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	unitisontransport[unitID] = false
	currenttransportcapacity[transportID] = (currenttransportcapacity[transportID] + 1)
	currentassigablecapacity[transportID] = (currentassigablecapacity[transportID] + 1)
	-- Spring.Echo(currentassigablecapacity[transportID])		
end

function gadget:GameFrame(f)
	if f % 32 < .1 then
		for pUnitID, unitID in pairs(loadtheseunits) do
			local x, y, z = Spring.GetUnitPosition(unitID) -- transport position
			local unitDefID = Spring.GetUnitDefID(unitID)				
			local ud = UnitDefs[unitDefID]
			local transportcapacity = ud.transportCapacity
			local loadingradius = ud.loadingRadius
			if loadingradius == nil then
				loadingradius = 300
			end
			local UnitsAroundTransport = Spring.GetUnitsInCylinder(x,z,loadingradius)
			for _,tUnitID in ipairs(UnitsAroundTransport) do
				local tUnitDefID = Spring.GetUnitDefID(tUnitID)
				if (pUnitID == tUnitID and UnitDefs[tUnitDefID].customParams.canbetransported == "true") then
					Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),pUnitID)
					loadtheseunits[pUnitID] = nil
					local punitDefID = Spring.GetUnitDefID(pUnitID)				
					local pud = UnitDefs[punitDefID]
					local prepairSpeed = pud.repairSpeed	
					if (prepairSpeed > 0) then -- builder units will automatically repair the transport / bunker				
						Spring.GiveOrderToUnit(pUnitID, CMD_GUARD, {unitID}, {})
					end
				end
			end
			-- check if passengers AND transport are still on the run, if not remove from pick-up list
			local transporterID = loadtheseunits[pUnitID]
			if ((passengerstillmoves[pUnitID] == false) and (transportstillmoves[transporterID] == false)) then
				currentassigablecapacity[transporterID] = (currentassigablecapacity[transporterID] + 1)
				-- Spring.Echo(currentassigablecapacity[transporterID])	
				loadtheseunits[pUnitID] = nil
			end	
		end
	end
end


------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end

