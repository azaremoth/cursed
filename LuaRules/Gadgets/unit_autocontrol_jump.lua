function gadget:GetInfo()
  return {
    name      = "Jump control",
    desc      = "Controls automated jumping (esp. for AIs)",
    author    = "aZaremoth",
    date      = "2017-04-02",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

include("LuaRules/Configs/customcmds.h.lua")


local jumpDefNames  = VFS.Include"LuaRules/Configs/jump_defs.lua"
local jumpDefs = {}

for name, data in pairs(jumpDefNames) do
	jumpDefs[UnitDefNames[name].id] = data
end

local JumperPairs = {
	[UnitDefNames.euf_pyro.id] = "euf_pyro",
	[UnitDefNames.tc_ghoul.id] = "tc_ghoul",
	[UnitDefNames.tc_mage.id] = "tc_mage",
	[UnitDefNames.tc_cacodemon.id] = "tc_cacodemon",
	[UnitDefNames.euf_sarge_lvl2.id] = "euf_sarge_lvl2",
	[UnitDefNames.euf_sarge_lvl3.id] = "euf_sarge_lvl3",
	[UnitDefNames.euf_sarge_lvl4.id] = "euf_sarge_lvl4",
	[UnitDefNames.euf_sarge_lvl5.id] = "euf_sarge_lvl5",
	[UnitDefNames.tc_shade_lvl2.id] = "tc_shade_lvl2",
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",
	[UnitDefNames.bug_med.id] = "bug_med",
	[UnitDefNames.bug_med.id] = "bug_med_undead",	
}	

local AggressiveJumpersPairs = {
	[UnitDefNames.euf_pyro.id] = "euf_pyro",
	[UnitDefNames.tc_ghoul.id] = "tc_ghoul",
}	
	

---------------------------------------------------------------------------------------------------------------
if (not gadgetHandler:IsSyncedCode()) then
	return false
end
---------------------------------------------------------------------------------------------------------------


function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)

	local ai = select(4, Spring.GetTeamInfo(unitTeam))
	local firestate = Spring.GetUnitStates(unitID)["firestate"] -- needs to be 2 for aggressive jumping
	local areallied = false
	
	if ((unitTeam ~= nil) and (attackerTeam ~=nil)) then
		if (unitTeam == attackerTeam) then
			areallied = true
		elseif ((unitTeam > 0) and (attackerTeam > 0)) then
			areallied = Spring.AreTeamsAllied(unitTeam, attackerTeam)
		end
	end
	
--	if ( ((not Spring.AreTeamsAllied(unitTeam, attackerTeam)) and (unitTeam ~= attackerTeam)) or (AggressiveJumpersPairs[unitDefID] and (firestate == 2)) or (Spring.GetGaiaTeamID() == unitTeam) or (ai) ) then
	if ( (not areallied) and ( (Spring.GetGaiaTeamID() == unitTeam) or (ai) or (AggressiveJumpersPairs[unitDefID] and (firestate == 2)) ) ) then
		if (attackerID) then
			if JumperPairs [unitDefID] then
				local ud = UnitDefs[attackerDefID]
				if not ud.canFly then
					local jump = Spring.GetUnitRulesParam(unitID, "jumpReload")
					-- if ((not jump) or jump == 1) and Spring.GetUnitSeparation(unitID, attackerID, true) < jumpDefs[unitDefID].range + 100 then
					if ((not jump) or jump == 1) then
						local cQueue = Spring.GetCommandQueue(unitID, 1)
						if #cQueue == 0 or cQueue[1].id ~= CMD_JUMP then
							local randomx
							local randomy
							if (math.random(-1,1) > 0) then
								randomx = math.random(-50,50)
								randomz = math.random(30,50)*(-1)
							else 
								randomx = math.random(-50,50)						
								randomz = math.random(30,50)						
							end				
							local x,y,z = Spring.GetUnitPosition(unitID)
							local ax,ay,az = Spring.GetUnitPosition(attackerID)
							local dist = math.sqrt((ax-x)^2+(az-z)^2)

							local jumpdist = 0
							if (UnitDefs[unitDefID].weapons ~= nil) then
								for i,w in ipairs(UnitDefs[unitDefID].weapons) do
									jumpdist = (dist - (WeaponDefs[w.weaponDef].range))
								end
							else 
								jumpdist = (-jumpDefs[unitDefID])
							end
							local jx = x+randomx
							local jz = z+randomz
							if ( jumpdist < (jumpDefs[unitDefID].range + 100)) then
								jx = x+((ax-x)*(jumpdist/dist))
								jz = z+((az-z)*(jumpdist/dist))
							else
								jx = x+((ax-x)*(-jumpDefs[unitDefID].range/dist))
								jz = z+((az-z)*(-jumpDefs[unitDefID].range/dist))
							end
							local burrowed = Spring.GetUnitRulesParam(unitID,"burrowed")						
							if (burrowed ~= 1 and (math.sqrt(jumpdist^2) > 50 )) then
								-- Spring.GiveOrderToUnit(unitID, CMD_JUMP, {jx,y,jz}, {"alt"} )
								Spring.GiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, jx,y,jz }, {"alt"} ) -- should insert the command at the beginning of the command queue 
							end
						end
					end
				end
			end
		end
	end
end


