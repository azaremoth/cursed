function gadget:GetInfo()
	return {
		name = "Dragon mover",
		desc = "Moves floating units up into the air",
		author = "aZaremoth",
		date = "December 25th, 2009",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local IntoTheAirPairs = {
	[UnitDefNames.tc_dragon.id] = "tc_dragon",
	[UnitDefNames.tc_seer.id] = "tc_seer",	
	}


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------

function gadget:UnitFinished(unitID, unitDefID, team)
	if IntoTheAirPairs [unitDefID] then
      local x, y, z = Spring.GetUnitPosition(unitID)
	  y = 200		
       if (math.random(1,2) == 1) then
         x = x + math.random(50,100)
       else
         x = x - math.random(50,100)
       end
       if (math.random(1,2) == 1) then
         z = z + math.random(50,100)
       else
         z = z - math.random(50,100)
       end
       Spring.GiveOrderToUnit(unitID, CMD.FIGHT,  { x, y, z}, { "" })	  
	end
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end


