function gadget:GetInfo()
	return {
		name = "Mana System and mana based skills for The Cursed",
		desc = "Handles mana and related skills",
		author = "aZaremoth",
		date = "2014-06-02",
		license = "GNU GPL v2, or later",
		layer = 25,
		enabled = true
	}
end

local MaxManaUnitList = {}	
local UPDATE_PERIOD = 30 -- see http://springrts.com/mantis/view.php?id=3048

if (gadgetHandler:IsSyncedCode()) then
--SYNCED

function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	local unitmana = UnitDefs[unitDefID].customParams.mana
	if unitmana ~= nil then
		MaxManaUnitList[unitID] = unitmana
		Spring.SetUnitRulesParam(unitID,'mana',1)
	end
end	

function gadget:UnitDestroyed(unitID, unitDefID, team, attacker)
	if MaxManaUnitList[unitID] ~= nil then
		MaxManaUnitList[unitID] = nil
	end
end

function gadget:GameFrame(f)
	if f % UPDATE_PERIOD == 1 then
		for unitID, teamID in pairs(MaxManaUnitList) do -- check for mana containing units
			---- Mana regeneration
			local loopmana = tonumber(Spring.GetUnitRulesParam(unitID,'mana'))
			local loopunitDefID = Spring.GetUnitDefID(unitID)
			local loopmanaregeneration = tonumber(UnitDefs[loopunitDefID].customParams.manaregeneration)
			local loopmaxmana = tonumber(MaxManaUnitList[unitID])
			if (loopmana ~= nil and loopmanaregeneration ~= nil and loopmaxmana ~= nil) then
				local loopmana = (loopmana + loopmanaregeneration)
				if loopmana < loopmaxmana then
					Spring.SetUnitRulesParam(unitID,'mana',loopmana)
				else
					Spring.SetUnitRulesParam(unitID,'mana',loopmaxmana)
				end	
			end
			---- healing
			local hashealed = false
			local manahealrange = tonumber(UnitDefs[loopunitDefID].customParams.manahealrange)
			local manahealamount = tonumber(UnitDefs[loopunitDefID].customParams.manahealamount)
			local manahealcost = tonumber(UnitDefs[loopunitDefID].customParams.manahealcost)
			local manahurtamount = tonumber(UnitDefs[loopunitDefID].customParams.manahurtamount)
			local manahurtcost = tonumber(UnitDefs[loopunitDefID].customParams.manahurtcost)
			if (UnitDefs[loopunitDefID].customParams.manahealer and manahealrange ~= nil and manahealamount ~= nil and manahealcost ~= nil) then
				local x, y, z = Spring.GetUnitPosition(unitID)			
				local HealUnits = Spring.GetUnitsInSphere(x,y,z, manahealrange)
				local MyTeam = Spring.GetUnitTeam(unitID)		
				for _,eUnitID in ipairs(HealUnits) do
					local eTeam = Spring.GetUnitTeam(eUnitID)
					local areAllied = Spring.AreTeamsAllied(eTeam, MyTeam)
					local eunitDefID = Spring.GetUnitDefID(eUnitID)
					if (UnitDefs[eunitDefID].customParams.isinfantry and eUnitID ~= unitID and eTeam == MyTeam) then
						local eUnitIDhealth, eUnitIDmaxhealth, _ ,_ , eUnitBuildProgress = Spring.GetUnitHealth(eUnitID)
						if (loopmana >= manahealcost and eUnitIDhealth < eUnitIDmaxhealth and hashealed == false and eUnitBuildProgress == 1) then					
							Spring.SetUnitHealth(eUnitID, (eUnitIDhealth+manahealamount))
							Spring.SetUnitRulesParam(unitID,'mana',(loopmana-manahealcost))
							local ex, ey, ez = Spring.GetUnitPosition(eUnitID)
							Spring.UnitScript.CallAsUnit(unitID,Spring.UnitScript.GetScriptEnv(unitID).script.cast)							
							Spring.SpawnCEG('MANACAST_HEAL', ex, ey+10, ez)					
							Spring.SpawnCEG('MANACAST_HEAL', x, y+25, z)				
							hashealed = true
						end
					-- hurt units made of bones						
					elseif (UnitDefs[eunitDefID].customParams.isbones and eUnitID ~= unitID and eTeam ~= MyTeam and hashealed == false and manahurtamount ~= nil and manahurtcost ~= nil and areAllied ~= true) then
						local eUnitIDhealth = Spring.GetUnitHealth(eUnitID)
						if loopmana >= manahurtcost then
							Spring.AddUnitDamage(eUnitID, manahurtamount, 0, unitID)
							--if (manahurtamount > eUnitIDhealth) then
							--	Spring.DestroyUnit(eUnitID,true,false)
							--else
							--	Spring.SetUnitHealth(eUnitID, (eUnitIDhealth-manahurtamount))
							--end	
							Spring.SetUnitRulesParam(unitID,'mana',(loopmana-manahurtcost))	
							local ex, ey, ez = Spring.GetUnitPosition(eUnitID)
							Spring.UnitScript.CallAsUnit(unitID,Spring.UnitScript.GetScriptEnv(unitID).script.cast)				
							Spring.SpawnCEG('MANACAST_HURT', ex, ey+10, ez)
							Spring.SpawnCEG('MANACAST_HURT', x, y+25, z)
							hashealed = true							
						end
					end
				end
			end
			--- cloak mana costs --- 
			local iscloaked = Spring.GetUnitIsCloaked(unitID)
			local manacloakcosts = tonumber(UnitDefs[loopunitDefID].customParams.manacloakcosts)
			if (iscloaked and manacloakcosts ~= nil) then
				loopmana = tonumber(Spring.GetUnitRulesParam(unitID,'mana'))
				if (loopmana-manacloakcosts > 0) then
					Spring.SetUnitRulesParam(unitID,'mana',(loopmana-manacloakcosts))
				else
					Spring.SetUnitRulesParam(unitID,'mana',0)
					Spring.GiveOrderToUnit(unitID, CMD.CLOAK, {0}, 0)
					-- Spring.SetUnitCloak(unitID, false)
					-- Spring.SetUnitStealth(unitID, false)
				end
			end
		end
	end
end


else
--UNSYNCED
end
