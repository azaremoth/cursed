function gadget:GetInfo()
	return {
		name = "Experience System for Cursed",
		desc = "Handles XP",
		author = "aZaremoth",
		date = "2011-11-03",
		license = "GNU GPL v2, or later",
		layer = 25,
		enabled = true
	}
end

----------- Hero units -----------
local IsAHeroBlank = {
	[UnitDefNames.tc_shade.id] = "tc_shade",
	[UnitDefNames.euf_sarge.id] = "euf_sarge",
	}

local IsAHero = {
	[UnitDefNames.tc_shade.id] = "tc_shade",
	[UnitDefNames.tc_shade_lvl1.id] = "tc_shade_lvl1",
	[UnitDefNames.tc_shade_lvl2.id] = "tc_shade_lvl2",
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",
	[UnitDefNames.euf_sarge.id] = "euf_sarge",
	[UnitDefNames.euf_sarge_lvl1.id] = "euf_sarge_lvl1",
	[UnitDefNames.euf_sarge_lvl2.id] = "euf_sarge_lvl2",
	[UnitDefNames.euf_sarge_lvl3.id] = "euf_sarge_lvl3",
	[UnitDefNames.euf_sarge_lvl4.id] = "euf_sarge_lvl4",	
	[UnitDefNames.euf_sarge_lvl5.id] = "euf_sarge_lvl5",	
	}
	
----------- Experience Range -----------
	local expRange = 500
	local DeathPenalty = 0.5
	local GainForKilledHero = 0.5	
	local LevelXPMultiplier = 0.7
	local MaxLevel = 5

	local HeroXPList = {}	
	local HeroLevelList = {}

	
if (gadgetHandler:IsSyncedCode()) then
--SYNCED

Spring.SetGameRulesParam("xps",1)

function gadget:Initialize()
	local allTeams = Spring.GetTeamList()
	for _,team in ipairs(allTeams) do
		HeroLevelList[team] = 1
		HeroXPList[team] = 0
	end
end

local function ReplaceHero(unitID, team)
		local HeroTeam = Spring.GetUnitTeam(unitID)		
		local x, y, z = Spring.GetUnitPosition(unitID)

		--- direction to facing ---
		local dx, dy, dz = Spring.GetUnitDirection(unitID)
		if (dx == 0 and dz == 1) then
			facing = 0
		elseif (dx == 1) then
			facing = 1
		elseif (dx == -1) then
			facing = 3
		else
			facing = 2
		end
		----------------------------
		
		local heroDefID = Spring.GetUnitDefID(unitID)
		local udhero = UnitDefs[heroDefID]
		local issarge = string.find(udhero.name, "euf_sarge")
		local isshade = string.find(udhero.name, "tc_shade")
	--	Spring.Echo('Shade found:' .. issarge)
	--	Spring.Echo('Shade found:' .. isshade)	
		Spring.DestroyUnit(unitID, true, true)
	--	Spring.Echo("Remove unit:" .. unitID)
		if (issarge) then
			local newhero = Spring.CreateUnit("euf_sarge_lvl".. HeroLevelList[HeroTeam], x,y,z, facing, team)
	--		Spring.Echo("Added unit:" .. newhero)
		elseif (isshade) then
			local newhero = Spring.CreateUnit("tc_shade_lvl".. HeroLevelList[HeroTeam], x,y,z, facing, team)
		else
			Spring.Echo("Fuck Error!")
		end
end

local function CheckLeveling(unitID)
	local HeroTeam = Spring.GetUnitTeam(unitID)
----------------------- for testing
--		local heroDefID = Spring.GetUnitDefID(unitID)
--		local udhero = UnitDefs[heroDefID]
--		Spring.Echo(udhero.name .. " Level " .. HeroLevelList[HeroTeam] .. " of Team " .. HeroTeam .. " checked")
--		Spring.Echo("Team " .. HeroTeam .. " has " .. HeroXPList[HeroTeam] .. " XP")	
-----------------------	
	if (HeroLevelList[HeroTeam] < MaxLevel and HeroXPList[HeroTeam] > ((HeroLevelList[HeroTeam]^1.5)*LevelXPMultiplier^1.5)) then
		HeroLevelList[HeroTeam] = (HeroLevelList[HeroTeam]+1)
		Spring.Echo('Hero Level:' .. HeroLevelList[HeroTeam] )		
		ReplaceHero(unitID, HeroTeam)
	end
	if (HeroLevelList[HeroTeam] < MaxLevel) then
		local currentlevelXPs = (HeroXPList[HeroTeam]-(HeroLevelList[HeroTeam]-1)^1.5*LevelXPMultiplier^1.5)/(HeroLevelList[HeroTeam]^1.5*LevelXPMultiplier^1.5)
