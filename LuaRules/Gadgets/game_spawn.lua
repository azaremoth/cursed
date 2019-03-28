
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name      = "Spawn",
		desc      = "spawns start unit and sets storage levels",
		author    = "azaremoth",
		date      = "January, 2010",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true  --  loaded by default?
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end

local Gaia = Spring.GetGaiaTeamID()
local gaiaAllyTeamID = select(6, Spring.GetTeamInfo(Spring.GetGaiaTeamID()))
local allyTeamsHaveBoxes = true
local teamsHavePos = true
local modOptions = Spring.GetModOptions()
local campaignBattleID = modOptions.singleplayercampaignbattleid
local cheatAItype = "0"
local cpvmode = false
local cpvstartbase = false
local luaSetStartPositions = {}
local alliedTeamsCount = {}
local teamOrderStartBox = {}
local MsgStartFaction = '^\138(%d+)$'
	
local ChickenAIs = VFS.Include("LuaRules/Configs/ai_chickenlist.lua")	

-- Spring.Echo("CPV mode " .. Spring.GetModOptions().scoremode)
-- Spring.Echo("CPV mode " .. Spring.GetModOptions().startbase)

if (Spring.GetModOptions().scoremode ~= nil) then
	if (Spring.GetModOptions().scoremode ~= "disabled") then
		cpvmode = true
	end
end

if (cpvmode and Spring.GetModOptions().startbase ~= nil) then
	if (Spring.GetModOptions().startbase == "1") then
		cpvstartbase = true
	else
		cpvstartbase = false
	end
end

function gadget:Initialize()
	local teams = Spring.GetTeamList()
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= Gaia) then
			local allyteamID = select(6, Spring.GetTeamInfo(teamID))
			if (alliedTeamsCount[allyteamID] ~= nil) then
				alliedTeamsCount[allyteamID] = (alliedTeamsCount[allyteamID] + 1)
			else
				alliedTeamsCount[allyteamID] = 1
			end
			teamOrderStartBox[teamID] = alliedTeamsCount[allyteamID]
		end
	end	
end

----------------------------------------------------------------
-- LuaUI Interaction
----------------------------------------------------------------

function gadget:RecvLuaMsg(msg, playerID)
	-- these messages are only useful during pre-game placement
	if Spring.GetGameFrame() > 0 then
		return false
	end

	local _, _, playerIsSpec, playerTeam = Spring.GetPlayerInfo(playerID)	
	local side = GG.teamside[playerTeam]
	
	local code = string.sub(msg,1,1)
	if code == '\138' then
		side = string.sub(msg,2,string.len(msg))
	end
	-- Spring.Echo("start Faction:")
	-- Spring.Echo(side)

	if not playerIsSpec then
		GG.teamside[playerTeam] = side
		Spring.SetTeamRulesParam(playerTeam, "side", side, {allied=true, public=false}) -- visible to allies only, set visible to all on GameStart
		return true
	end
end


