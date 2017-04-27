function gadget:GetInfo()
	return {
		name    = "Awards",
		desc    = "v1.002 Awards players at end of battle with shiny trophies.",
		author  = "CarRepairer, aZaremoth",
		date    = "2008-10-15", --2013-09-05
		license = "GNU GPL, v2 or later",
		layer   = 1000000, -- Must be after all other build steps and before unit_spawner.lua for queen kill award.
		enabled = true,
	}
end

include("LuaRules/Configs/constants.lua")

local spGetAllyTeamList = Spring.GetAllyTeamList
local spIsGameOver      = Spring.IsGameOver
local spGetTeamInfo     = Spring.GetTeamInfo
local gaiaTeamID        = Spring.GetGaiaTeamID()

local echo = Spring.Echo

local totalTeamList = {}

local awardDescs = VFS.Include("LuaRules/Configs/award_names.lua")
local IsAHero = VFS.Include("LuaRules/Configs/hero_list.lua")	

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
local spAreTeamsAllied      = Spring.AreTeamsAllied
local spGetGameSeconds      = Spring.GetGameSeconds
local spGetTeamStatsHistory = Spring.GetTeamStatsHistory
local spGetUnitHealth       = Spring.GetUnitHealth
local spGetAllUnits         = Spring.GetAllUnits
local spGetUnitTeam         = Spring.GetUnitTeam
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitExperience   = Spring.GetUnitExperience
local spGetTeamResources    = Spring.GetTeamResources
local GetUnitCost           = Spring.Utilities.GetUnitCost

local CURSED_AWARDMARKER    = [[180]]

local floor = math.floor
local totalDamage = 0

local mexDefID = {
	[UnitDefNames.tc_metalextractor_lvl1.id] = "tc_metalextractor_lvl1",
	[UnitDefNames.tc_metalextractor_lvl2.id] = "tc_metalextractor_lvl2",
	[UnitDefNames.euf_metalextractor_lvl1.id] = "euf_metalextractor_lvl1",
	[UnitDefNames.euf_metalextractor_lvl2.id] = "euf_metalextractor_lvl2",
}

local SuperUnitDefID = {
	[UnitDefNames.tc_dragon.id] = "tc_dragon",
	[UnitDefNames.euf_angel.id] = "euf_angel",
}

local awardData = {}

local empFactor     = 4

local minFriendRatio = 0.25


local awardAbsolutes = {
	bug         = 5,
	lycan 		= 1,
	cap         = 10,
	share       = 30,
	rezz        = 30,
	mex         = 15,
	mexkill     = 15,
	herokill    = 3,
	drankill    = 3,
	sweeper     = 20,
	heart       = 1*10^9, --we should not exceed 2*10^9 because math.floor-ing the value will return integer -2147483648. Reference: https://code.google.com/p/zero-k/source/detail?r=9681
	hover       = 2000,
	air         = 2000, 
	nux         = 2000,
	friend       = 500,
	shell        = 2000,
	fire          = 2000,
	emp         = 500,
	slow         = 500,
	dran        = 2000,
	kam        = 2000,
	hero          = 2000, 
}

local expUnitTeam, expUnitDefID, expUnitExp = 0,0,0

local awardList = {}
local awardListForReplay = {}
local sentAwards = false

local hoverunits = { -- WORKS
	[UnitDefNames.tc_mermeoth.id] = "tc_mermeoth",
	[UnitDefNames.tc_rictus.id] = "tc_rictus",
	[UnitDefNames.euf_mlrs.id] = "euf_mlrs",
	[UnitDefNames.euf_hover.id] = "euf_hover",
}

local lycanunits = { -- WORKS
	[UnitDefNames.euf_wolf.id] = "euf_wolf",
	[UnitDefNames.euf_werewolf.id] = "euf_werewolf",
}

local bugunits = { -- WORKS
	[UnitDefNames.bug_larva.id] = "bug_larva",
	[UnitDefNames.bug_med.id] = "bug_med",
	[UnitDefNames.bug_big.id] = "bug_big",	
}

