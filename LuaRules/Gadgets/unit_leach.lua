function gadget:GetInfo()
	return {
		name = "Health Leach",
		desc = "Units do leach a certain amount of caused damage",
		author = "aZaremoth",
		date = "2016-06-04",
		license = "GNU GPL v2, or later",
		layer = 25,
		enabled = true
	}
end

----------- Hero units -----------

local IsALeach = {
	[UnitDefNames.tc_shade.id] = "tc_shade",
	[UnitDefNames.tc_shade_lvl1.id] = "tc_shade_lvl1",
	[UnitDefNames.tc_shade_lvl2.id] = "tc_shade_lvl2",
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",
	[UnitDefNames.tc_shade_lvl6.id] = "tc_shade_lvl6",
	[UnitDefNames.tc_shade_lvl7.id] = "tc_shade_lvl7",
	[UnitDefNames.tc_shade_lvl8.id] = "tc_shade_lvl8",
	[UnitDefNames.tc_shade_lvl9.id] = "tc_shade_lvl9",
	[UnitDefNames.tc_shade_lvl10.id] = "tc_shade_lvl10",	
	}
	
if (gadgetHandler:IsSyncedCode()) then
--SYNCED

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
	if (IsALeach [attackerDefID] and attackerID ~= nil) then
		if (Spring.GetUnitHealth(attackerID) > 0) then
			Spring.SetUnitHealth(attackerID, (Spring.GetUnitHealth(attackerID))+(damage*0.2))
		end
	end 
end

else
--UNSYNCED
end
