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


function gadget:Initialize()
end 		

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
    	local movetype = (Spring.GetUnitMoveTypeData(unitID)).name
		local tx, ty, tz = Spring.GetUnitPosition(unitID) -- transport position
		local loadingradius = UnitDefs[unitDefID].customParams.transportloadingradius
		if loadingradius == nil then
			loadingradius = 300
		end
		local UnitsAroundTransport = Spring.GetUnitsInSphere(tx,ty,tz,loadingradius)
		local x = loadcircle[1] -- x position is passenger's unitID if only oneclicked else the x-position of center of the load circle
		local y = loadcircle[2] -- y-position of center of the load circle
		local z = loadcircle[3] -- z-position of center of the load circle
		local r = loadcircle[4] -- radius of the load circle
		if (movetype == [[static]]) then --is it a bunker?
	-------- load a single unit
			if (r == nil) then
				for _,aUnitID in ipairs(UnitsAroundTransport) do -- check if unit is >a<round the transport, if not order it to move to the transport
					local aUnitDefID = Spring.GetUnitDefID(aUnitID)
					if (UnitDefs[aUnitDefID].customParams.canbetransported == "true") then
						if (aUnitID == x) then -- found unit is the passenger
							Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),aUnitID)
						else
							Spring.GiveOrderToUnit(x, CMD.LOAD_ONTO, {unitID}, {})
						end
					end
				end
	-------- load multiple unit			
			else
				local UnitsAroundCommand = Spring.GetUnitsInSphere(x,y,z,r)
				local MyTeam = Spring.GetUnitTeam(unitID)
				for _,cUnitID in ipairs(UnitsAroundCommand) do -- check all units in transport pick-up >c<ircle
					local cTeam = Spring.GetUnitTeam(cUnitID)
					if (cUnitID ~= unitID) and (cTeam == MyTeam) or (Spring.AreTeamsAllied(eTeam, MyTeam)) then				
						for _,aUnitID in ipairs(UnitsAroundTransport) do -- check if unit is around the transport, if not order it to move to the transport
							local aUnitDefID = Spring.GetUnitDefID(aUnitID)
							if (UnitDefs[aUnitDefID].customParams.canbetransported == "true") then						
								if (aUnitID == cUnitID) then
									Spring.UnitScript.CallAsUnit(unitID,(Spring.UnitScript.GetScriptEnv(unitID).script.TransportPickup),aUnitID)
								else
									Spring.GiveOrderToUnit(cUnitID, CMD.LOAD_ONTO, {unitID}, {})
								end
							end
						end
					end
				end
			end
		else -- it is mobile
			return true
		end
	else
		return true
	end
end


------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end

