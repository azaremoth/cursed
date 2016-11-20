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

-------- Needed for health bars widget to show leveling progress
Spring.SetGameRulesParam("xps",1)
----------------------------------------------------------------

function gadget:Initialize()
	GG.delayeddeathlist = GG.delayeddeathlist or {}
	local allTeams = Spring.GetTeamList()
	for _,team in ipairs(allTeams) do
		HeroLevelList[team] = 1
		HeroXPList[team] = 0
	end
end

local function ReAssignAssists(newUnit,oldUnit)
  local ally = Spring.GetUnitAllyTeam(newUnit)
  local alliedTeams = Spring.GetTeamList(ally)
  for n=1,#alliedTeams do
    local teamID = alliedTeams[n]
    local alliedUnits = Spring.GetTeamUnits(teamID)
    for i=1,#alliedUnits do
      local unitID = alliedUnits[i]
      local cmds = Spring.GetCommandQueue(unitID, 20)
      for j=1,#cmds do
        local cmd = cmds[j]
        if (cmd.id == CMD.GUARD)and(cmd.params[1] == oldUnit) then
          Spring.GiveOrderToUnit(unitID,CMD.INSERT,{cmd.tag,CMD.GUARD,0,newUnit},{})
          Spring.GiveOrderToUnit(unitID,CMD.REMOVE,{cmd.tag},{})
        end
      end
    end
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
		local newhero = nil
		local heroDefID = Spring.GetUnitDefID(unitID)
		local udhero = UnitDefs[heroDefID]
		local issarge = string.find(udhero.name, "euf_sarge")
		local isshade = string.find(udhero.name, "tc_shade")
		if (issarge) then
			newhero = Spring.CreateUnit("euf_sarge_lvl".. HeroLevelList[HeroTeam], x,y,z, facing, team)
		elseif (isshade) then
			newhero = Spring.CreateUnit("tc_shade_lvl".. HeroLevelList[HeroTeam], x,y,z, facing, team)
		else
			Spring.Echo("Fuck Error!")
		end
		if (newhero ~= nil) then
			--//copy command queue
			local cmds = Spring.GetUnitCommands(unitID, 20)
			for i = 1, #cmds do
				local cmd = cmds[i]
				if i == 1 and cmd.id < 0 then -- repair case for construction
					local units = Spring.GetUnitsInRectangle(cmd.params[1]-32, cmd.params[3]-32,cmd.params[1]+32, cmd.params[3]+32)
					local allyTeam = Spring.GetUnitAllyTeam(unitID)
					local notFound = true
					for j = 1, #units do
						local areaUnitID = units[j]
						if allyTeam == Spring.GetUnitAllyTeam(areaUnitID) and Spring.GetUnitDefID(areaUnitID) == -cmd.id then
							Spring.GiveOrderToUnit(newhero, CMD.REPAIR, {areaUnitID}, cmd.options.coded)
							notFound = false
							break
						end
					end
					if notFound then
						Spring.GiveOrderToUnit(newhero, cmd.id, cmd.params, cmd.options.coded)
					end
				else
					Spring.GiveOrderToUnit(newhero, cmd.id, cmd.params, cmd.options.coded)
				end
			end
			--//reassign assist commands to new unit
			ReAssignAssists(newhero,unitID)
			--//kill old hero next game frame
			GG.delayeddeathlist[unitID] = Spring.GetGameFrame()
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
	-- Hero has sufficient XP to Level
	if (HeroLevelList[HeroTeam] < MaxLevel and HeroXPList[HeroTeam] > ((HeroLevelList[HeroTeam]^1.5)*LevelXPMultiplier^1.5)) then
		HeroLevelList[HeroTeam] = (HeroLevelList[HeroTeam]+1)
		Spring.Echo('Hero of team '.. HeroTeam .. ' reached level: ' .. HeroLevelList[HeroTeam] )		
		ReplaceHero(unitID, HeroTeam)
	end
-------- Needed for health bars widget to show leveling progress
	if (HeroLevelList[HeroTeam] < MaxLevel) then
		local currentlevelXPs = (HeroXPList[HeroTeam]-(HeroLevelList[HeroTeam]-1)^1.5*LevelXPMultiplier^1.5)/(HeroLevelList[HeroTeam]^1.5*LevelXPMultiplier^1.5)
		Spring.SetUnitRulesParam(unitID,'xps',currentlevelXPs)
	else
		Spring.SetUnitRulesParam(unitID,'xps',0)
	end
----------------------------------------------------------------	
end

--- A little hacky but it preventes two heros build at once by multiple factories (accounting for some problems (bug?) I had with the tech tree gadget)
function gadget:UnitCreated(unitID, unitDefID, team, builderID)
	if IsAHeroBlank [unitDefID] then
		local allUnits = Spring.GetTeamUnits(team)
		for _,unitIDloop in ipairs(allUnits) do
			if (unitIDloop ~= unitID) then
				unitIDloopDefs = Spring.GetUnitDefID(unitIDloop)
				if IsAHeroBlank [unitIDloopDefs] then	
					Spring.DestroyUnit(unitID, false, false, unitID)
				end
			end
		end
	end
end	

--- Kill any hero that is given to another team
function gadget:UnitGiven(unitID, unitDefID, team, oldteam) 
	if IsAHero [unitDefID] then
		if (unitID ~= nil) then
			Spring.DestroyUnit(unitID, false, false, unitID)
			Spring.Echo("A hero rather goes Harakiri than being given away!!!")
		end
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
		if (attacker ~= unitID) then
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
end

else
--UNSYNCED
end
