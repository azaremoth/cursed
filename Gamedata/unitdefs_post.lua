-- $Id: unitdefs_post.lua 4656 2009-05-23 23:41:24Z carrepairer $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local modOptions
if (Spring.GetModOptions) then
  modOptions = Spring.GetModOptions()
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Utility
--

local function tobool(val)
  local t = type(val)
  if (t == 'nil') then
    return false
  elseif (t == 'boolean') then
    return val
  elseif (t == 'number') then
    return (val ~= 0)
  elseif (t == 'string') then
    return ((val ~= '0') and (val ~= 'false'))
  end
  return false
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Descriptions
-- 
for name, ud in pairs(UnitDefs) do


	
	if not ud.customparams then
		ud.customparams = {}
	end
	ud.customparams.description_en = ud.description
end