local dranUnits = {
	[UnitDefNames.tc_dragon.id] = "tc_dragon",
	[UnitDefNames.euf_angel.id] = "euf_angel",
}

local staticO_small = { -- WORKS
	[UnitDefNames.tc_defender.id] = "tc_defender",
	[UnitDefNames.tc_hellfire.id] = "tc_hellfire",
	[UnitDefNames.euf_plasmatower.id] = "euf_plasmatower",
	[UnitDefNames.euf_aatower.id] = "euf_aatower",	
	[UnitDefNames.euf_artytower.id] = "euf_artytower",		
	[UnitDefNames.tc_tower.id] = "tc_tower",
	[UnitDefNames.euf_lasertower.id] = "euf_lasertower",	
}

local staticO_big = { -- WORKS
	[UnitDefNames.euf_techcenter_nuke.id] = "euf_techcenter_nuke",
	[UnitDefNames.tc_altar_hellstorm.id] = "tc_altar_hellstorm",	
}

local kamikaze = { -- WORKS
	[UnitDefNames.tc_kaboom.id] = "tc_kaboom",
	[UnitDefNames.tc_suicide.id] = "tc_suicide",	
}

local flamerWeaponDefs = {}

-------------------
-- Resource tracking


local allyTeamInfo = {}
--local resourceInfo = {count = 0, data = {}}

do
	local allyTeamList = Spring.GetAllyTeamList()
	for i=1,#allyTeamList do
		local allyTeamID = allyTeamList[i]
		allyTeamInfo[allyTeamID] = {
			team = {},
			teams = 0,
		}

		local teamList = Spring.GetTeamList(allyTeamID)
		for j=1,#teamList do
			local teamID = teamList[j]
			allyTeamInfo[allyTeamID].teams = allyTeamInfo[allyTeamID].teams + 1
			allyTeamInfo[allyTeamID].team[allyTeamInfo[allyTeamID].teams] = teamID
		end
	end
end

------------------------------------------------
-- functions

local function getMeanDamageExcept(excludeTeam)
	local mean = 0
	local count = 0
	--for team,dmg in pairs(damageList) do
	for team,dmg in pairs(awardData.pwn) do
		if team ~= excludeTeam
			and dmg > 100
		then
			mean = mean + dmg
			count = count + 1
		end
	end
	return (count>0) and (mean/count) or 0
end

local function getMaxVal(valList)
	local winTeam, maxVal = false,0
	for team,val in pairs(valList) do
		if val and val > maxVal then
			winTeam = team
			maxVal = val
			--Spring.Echo(" Team ".. winTeam .." maxVal ".. maxVal) --debug
		end
	end

	return winTeam, maxVal
end


local function awardAward(team, awardType, record, maxval)
	if not awardList[team] then --random check for devving.
		echo('<Award Error> Missing award list for team ' .. team)
		return
	end
	awardList[team][awardType] = record
	awardListForReplay[team][awardType] = maxval	
end

local function CopyTable(original) -- Warning: circular table references lead to
	local copy = {}                -- an infinite loop.
	for k, v in pairs(original) do
		if (type(v) == "table") then
			copy[k] = CopyTable(v)
		else
			copy[k] = v
		end
	end
	return copy
end


local function AddAwardPoints( awardType, teamID, amount )
	if (teamID and (teamID ~= gaiaTeamID)) then
		awardData[awardType][teamID] = awardData[awardType][teamID] + (amount or 0)
	end
end

