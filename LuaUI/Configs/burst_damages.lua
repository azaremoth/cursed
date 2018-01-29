
-- Tag things with unreliable if they often deal less damage against targets for which burst makes sense to measure.
-- For example Rogue is perfectly reliable at hitting statics and burst does not make sense against mobiles.
-- Skuttle always deals less than full damage against mobiles but burst is a useful thing to track against mobiles.

local NORMAL = 1
local AA = 2
local EMP_OR_DISARM = 3

local damages = {
}

local damageDefs = {}
for name, data in pairs(damages) do
	local ud = UnitDefNames[name]
	if ud and ud.id then
		damageDefs[ud.id] = data
	end
end

return damageDefs
