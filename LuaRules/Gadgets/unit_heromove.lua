function gadget:GetInfo()
	return {
		name = "Hero mover",
		desc = "Moves heroes out of the factories",
		author = "aZaremoth",
		date = "December 25th, 2011",
		license = "public domain",
		layer = 1,
		enabled = true,
		}
end


---------------------------------------------------------------------
local IsAHeroBlank = {
	[UnitDefNames.tc_shade.id] = "tc_shade",
	[UnitDefNames.euf_sarge.id] = "euf_sarge",
	}
	


if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------SYNCED
----------------------------------------------------------------
------------------------------------------------------------------------

function gadget:UnitFinished(unitID, unitDefID, team)
	if IsAHeroBlank [unitDefID] then
      local x, y, z = Spring.GetUnitPosition(unitID)
	  local dx, dy, dz = Spring.GetUnitDirection(unitID)
	  local nx = (x+dx*80)
	  local nz = z 
	  if (dz > -2) then
		nz = (z+dz*80)
	  end
      Spring.SetUnitPosition(unitID, nx, y, nz)
	end
end

------------------------------------------------------------------------
----------------------------------------------------------------
-----------------------------------------------END
end