local function ProcessAwardData()

	for awardType, data in pairs(awardData) do
		local winningTeam
		local maxVal
		local absolute = awardAbsolutes[awardType]
		local message
		local recordVal = 0

		if awardType == 'friend' then
			maxVal = 0
			for team,dmg in pairs(data) do

				--local totalDamage = dmg+damageList[team]
				local totalDamage = dmg + awardData.pwn[team]
				local damageRatio = totalDamage>0 and dmg/totalDamage or 0

				if damageRatio > maxVal then
					winningTeam = team
					maxVal = damageRatio
				end
			end

		else
			winningTeam, maxVal = getMaxVal(data)

		end

		if winningTeam then

			local compare
			if absolute then
				compare = absolute
			else
				compare = getMeanDamageExcept(winningTeam)
			end

			if maxVal > compare then
				maxVal = floor(maxVal)

				if awardType == 'pwn' then
					local relativeDamageGiven = (maxVal/totalDamage)
					message = 'Damage dealt: ' .. floor(relativeDamageGiven * 100) ..'%'
					recordVal = floor(relativeDamageGiven * 100)							
				elseif awardType == 'ouch' then
					local relativeDamageTaken = (maxVal/totalDamage)
					message = 'Damage taken: ' .. floor(relativeDamageTaken * 100) ..'%'
					recordVal = floor(relativeDamageTaken * 100)		
				elseif awardType == 'cap' then
					message = 'Units captured: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'bug' then
					message = 'Bugs killed: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'lycan' then
					message = 'Werewolfs killed: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'share' then
					message = 'Units shared: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'rezz' then
					message = 'Necromanced: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'fire' then
					message = 'Burnt value: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'hero' then
					message = 'Damage by hero: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'emp' then
					message = 'Stunned value: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'shell' then
					message = 'Damage by defenses: ' .. maxVal
					recordVal = maxVal					
				elseif awardType == 'slow' then
					message = 'Slowed value: ' .. maxVal
					recordVal = maxVal
				elseif awardType == 'friend' then
					message = 'Damage to allies: '.. floor(maxVal * 100) ..'%'
					recordVal = floor(maxVal * 100)
				elseif awardType == 'mex' then
					message = 'Mexes built: '.. maxVal
					recordVal = maxVal
				elseif awardType == 'mexkill' then
					message = 'Mexes destroyed: '.. maxVal
					recordVal = maxVal
				elseif awardType == 'herokill' then
					message = maxVal .. ' Heroes eliminated'
					recordVal = maxVal
				elseif awardType == 'drankill' then
					message = maxVal .. ' Dragons or Angels killed'
					recordVal = maxVal
				elseif awardType == 'heart' then
					local maxQueenKillDamage = maxVal - absolute --remove the queen kill signature: +1000000000 from the total damage
					message = 'Damage: '.. maxQueenKillDamage
					recordVal = maxQueenKillDamage
				elseif awardType == 'sweeper' then
					message = maxVal .. ' Pitts wiped out'
					recordVal = maxVal
				else
					message = 'Damaged value: '.. maxVal
					recordVal = maxVal
				end
			end
		end --if winningTeam
		if message then
			awardAward(winningTeam, awardType, message, recordVal)
		end

	end
end

-------------------
-- Callins

function gadget:Initialize()

	GG.Awards = GG.Awards or {}
	GG.Awards.AddAwardPoints = AddAwardPoints
	
	--_G.resourceInfo = resourceInfo

	local tempTeamList = Spring.GetTeamList()
	for i=1, #tempTeamList do
		local team = tempTeamList[i]
		--Spring.Echo('team', team)
		if team ~= gaiaTeamID then
			totalTeamList[team] = team
		end
	end

	--new
	for awardType, _ in pairs(awardDescs) do
		awardData[awardType] = {}
	end
	for _,team in pairs(totalTeamList) do
		awardList[team] = {}
		awardListForReplay[team] = {}
		for awardType, _ in pairs(awardDescs) do
			awardData[awardType][team] = 0
		end

	end
	
	for i=1,#WeaponDefs do
		local wcp = WeaponDefs[i].customParams or {}
		if (wcp.flamethrower == "1") then
			-- Spring.Echo("Pyro found")
			flamerWeaponDefs[i] = true
		end
	end
	
end --Initialize

