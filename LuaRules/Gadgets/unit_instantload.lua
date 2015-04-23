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
local CMD_STOP			= CMD.STOP
local CMD_GUARD			= CMD.GUARD
local CMD_LOAD_ONTO		= CMD.LOAD_ONTO
local CMD_LOAD_UNITS	= CMD.LOAD_UNITS
local CMD_OPT_INTERNAL 	= CMD.OPT_INTERNAL
local CMD_OPT_SHIFT 	= CMD.OPT_SHIFT

local loadtheseunits = {}
local passengerstillmoves = {}

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, loadcircle, opt)
-- Spring.Echo(cmdID)
	if cmdID == 76 then -- LOAD ONTO a TRANSPORT checks for custom parameter
		if (UnitDefs[unitDefID].customParams.canbetransported == "true") then
			return true
		else
			return false
		end
	end
	
	if cmdID == 75 then -- LOAD UNITS
		local MyTeam = Spring.GetUnitTeam(unitID)   	
		local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
		local tx, ty, tz = Spring.GetUnitPosition(unitID) -- transport position
		local loadingradius = UnitDefs[unitDefID].customParams.transportloadingradius
		if loadingradius == nil then
			loadingradius = 300
		end
--		Spring.Echo("called")
		local UnitsAroundTransport = Spring.GetUnitsInCylinder(tx,tz,loadingradius)
		local x = loadcircle[1] -- x position is passenger's unitID if only oneclicked else the x-position of center of the load circle
		local y = loadcircle[2] -- y-position of center of the load circle
		local z = loadcircle[3] -- z-position of center of the load circle
		local r = loadcircle[4] -- radius of the load circle
	------------------------------------BUNKER----------------------------------------------------
		if (movetype == [[static]]) then --is it a bunker?
			if (r == nil) then	-------- load a single unit
				local xUnitDefID = Spring.GetUnitDefID(x)
				local xTeam = Spring.GetUnitTeam(x)	
				if ((UnitDefs[xUnitDefID].customParams.canbetransported == "true") and (xTeam == MyTeam)) then
					for _,aUnitID in ipairs(UnitsAroundTransport) do -- check if unit is >a<round the transport, if not order it to move to the transport
						if (aUnitID == x) then -- found unit is the passenger
							Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),x)
						else
--							Spring.GiveOrderToUnit(x, CMD_LOAD_ONTO, {unitID}, {})
							loadtheseunits[x] = unitID
							passengerstillmoves[x] = unitID
							Spring.GiveOrderToUnit(x, CMD_MOVE, {tx,ty,tz}, {})	
						end
					end
				end
			else -------- load multiple unit	
				local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
				for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
					local cTeam = Spring.GetUnitTeam(cUnitID)
					if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
						local cUnitDefID = Spring.GetUnitDefID(cUnitID)
						if (UnitDefs[cUnitDefID].customParams.canbetransported == "true") then	
							for _,aUnitID in ipairs(UnitsAroundTransport) do -- check if unit is around the transport, if not order it to move to the transport
								if (aUnitID == cUnitID) then
									Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),aUnitID)
								else
--									Spring.GiveOrderToUnit(cUnitID, CMD_LOAD_ONTO, {unitID}, {})
									loadtheseunits[cUnitID] = unitID
									passengerstillmoves[cUnitID] = unitID										
									Spring.GiveOrderToUnit(cUnitID, CMD_MOVE, {tx,ty,tz}, {})
								end
							end
						end
					end
				end
			end
	------------------------------------MOBILE----------------------------------------------------			
		else -- it is mobile
			if (r == nil) then -- load single unit
				local xUnitDefID = Spring.GetUnitDefID(x)
				local xTeam = Spring.GetUnitTeam(x)	
				if ((UnitDefs[xUnitDefID].customParams.canbetransported == "true") and (xTeam == MyTeam)) then
					for _,aUnitID in ipairs(UnitsAroundTransport) do -- check if unit is >a<round the transport, if not order it to move to the transport
						if (aUnitID == x) then -- found unit is the passenger
							Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),x)
						else
							loadtheseunits[x] = unitID
							passengerstillmoves[x] = unitID
							local px, py, pz = Spring.GetUnitPosition(x) -- passenger position
--							Spring.GiveOrderToUnit(unitID, CMD_MOVE, {px,py,pz}, {})
							Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_MOVE, CMD_OPT_INTERNAL, px,py,pz }, {"alt"} )
						end
					end
				end
			else -- load multiple units
--				Spring.GiveOrderToUnit(unitID, CMD_MOVE, {x,y,z}, {})
				Spring.GiveOrderToUnit(unitID, CMD_INSERT, {-1, CMD_MOVE, CMD_OPT_INTERNAL, x,y,z }, {"alt"} )
				local UnitsAroundCommand = Spring.GetUnitsInCylinder(x,z,r)
				for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
					local cTeam = Spring.GetUnitTeam(cUnitID)
					if ((cUnitID ~= unitID) and (cTeam == MyTeam)) then	
						local cUnitDefID = Spring.GetUnitDefID(cUnitID)
						if (UnitDefs[cUnitDefID].customParams.canbetransported == "true") then -- if transportable own unit is in command circle...
							local px, py, pz = Spring.GetUnitPosition(cUnitID) -- transport position							
							local UnitsAroundPassenger = Spring.GetUnitsInCylinder(px,pz,loadingradius)						
							for _,pUnitID in ipairs(UnitsAroundPassenger) do -- check if unit is around the transport, if not order it to move to the transport
								if (pUnitID == unitID) then -- load unit as it is close to the transport	
									Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),cUnitID)
								else
									loadtheseunits[pUnitID] = unitID
									passengerstillmoves[pUnitID] = unitID
									Spring.GiveOrderToUnit(pUnitID, CMD_MOVE, {x,y,z}, {})
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

function gadget:UnitCmdDone(unitID, unitDefID, unitTeam, cmdID, cmdTag, cmdParams, cmdOpts)
	if (cmdID == 10 or cmdID == 0) then -- cmdID = MOVE & 0 = STOP
		for mUnitID, trunitID in pairs(passengerstillmoves) do
			if (unitID == mUnitID) then
				passengerstillmoves[mUnitID] = nil	-- passenger arrived at pick-up point
			else
				for pUnitID, tunitID in pairs(loadtheseunits) do
					if (unitID == tunitID) then
						loadtheseunits[pUnitID] = nil -- transport reached destination or was stopped
					end
				end
			end
		end		
	end
end

function gadget:GameFrame(f)
	if f % 32 < .1 then
		for pUnitID, unitID in pairs(loadtheseunits) do
			local x, y, z = Spring.GetUnitPosition(unitID) -- transport position
			local unitDefID = Spring.GetUnitDefID(unitID)			
			local loadingradius = UnitDefs[unitDefID].customParams.transportloadingradius
			if loadingradius == nil then
				loadingradius = 300
			end
			local UnitsAroundTransport = Spring.GetUnitsInCylinder(x,z,loadingradius)
			for _,tUnitID in ipairs(UnitsAroundTransport) do
				local tUnitDefID = Spring.GetUnitDefID(tUnitID)
				if (pUnitID == tUnitID and UnitDefs[tUnitDefID].customParams.canbetransported == "true") then
					Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),pUnitID)
					loadtheseunits[pUnitID] = nil
				end
			end
		end
	end
end


------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end

