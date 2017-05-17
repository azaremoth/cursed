--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "No Self Pwn",
    desc      = "v1.1 Prevents units from damaging themselves.",
    author    = "quantum",
    date      = "Feb 1, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--v1.1: CarRepairer: changed to UnitPreDamaged

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local exceptionList = {
  "euf_techcenter_nuke",
  "tc_altar_hellstorm",  
}
  
  
if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

  
local exceptionMap  = {}
for _, unitName in pairs(exceptionList) do
  exceptionMap[UnitDefNames[unitName].id] = true
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, projID, weaponID, attackerID, attackerDefID, attackerTeam)
	
  if (unitID == attackerID and not exceptionMap[unitDefID]) then
	return 0
  end
  return damage
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------