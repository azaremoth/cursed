function gadget:GetInfo()
	return {
		name = "Modoptions",
		desc = "Loads standard mod options (non-lobby start)",
		author = "aZaremoth, sprunk",
		date = "2018-07-31",
		license = "Public Domain",
		layer = -math.huge,
		enabled = true
	}
end

local modOptions = Spring.GetModOptions()

do
	local fileMO = VFS.Include("modoptions.lua")
	Spring.Echo("MODOPTIONS LOADED")
	for i = 1, #fileMO do
		local modopt = fileMO[i]
		Spring.Echo(modopt.key)
		if not modOptions[modopt.key] then
			modOptions[modopt.key] = modopt.def
		end
	end
end

Spring.GetModOptions = function ()
    return modOptions
end
