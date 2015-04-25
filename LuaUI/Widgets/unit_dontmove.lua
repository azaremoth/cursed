--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "DontMove",
    desc      = "Sets pre-defined units on hold position.",
    author    = "quantum",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local unitSet = {}

local unitArray = {

  "tc_bonebeast",
  "tc_necromancer",  
  "tc_witch",    
  "tc_purgatory",     
  "euf_bazooka",
  "euf_sniper",
  "euf_priest",
  "euf_constructor",    
  "euf_constructor_lvl2",  
  "euf_mlrs", 
  
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Initialize() 
  for i, v in pairs(unitArray) do
    unitSet[v] = true
  end
end


function widget:UnitFromFactory(unitID, unitDefID, unitTeam)
  local ud = UnitDefs[unitDefID]
  if ((ud ~= nil) and (unitTeam == Spring.GetMyTeamID())) then
    if (unitSet[ud.name]) then
      Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 0 }, {})
    end 
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

