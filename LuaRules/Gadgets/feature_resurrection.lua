--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Resurretinto",
    desc      = "Reads out custom feature parameters to resurrect them into defined units",
    author    = "azaremoth",
    date      = "2009-17-10",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  no unsynced code
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:FeatureCreated(fid, fTeam)
	local fdid = Spring.GetFeatureDefID(fid)
	local resurrectinto = FeatureDefs[fdid].customParams.resurrectintounit	
--	Spring.Echo(resurrectinto)
	if resurrectinto ~= nil then
		Spring.SetFeatureResurrect(fid, resurrectinto)
--	else
--		Spring.SetFeatureResurrect(fid, '')
	end
end
