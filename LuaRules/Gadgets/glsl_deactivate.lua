function gadget:GetInfo()
  return {
	 name = "GLSL Lighting Deactivte",
	 desc = "Deactivates GSLS until we can find a fix",
	 author = "aZaremoth",
	 date = "July 1, 2009",
	 license = "Public Domain, or the least-restrictive rights in your country of residence",
	 layer = 0,
	 enabled  = true -- loaded by default?
  }
end

if (gadgetHandler:IsSyncedCode()) then
----------------------------------------------------------------------------------------------------------SYNCED
local function CreateLightMe(u, ud, team, p, r, g, b, a)
end
gadgetHandler:RegisterGlobal("CreateLightMe", CreateLightMe)

local function DestroyLightMe(u, ud, team)
end
gadgetHandler:RegisterGlobal("DestroyLightMe", DestroyLightMe)
----------------------------------------------------------------------------------------------------------END
end