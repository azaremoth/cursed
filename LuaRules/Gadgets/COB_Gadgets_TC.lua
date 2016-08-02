function gadget:GetInfo()
	return {
		name = "COB_Gadgets_TC.lua",
		desc = "Gadgets for COB LUA Communication, for The Cursed",
		author = "aZaremoth",
		date = "December 10th, 2008",
      	license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true,
	}
end

if (gadgetHandler:IsSyncedCode()) then
--////////////////////////////////////////////////////////////////////
function CreateTeeth(u, ud, team)
	local x, y, z = Spring.GetUnitPosition(u)
	local heading = math.random(3)
	local randomnumber  = math.random(3)	
	local newteeth
		if (randomnumber < 2 ) then
			newteeth = Spring.CreateUnit("TC_Teeth_rotated", x, y, z, heading, team)
		end
		if (randomnumber >= 2 ) then
			newteeth = Spring.CreateUnit("TC_Teeth_rotated2", x, y, z, heading, team)
		end
end
gadgetHandler:RegisterGlobal("CreateTeeth", CreateTeeth)

--////////////////////////////////////////////////////////////////////

function JustKillTheUnit(u, ud, team)
	Spring.DestroyUnit(u,false,false,u)
end
gadgetHandler:RegisterGlobal("JustKillTheUnit", JustKillTheUnit)
--////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////
end	