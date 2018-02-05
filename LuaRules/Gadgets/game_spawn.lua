--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    game_spawn.lua
--  brief:   spawns start unit and sets storage levels
--  author:  Tobi Vollebregt
--
--  Copyright (C) 2010.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
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

local Gaia = Spring.GetGaiaTeamID
local modOptions = Spring.GetModOptions()
local cheatAItype = "0"
local cpvmode = false
local cpvstartbase = false
local luaSetStartPositions = {}
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
	GG.teamside = GG.teamside or {}
	
	local teams = Spring.GetTeamList()
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= Gaia) then
			local side = select(5, Spring.GetTeamInfo(teamID))
			if (side ~= "imperials" and side ~= "cursed") then
				if (math.random() > 0.5) then
					side = "imperials"
				else
					side = "cursed"
				end
			end
			GG.teamside[teamID] = side
			Spring.SetTeamRulesParam(teamID, "side", side, {allied=true, public=false}) 
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

	local code = string.sub(msg,1,1)
	if code ~= '\138' then
		return
	end
	local side = string.sub(msg,2,string.len(msg))
	-- Spring.Echo("start Faction:")
	-- Spring.Echo(side)
	
	local _, _, playerIsSpec, playerTeam = Spring.GetPlayerInfo(playerID)
	if not playerIsSpec then
		GG.teamside[playerTeam] = side
		Spring.SetTeamRulesParam(playerTeam, "side", side, {allied=true, public=false}) -- visible to allies only, set visible to all on GameStart
		side = select(5, Spring.GetTeamInfo(playerTeam))
		return true
	end
end


----------------------------------------------------------------

local function getMiddleOfStartBox(teamID)
	local x = Game.mapSizeX / 2
	local z = Game.mapSizeZ / 2

	local boxID = Spring.GetTeamRulesParam(teamID, "start_box_id")
	if boxID then
		local startposList = GG.startBoxConfig[boxID] and GG.startBoxConfig[boxID].startpoints
		if startposList then
			local startpos = startposList[1] -- todo: distribute afkers over them all instead of always using the 1st
			x = startpos[1]
			z = startpos[2]
		end
	else -- using middle of lobby pre-defined box
		local allyID = select(6, Spring.GetTeamInfo(teamID))
		local a,b,c,d = Spring.GetAllyTeamStartBox(allyID)
		x = (a+c)/2
		z = (b+d)/2
	end

	return x, Spring.GetGroundHeight(x,z), z
end

local function GetStartPos(teamID, teamInfo, isAI)
	if luaSetStartPositions[teamID] then
		return luaSetStartPositions[teamID].x, luaSetStartPositions[teamID].y, luaSetStartPositions[teamID].z
	end
	
	if fixedStartPos then
		local x, y, z
		if teamInfo then
			x, z = tonumber(teamInfo.start_x), tonumber(teamInfo.start_z)
		end
		if x then
			y = Spring.GetGroundHeight(x, z)
		else
			x, y, z = Spring.GetTeamStartPosition(teamID)
		end
		return x, y, z
	end
	
	if not (Spring.GetTeamRulesParam(teamID, "valid_startpos") or isAI) then
		local x, y, z = getMiddleOfStartBox(teamID)
		return x, y, z
	end
	
	local x, y, z = Spring.GetTeamStartPosition(teamID)
	-- clamp invalid positions
	-- AIs can place them -- remove this once AIs are able to be filtered through AllowStartPosition
	local boxID = isAI and Spring.GetTeamRulesParam(teamID, "start_box_id")
	if boxID and not GG.CheckStartbox(boxID, x, z) then
		x,y,z = getMiddleOfStartBox(teamID)
	end
	return x, y, z
end

local function SetStartLocation(teamID, x, z)
    luaSetStartPositions[teamID] = {x = x, y = Spring.GetGroundHeight(x,z), z = z}
end
GG.SetStartLocation = SetStartLocation

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
--	local side = select(5, Spring.GetTeamInfo(teamID))
	local side = GG.teamside[teamID] or "cursed"
	local ai = select(4, Spring.GetTeamInfo(teamID))
	local teamInfo = teamID and select(7, Spring.GetTeamInfo(teamID))
	local IsChickenAI = false
	if (ai and ChickenAIs[Spring.GetTeamLuaAI(teamID)]) then
		IsChickenAI = true
	end

	local x,y,z = Spring.GetTeamStartPosition(teamID)
	
	-- startPosType 0 = fixed / 1 = random / 2 = choose in game / 3 = choose before game (on map)
	if (Game.startPosType ~= 3) and (Spring.GetTeamRulesParam(teamID, "valid_startpos") ~= 2) then  --> Start Boxes active
		x,y,z = GetStartPos(teamID, teamInfo, ai)
	elseif	ai then
		x,y,z = getMiddleOfStartBox(teamID)
	end

	if Spring.GetModOptions().cheatingai ~= nil then
		cheatAItype = Spring.GetModOptions().cheatingai
	end 
	
--[[	if (side == "" or side == nil) then -- startscript didn't specify a side for this team, ramdomly pick one
		if (math.random() > 0.5) then
			side = "imperials"
		else
			side = "cursed"
		end
	end
	GG.teamside = side ]]
	
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
	local testbox = Spring.CreateFeature("uselessbox", x, y, z, math.random(3), teamID)
end

local function SetStartingResources(teamID)
	-- set start resources, either from mod options or custom team keys
	local teamOptions = select(7, Spring.GetTeamInfo(teamID))
	local m = modOptions.startmetal or teamOptions.startmetal or 1000
	local e = modOptions.startenergy or teamOptions.startenergy or 2000
	-- using SetTeamResource to get rid of any existing resource without affecting stats
	-- using AddTeamResource to add starting resource and counting it as income
	if (m and tonumber(m) ~= 0) then
		-- remove the pre-existing storage
		--   must be done after the start unit is spawned,
		--   otherwise the starting resources are lost!
		Spring.SetTeamResource(teamID, "ms", tonumber(m))
		Spring.SetTeamResource(teamID, "m", 0)
		Spring.AddTeamResource(teamID, "m", tonumber(m))
	end
	if (e and tonumber(e) ~= 0) then
		-- remove the pre-existing storage
		--   must be done after the start unit is spawned,
		--   otherwise the starting resources are lost!
		Spring.SetTeamResource(teamID, "es", tonumber(e))
		Spring.SetTeamResource(teamID, "e", 0)
		Spring.AddTeamResource(teamID, "e", tonumber(e))
	end
end

function gadget:GameStart()
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local teams = Spring.GetTeamList()
			
	for i = 1,#teams do
		local teamID = teams[i]
		-- don't spawn a start unit for the Gaia team
		if (teamID ~= gaiaTeamID) then
			SpawnstartFaction(teamID)
			SetStartingResources(teamID)
		end
	end	
end