----------------------------------------------------------------
local function CheckValidStartPositions()
	-- startPosType 0 = fixed / 1 = random / 2 = choose in game / 3 = choose before game (on map)
	Spring.Echo ("StartPosType is " .. Game.startPosType)

	if (Game.startPosType == 2) then
		local allyTeamList = Spring.GetAllyTeamList()
		for _,allyID in pairs(allyTeamList) do
			if (allyID ~= gaiaAllyTeamID) then
				local x1,z1,x2,z2 = Spring.GetAllyTeamStartBox(allyID)
				local mx = Game.mapSizeX
				local mz = Game.mapSizeZ
					
				if (allyTeamsHaveBoxes == true) then
					if ((x1 == nil) or ((x1+x2) == 0) or (x1 == 0 and x2 == mx and z1 == 0 and z2 == mz)) then
						allyTeamsHaveBoxes = false
					end
				end
			end
		end
		if (allyTeamsHaveBoxes == true) then -- set startpostion as valid for unit spawner. This is also checked by the widgets
			for _,team in ipairs(Spring.GetTeamList()) do
				if (team ~= nil and team ~= Gaia) then
					Spring.SetTeamRulesParam (team, "valid_startpos", 2) -- "2" valid, set by start boxes but not by the startbox gadget
				end
			end
			Spring.Echo ("StartBoxes is correctly predefined in lobby! Thus these are used!")
			return true
		end
		return false
	-- elseif (Game.startPosType == nil) or (Game.startPosType == 3) then -- startPos is nil or start positions are 0,0 may happen. In that case the gadget should also start. FOr random and fixed  the position returned is always 0
	else
		for _,team in ipairs(Spring.GetTeamList()) do
		--	local x,y,z = Spring.GetTeamStartPosition(team)
		--	Spring.Echo("team")
		--	Spring.Echo(team)
		--	Spring.Echo(x)
		--	Spring.Echo(z)

			if (team ~= Gaia) then
				local x,y,z = Spring.GetTeamStartPosition(team)
				if ((x == nil) or (z == nil) or ((x == 0) and (z == 0))) then
					teamsHavePos = false
				end
			end
		end
		if (teamsHavePos == true) then -- set startpostion as valid for unit spawner.
			for _,team in ipairs(Spring.GetTeamList()) do
				if (team ~= nil and team ~= Gaia) then
					Spring.SetTeamRulesParam (team, "valid_startpos", 2) -- "2" valid, set by start boxes but not by the startbox gadget
				end
			end
			return true
		end
		return false
	end
end


local function getPositionInStartBox(teamID)
	local x = Game.mapSizeX / 2
	local z = Game.mapSizeZ / 2

	local boxID = Spring.GetTeamRulesParam(teamID, "start_box_id")
	if boxID then
		local startposList = GG.startBoxConfig[boxID] and GG.startBoxConfig[boxID].startpoints
		if startposList then
			local teamPositionInBox = teamOrderStartBox[teamID]
			local startpos = startposList[teamPositionInBox] or startposList[1]
			x = startpos[1]
			z = startpos[2]
		end
	else -- using middle of lobby pre-defined box, respective spread teams over range of box
		local allyID = select(6, Spring.GetTeamInfo(teamID))
		local teamsInBox = alliedTeamsCount[allyID]
		local teamPositionInBox = teamOrderStartBox[teamID]
		local a,b,c,d = Spring.GetAllyTeamStartBox(allyID)
		
		if ((c-a) > (d-b)) then
			x = (a+((c-a)/(teamsInBox+1))*teamPositionInBox)
			z = (b+d)/2			
		else
			x = (a+c)/2
			z = (b+((d-b)/(teamsInBox+1))*teamPositionInBox)	
		end
	end

	return x, Spring.GetGroundHeight(x,z), z
end

local function GetStartPos(teamID, teamInfo, isAI)

	local startPosValid = Spring.GetTeamRulesParam(teamID, "valid_startpos")

	if ((startPosValid == nil) or (startPosValid == 2)) then
		if not isAI then
			local x, y, z = getPositionInStartBox(teamID)
			return x, y, z
		end
	end
	
	local x, y, z = Spring.GetTeamStartPosition(teamID)

	local boxID = isAI and Spring.GetTeamRulesParam(teamID, "start_box_id")
	if boxID and not GG.CheckStartbox(boxID, x, z) then
		x,y,z = getPositionInStartBox(teamID)
	end
	return x, y, z
end

---- Chicken Spawns -------------------------------------------
local function SpawnChicken (teamID, x, y, z)
	local zero = Spring.CreateUnit("tc_cursedhand_survival", x-50,y,z+50, math.random(3), teamID)
	local one = Spring.CreateUnit("tc_cursedhand_survival", x+100,y,z-100, math.random(3), teamID)	
end

---- Cursed Spawns -------------------------------------------
local function SpawnBaseCursed (teamID, x, y, z)
	local zero = Spring.CreateUnit("tc_heart_ai", x,y,z, math.random(3), teamID)
	local one = Spring.CreateUnit("tc_defender", x+160,y,z+200, math.random(3), teamID)
	local two = Spring.CreateUnit("tc_defender", x-180,y,z-170, math.random(3), teamID)		
	local three= Spring.CreateUnit("tc_defender", x+180,y,z-210, math.random(3), teamID)
	local four= Spring.CreateUnit("tc_defender", x-200,y,z+160, math.random(3), teamID)
	local six= Spring.CreateUnit("tc_defender", x-225,y,z-20, math.random(3), teamID)
	local seven= Spring.CreateUnit("tc_defender", x+230,y,z, math.random(3), teamID)