function gadget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
	-- Units given to neutral?
	if oldTeam == gaiaTeamID or newTeam == gaiaTeamID then
		return
	end
	if not spAreTeamsAllied(oldTeam,newTeam) then
		if awardData['cap'][newTeam] then --if team exist, then:
			AddAwardPoints( 'cap', newTeam, 1 )
		end
	else 
		AddAwardPoints( 'share', oldTeam, 1 )
	end
end

function gadget:FeatureDestroyed(featureID, allyTeamID) -- REZZ COUNTER
	local UnitDefName, buildFacing = Spring.GetFeatureResurrect(featureID)
	if (UnitDefName ~= nil) then
		local fx,fy,fz = Spring.GetFeaturePosition(featureID)
		local UnitsClose = Spring.GetUnitsInCylinder(fx, fz, 10)
		for _,eUnitID in ipairs(UnitsClose) do
			local eUnitDefID = Spring.GetUnitDefID(eUnitID)
			local eUnitDefName = UnitDefs[eUnitDefID].name
			if (UnitDefName == eUnitDefName) then
				local eUnitTeam = Spring.GetUnitTeam(eUnitID)
				AddAwardPoints( 'rezz', eUnitTeam, 1 )
			end
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, _, _, killerTeam)
	if (killerTeam == unitTeam) or (killerTeam == gaiaTeamID) or (unitTeam == gaiaTeamID) or (killerTeam == nil) or (spIsGameOver()) then
		return
	else 
		local ud = UnitDefs[unitDefID]
	
		if ((mexDefID[unitDefID]) and (not spAreTeamsAllied(killerTeam, unitTeam))) then
			AddAwardPoints( 'mexkill', killerTeam, 1 )
		elseif (IsAHero[unitDefID] and (not spAreTeamsAllied(killerTeam, unitTeam))) then
			AddAwardPoints( 'herokill', killerTeam, 1 )
		elseif (lycanunits[unitDefID] and (not spAreTeamsAllied(killerTeam, unitTeam))) then
			AddAwardPoints( 'lycan', killerTeam, 1 )
		elseif (bugunits[unitDefID] and (not spAreTeamsAllied(killerTeam, unitTeam))) then
			AddAwardPoints( 'bug', killerTeam, 1 )
		elseif (SuperUnitDefID[unitDefID] and (not spAreTeamsAllied(killerTeam, unitTeam))) then
			AddAwardPoints( 'drankill', killerTeam, 1 )
		elseif ud.name == "tc_dragonqueen" then
			for killerFrienz, _ in pairs(awardData['heart']) do --give +1000000000 points for all frienz that kill queen and won
				AddAwardPoints( 'heart', killerFrienz, awardAbsolutes['heart']) --the extra points is for id purpose. Will deduct later
			end
		elseif ud.name == "tc_pitt" then
			AddAwardPoints( 'sweeper', killerTeam, 1 )
		else
			--
		end
	end
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID,
		attackerID, attackerDefID, attackerTeam)
		
	if (unitTeam == gaiaTeamID) then return end
	local hp, maxHP = spGetUnitHealth(unitID)
	if (hp < 0) then
		damage = damage + hp
	end
	AddAwardPoints( 'ouch', unitTeam, damage )
	totalDamage = (totalDamage + damage) or 0
	
	if (not attackerTeam) or (attackerTeam == unitTeam) or (attackerTeam == gaiaTeamID) then return end

	local ud = UnitDefs[unitDefID]
	local costdamage = (damage / maxHP) * GetUnitCost(unitID, unitDefID)

	if spAreTeamsAllied(attackerTeam, unitTeam) then
		if not paralyzer then
			AddAwardPoints( 'friend', attackerTeam, costdamage )
		end
	else
		if paralyzer then
			AddAwardPoints( 'emp', attackerTeam, costdamage )
		else
			
			AddAwardPoints( 'pwn', attackerTeam, damage )
			
			if ud.name == "tc_dragonqueen" then
				AddAwardPoints( 'heart', attackerTeam, damage )
			end
			

			if (flamerWeaponDefs[weaponID]) then
				AddAwardPoints( 'fire', attackerTeam, costdamage )
			end


			local ad = UnitDefs[attackerDefID]		
			if IsAHero[attackerDefID] then
				AddAwardPoints( 'hero', attackerTeam, costdamage )
			elseif staticO_big[attackerDefID] then
					AddAwardPoints( 'nux', attackerTeam, costdamage )
			elseif staticO_small[attackerDefID] then
				AddAwardPoints( 'shell', attackerTeam, costdamage )
			elseif kamikaze[attackerDefID] then
				AddAwardPoints( 'kam', attackerTeam, costdamage )
			elseif hoverunits[attackerDefID] then
				AddAwardPoints( 'hover', attackerTeam, costdamage )
			elseif dranUnits[attackerDefID] then
				AddAwardPoints( 'dran', attackerTeam, costdamage )
			elseif ad.canFly and not (ad.customParams.dontcount or ad.customParams.is_drone) then
				AddAwardPoints( 'air', attackerTeam, costdamage )				
				
			end
		end
	end