--		Spring.Echo(currentlevelXPs)
		Spring.SetUnitRulesParam(unitID,'xps',currentlevelXPs)
	else 
		Spring.SetUnitRulesParam(unitID,'xps',0)
	end
	local XPsParam = Spring.GetUnitRulesParam(unitID,'xps')
end

--- A little hacky but it preventes two heros build at once by multiple factories (accounting for some problems (bug?) I had with the tech tree gadget)
function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	if IsAHeroBlank [unitDefID] then
		local allUnits = Spring.GetTeamUnits(team)
		for _,unitIDloop in ipairs(allUnits) do
			if (unitIDloop ~= unitID) then
				unitIDloopDefs = Spring.GetUnitDefID(unitIDloop)
				if IsAHeroBlank [unitIDloopDefs] then	
					Spring.DestroyUnit(unitID, true, true)
				end
			end
		end
	end
end	

--- Kill any hero that is given to another team
function gadget:UnitGiven(unitID, unitDefID, team, oldteam) 
	if IsAHero [unitDefID] then
		Spring.DestroyUnit(unitID, false, false)
		Spring.Echo("A hero rather goes Harakiri than being given away!!!")
	end 
end

function gadget:UnitFromFactory(unitID, unitDefID, team, factID, factDefID, userOrders)
	if IsAHero [unitDefID] then
		ReplaceHero(unitID, team)
	end 
end

local function IncreaseHeroXP(unitID, XPGain)
	local HeroTeam = Spring.GetUnitTeam(unitID)
	HeroXPList[HeroTeam] = (HeroXPList[HeroTeam]+XPGain)
	CheckLeveling(unitID)
end

local function DecreaseHeroXP(unitID)
		local HeroTeam = Spring.GetUnitTeam(unitID)
		HeroXPList[HeroTeam] = (HeroXPList[HeroTeam]-DeathPenalty)	
		if (HeroXPList[HeroTeam] < 0) then
			HeroXPList[HeroTeam]  = 0
		elseif (HeroXPList[HeroTeam] < ((HeroLevelList[HeroTeam]-1)^1.5*LevelXPMultiplier^1.5)) then
			HeroXPList[HeroTeam] = ((HeroLevelList[HeroTeam]-1)^1.5*LevelXPMultiplier^1.5)			
		end		
		Spring.Echo('Hero died: Team ' .. HeroTeam .. ' gets an experience penalty!')
end

function gadget:UnitDestroyed(unitID, unitDefID, team, attacker)
	if (attacker ~= nil) then
		local XPGain
		if (IsAHero[unitDefID]) then
			DecreaseHeroXP(unitID)
			XPGain = GainForKilledHero -- XP for a killed hero
--			Spring.Echo('Well done! An enemy hero was killed. You receive a XP bonus!')
		else 
			local ud = UnitDefs[unitDefID]
			XPGain = (ud.metalCost/3000) -- gained XP based on metal costs			
		end
		--get all units around the destroyed one
		local x,y,z = Spring.GetUnitPosition(unitID)
		local unitsAround = Spring.GetUnitsInCylinder(x,z, expRange)
		--give XP to all non-allied units within a certain range
		for index,unitIDLoop in pairs(unitsAround) do
			if ((team~=nil)and(Spring.GetUnitTeam(unitIDLoop)~=nil)) then
	--				local atkDefIDLoop = Spring.GetUnitDefID(attacker)
	--				Spring.Echo("unitIDLoop: " .. unitIDLoop .. " attackerID: " .. attacker .. " atkDefIDLoop: " .. atkDefIDLoop .. " killed:" .. unitID)
				if ((not Spring.AreTeamsAllied((Spring.GetUnitTeam(unitIDLoop)),team)) and (unitIDLoop ~= attacker)) then
					local unitDefIDLoop = Spring.GetUnitDefID(unitIDLoop)
					if (IsAHero[unitDefIDLoop]) then
						IncreaseHeroXP(unitIDLoop, XPGain)
--						Spring.Echo('assistant hero gets XPs ' .. XPGain)
					else 
						local LoopUnitXPs = Spring.GetUnitExperience(unitIDLoop)
						if (Spring.GetUnitExperience(unitIDLoop) < 1) then
							Spring.SetUnitExperience(unitIDLoop,LoopUnitXPs+XPGain)
						end
					end

				end
			end
		end
		--give experience to the attacker - no matter how far away he is
		local unitDefIDAtk = Spring.GetUnitDefID(attacker)		
		if (IsAHero[unitDefIDAtk]) then
			IncreaseHeroXP(attacker, XPGain)
	--		Spring.Echo('attacker hero gets XPs ' .. XPGain)
		else
			local AtkXPs = Spring.GetUnitExperience(attacker)
			if (Spring.GetUnitExperience(attacker) < 1) then
				Spring.SetUnitExperience(attacker,AtkXPs+XPGain)
			end
		end		
	end
end

else
--UNSYNCED
end
