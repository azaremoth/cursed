function gadget:GetInfo()
	return {
		name = "Crushable cob",
		desc = "Makes units with cob scripts crushable",
		author = "aZaremoth",
		date = "June 29th, 2012",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local Crushable_unit = {
	[UnitDefNames.tc_necromancer.id] = "tc_necromancer",
	[UnitDefNames.tc_witch.id] = "tc_witch",
	[UnitDefNames.euf_priest.id] = "euf_priest",	
	}
	


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------

function gadget:UnitFinished(unitID, unitDefID, team)
	if Crushable_unit [unitDefID] then
		Spring.SetUnitBlocking(unitID, true, true, true)
	end
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end