end

function gadget:UnitFinished(unitID, unitDefID, teamID)
	if unitDefID == mexDefID then
		AddAwardPoints( 'mex', teamID, 1 )
	end
end

function gadget:GameFrame(n)

	if not spIsGameOver() then return end

	if not sentAwards then
		local units = spGetAllUnits()
		for i=1,#units do
			local unitID = units[i]
			local teamID = spGetUnitTeam(unitID)
			local unitDefID = spGetUnitDefID(unitID)
			gadget:UnitDestroyed(unitID, unitDefID, teamID)
		end

		ProcessAwardData()

		_G.awardList = awardList
		
		---- GENERATE MESSAGE FOR REPLAYS
		for teamID,awards in pairs(awardListForReplay) do
			-- local _,leader,isDead,isAI,_,allyTeamID = Spring.GetTeamInfo(teamID)
			local SendToReplay = table.concat({CURSED_AWARDMARKER,"-",teamID})

			local playerHasAward = false
			for awardType, record in pairs(awards) do
				playerHasAward = true
			end
			if playerHasAward then
				for awardType, record in pairs(awards) do
					SendToReplay = table.concat({SendToReplay,":",awardType,"/",record})
				end
			end
			-- Spring.Echo(SendToReplay)
			Spring.SendLuaRulesMsg(SendToReplay)
		end
		
		sentAwards = true
	end
end --GameFrame

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
else -- UNSYNCED
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local gameOver = false
local teamNames     = {}
local awardList
local awardListForReplay

function gadget:Initialize()
	local tempTeamList = Spring.GetTeamList()
	for i=1, #tempTeamList do
		local team = tempTeamList[i]
		--Spring.Echo('team', team)
		if team ~= gaiaTeamID then
			totalTeamList[team] = team
		end
	end

	for _,team in pairs(totalTeamList) do
		local _, leaderPlayerID, _, isAI = spGetTeamInfo(team)
		local name
		if isAI then
			local _, aiName, _, shortName = Spring.GetAIInfo(team)
			name = aiName ..' ('.. shortName .. ')'
		else
			name = Spring.GetPlayerInfo(leaderPlayerID)
		end
		teamNames[team] = name
	end
	
end

function gadget:GameOver()
	gameOver = true
	--Spring.Echo("Game over (awards unsynced)")
end

-- function to convert SYNCED table to regular table. assumes no self referential loops
local function ConvertToRegularTable(stable)
	local ret = {}
	local stableLocal = stable
	for k,v in spairs(stableLocal) do
		if type(v) == 'table' then
			v = ConvertToRegularTable(v)
		end
		ret[k] = v
	end
	return ret
end

function gadget:Update()
	if not gameOver then
		return
	end
	if (not awardList) and SYNCED.awardList then
		awardList = ConvertToRegularTable( SYNCED.awardList )
		Script.LuaUI.SetAwardList( awardList )
	end
end

--unsynced
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
end