end

local function SpawnUnitsCursed (teamID, x, y, z)
	local ghoul = Spring.CreateUnit("tc_ghoul", x-30, y, z-70, math.random(3), teamID)
	local gunner = Spring.CreateUnit("tc_gunner", x+110, y, z-50, math.random(3), teamID)
	local witch = Spring.CreateUnit("tc_witch", x, y, z+70, math.random(3), teamID)	
	local hero = Spring.CreateUnit("tc_shade_lvl1", x-80, y, z, math.random(3), teamID)	
end

local function SpawnBuildersCursed (teamID, x, y, z)
	local builder1 = Spring.CreateUnit("tc_obelisk", x+90,y,z, math.random(3), teamID)
	local builder2 = Spring.CreateUnit("tc_necromancer", x+60,y,z+60, math.random(3), teamID)
end

local function SpawnAIBuildersCursed (teamID, x, y, z)
	local builder1 = Spring.CreateUnit("tc_restless", x+150,y,z, math.random(3), teamID)			
	local builder2 = Spring.CreateUnit("tc_restless", x-150,y,z, math.random(3), teamID)
end

---- Imperial Spawns -------------------------------------------
local function SpawnBaseImperials (teamID, x, y, z)
	local zero = Spring.CreateUnit("euf_techcenter_shield_ai", x,y,z,  math.random(3), teamID)
	local one = Spring.CreateUnit("euf_plasmatower", x+250,y,z+250,  math.random(3), teamID)
	local two = Spring.CreateUnit("euf_plasmatower", x-250,y,z-250,  math.random(3), teamID)
	local three= Spring.CreateUnit("euf_plasmatower", x+250,y,z-250,  math.random(3), teamID)
	local four= Spring.CreateUnit("euf_plasmatower", x-250,y,z+250,  math.random(3), teamID)
	local five= Spring.CreateUnit("euf_aatower", x-200,y,z,  math.random(3), teamID)
	local six= Spring.CreateUnit("euf_aatower", x+200,y,z,  math.random(3), teamID)
end

local function SpawnUnitsImperials (teamID, x, y, z)
	local marine = Spring.CreateUnit("euf_marine", x-130, y, z, 0, teamID)
	local marine2 = Spring.CreateUnit("euf_marine", x-100, y, z, 0, teamID)
	local sniper = Spring.CreateUnit("euf_sniper", x-130, y, z-30, 0, teamID)
	local priest = Spring.CreateUnit("euf_priest", x-100, y, z-30, 0, teamID)
	local hero = Spring.CreateUnit("euf_sarge_lvl1", x-115, y, z+60, 2, teamID)
end

local function SpawnBuildersImperials (teamID, x, y, z)
	local builder1 = Spring.CreateUnit("euf_constructor", x+80, y, z-90, math.random(3), teamID)
	local builder2 = Spring.CreateUnit("euf_constructor", x, y, z+90, math.random(3), teamID)
end

local function SpawnAIBuildersImperials (teamID, x, y, z)
	local builder1 = Spring.CreateUnit("euf_constructor_ai", x, y, z-130, math.random(3), teamID)
	local builder2 = Spring.CreateUnit("euf_constructor_ai", x, y, z+130, math.random(3), teamID)
end

----------------------------------------------------------------


