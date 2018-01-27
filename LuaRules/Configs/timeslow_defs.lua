local array = {}

------------------------
-- Config

local MAX_SLOW_FACTOR = 0.9
-- Max slow damage on a unit = MAX_SLOW_FACTOR * current health
-- Slowdown of unit = slow damage / current health
-- So MAX_SLOW_FACTOR is the limit for how much units can be slowed

local DEGRADE_TIMER = 0.5
-- Time in seconds before the slow damage a unit takes starts to decay

local DEGRADE_FACTOR = 0.04
-- Units will lose DEGRADE_FACTOR*(current health) slow damage per second

local UPDATE_PERIOD = 15 -- I'd prefer if this was not changed


local weapons = {
	tc_witch_witchray = { slowDamage = 50, onlySlow = false, smartRetarget = 0.33, scaleSlow = false}, -- was 800
}

-- reads from customParams and copies to weapons as appropriate - needed for procedurally generated comms
-- as always, need better way to handle if upgrades are desired!
local presets = {
}

------------------------
-- Send the Config

for name,data in pairs(WeaponDefNames) do
	local custom = {scaleSlow = true}
	local cp = data.customParams
	if cp.timeslow_preset then
		weapons[name] = Spring.Utilities.CopyTable(presets[cp.timeslow_preset])
	elseif cp.timeslow_damagefactor or cp.timeslow_damage then
		custom.slowDamage = cp.timeslow_damage or (cp.timeslow_damagefactor * cp.raw_damage)
		custom.onlySlow = (cp.timeslow_onlyslow) or false
		custom.smartRetarget = cp.timeslow_smartretarget and tonumber(cp.timeslow_smartretarget) or nil
		weapons[name] = custom
	end
	if weapons[name] then array[data.id] = weapons[name] end
end

return array, MAX_SLOW_FACTOR, DEGRADE_TIMER*30/UPDATE_PERIOD, DEGRADE_FACTOR*UPDATE_PERIOD/30, UPDATE_PERIOD