local function SpawnstartFaction(teamID)
	-- get the team startup info
	local side = GG.teamside[teamID] or "imperials"
	local ai = select(4, Spring.GetTeamInfo(teamID))
	local teamInfo = teamID and select(7, Spring.GetTeamInfo(teamID))
	local IsChickenAI = false
	if (ai and ChickenAIs[Spring.GetTeamLuaAI(teamID)]) then
		IsChickenAI = true
	end

	local startPosIsFine = CheckValidStartPositions() -- Check if positions are set right

	local x = Game.mapSizeX / 2
	local z = Game.mapSizeZ / 2
	local y = Spring.GetGroundHeight(x,z)
	
	if (startPosIsFine == true) then
		x,y,z = Spring.GetTeamStartPosition(teamID)
	else
		x,y,z = GetStartPos(teamID, teamInfo, ai)
	end
	
	if	(ai and Game.startPosType == 2) then -- AIs are not able to choose starting position in boxes
		x,y,z = getPositionInStartBox(teamID)
	end


	if Spring.GetModOptions().cheatingai ~= nil then
		cheatAItype = Spring.GetModOptions().cheatingai
	end 
	
	if (IsChickenAI) then
		SpawnChicken (teamID, x, y, z)				
	else
		if (side == "imperials") then
			SpawnUnitsImperials (teamID, x, y, z)
			if ((cpvstartbase == true) or ((ai == true) and (team ~= Gaia) and (cheatAItype == "1"))) then
				SpawnBaseImperials (teamID, x, y, z)
			end
			if ((ai == true) and (team ~= Gaia)) then
				SpawnAIBuildersImperials (teamID, x, y, z)
			else
				SpawnBuildersImperials (teamID, x, y, z)
			end	
	
		else
			SpawnUnitsCursed (teamID, x, y, z)
			if ((cpvstartbase == true) or ((ai == true) and (team ~= Gaia) and (cheatAItype == "1"))) then
				SpawnBaseCursed (teamID, x, y, z)
			end
			if ((ai == true) and (team ~= Gaia)) then
				SpawnAIBuildersCursed (teamID, x, y, z)
			else
				SpawnBuildersCursed (teamID, x, y, z)
			end	
		end
	end
--	local testbox = Spring.CreateFeature("uselessbox", x, y, z, math.random(3), teamID)
end

local function SetStartingResources(teamID)
	-- set start resources, either from mod options or custom team keys
	local teamOptions = select(7, Spring.GetTeamInfo(teamID))
	local m = modOptions.startmetal or teamOptions.startmetal or 1000
	local e = modOptions.startenergy or teamOptions.startenergy or 1000
	if campaignBattleID then
		local customKeys = select(7, Spring.GetTeamInfo(teamID))
		local campaignStartmetal = customKeys.start_metal
		if campaignStartmetal then
			m = campaignStartmetal
		end
		local campaignStartenergy = customKeys.start_energy
		if campaignStartenergy then
			e = campaignStartenergy
		end
	end
	-- using SetTeamResource to get rid of any existing resource without affecting stats
	-- using AddTeamResource to add starting resource and counting it as income
	if (m and tonumber(m) ~= 0) then
		-- remove the pre-existing storage
		--   must be done after the start unit is spawned,
		--   otherwise the starting resources are lost!
		Spring.SetTeamResource(teamID, "ms", tonumber(m))
		Spring.SetTeamResource(teamID, "m", 0)
		Spring.AddTeamResource(teamID, "m", tonumber(m))
	else
		Spring.SetTeamResource(teamID, "ms", 100)
		Spring.SetTeamResource(teamID, "m", 0)
		Spring.AddTeamResource(teamID, "m", 0)
	end
	if (e and tonumber(e) ~= 0) then
		-- remove the pre-existing storage
		--   must be done after the start unit is spawned,
		--   otherwise the starting resources are lost!
		Spring.SetTeamResource(teamID, "es", tonumber(e))
		Spring.SetTeamResource(teamID, "e", 0)
		Spring.AddTeamResource(teamID, "e", tonumber(e))
	else
		Spring.SetTeamResource(teamID, "es", 100)
		Spring.SetTeamResource(teamID, "e", 0)
		Spring.AddTeamResource(teamID, "e", 0)	
	end
end

function gadget:GameStart()
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local teams = Spring.GetTeamList()
			
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= gaiaTeamID) then
			if not campaignBattleID then
				SpawnstartFaction(teamID)
			end
			SetStartingResources(teamID)
		end
	end	
end