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
		author    = "Tobi Vollebregt",
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
ChickenAIs = 
{
	["Zombie Survival: Very Easy"] = true,
	["Zombie Survival: Easy"] = true,	
	["Zombie Survival: Normal"] = true,	
	["Zombie Survival: Hard"] = true,
	["Zombie Survival: Suicidal"] = true,
	["Zombie Survival: Custom"] = true,
}

local function GetStartUnit(teamID)
	-- get the team startup info
	local side = select(5, Spring.GetTeamInfo(teamID))
	local ai = select(4, Spring.GetTeamInfo(teamID))
	local IsChickenAI = false
	if (ai and ChickenAIs[Spring.GetTeamLuaAI(teamID)]) then
		IsChickenAI = true
	end
	local startUnit
	local x,y,z = Spring.GetTeamStartPosition(teamID)
	local type = "std"
	type = Spring.GetModOptions().comm
	cheatAItype = "1"
	cheatAItype = Spring.GetModOptions().cheatingai
	
	if (side == "") then
		-- startscript didn't specify a side for this team
		local sidedata = Spring.GetSideData()
		if (sidedata and #sidedata > 0) then
			startUnit = sidedata[1 + teamID % #sidedata].startUnit
		end
	else
		startUnit = Spring.GetSideData(side)
	end
	if (IsChickenAI) then
		local heading = math.random(3)
		local zero = Spring.CreateUnit("tc_cursedhand_survival", x-50,y,z+50, heading, teamID)
		local heading = math.random(3)		
		local one = Spring.CreateUnit("tc_defender_survival", x+50,y,z-50, heading, teamID)					
	else
		if (side == "imperials") then	
			local heading = math.random(3)
			local sniper = Spring.CreateUnit("euf_sniper", x-40, y, z+40, heading, teamID)
			local heading = math.random(3)			
			local priest = Spring.CreateUnit("euf_priest", x, y, z-50, heading, teamID)
			local heading = math.random(3)
			local marine = Spring.CreateUnit("euf_marine", x, y, z+60, heading, teamID)
			local heading = math.random(3)
			local marine2 = Spring.CreateUnit("euf_marine", x+40, y, z+40, heading, teamID)			
			local heading = math.random(3)
			local hero = Spring.CreateUnit("euf_sarge_lvl1", x-60, y, z-40, heading, teamID)			
			if ai == true and team ~= Gaia and type ~= "feature" then
				local heading = math.random(3)
				local builder1 = Spring.CreateUnit("euf_constructor_ai", x, y, z, heading, teamID)			
				if cheatAItype == "1" then
					local zero = Spring.CreateUnit("euf_techcenter_shield_ai", x,y,z+150, heading, teamID)
					local one = Spring.CreateUnit("euf_plasmatower", x+250,y,z+250, heading, teamID)
					local two = Spring.CreateUnit("euf_plasmatower", x-250,y,z-250, heading, teamID)
					local three= Spring.CreateUnit("euf_plasmatower", x+250,y,z-250, heading, teamID)
					local four= Spring.CreateUnit("euf_plasmatower", x-250,y,z+250, heading, teamID)
					local five= Spring.CreateUnit("euf_aatower", x-200,y,z, heading, teamID)
					local six= Spring.CreateUnit("euf_aatower", x+200,y,z, heading, teamID)
					local seven= Spring.CreateUnit("euf_constructor_ai", x,y,z-150, 1, teamID)
				end
			else
				local heading = math.random(3)
				local builder1 = Spring.CreateUnit("euf_constructor", x, y, z, heading, teamID)
			end
		else
			if ai == true and team ~= Gaia and type ~= "feature" then
				local heading = math.random(3)
				local hero = Spring.CreateUnit("tc_shade_lvl1", x-60, y, z-60, heading, teamID)					
				if cheatAItype == "1" then
					local heading = math.random(3)		
					local zero = Spring.CreateUnit("tc_heart_ai", x,y,z, heading, teamID)
					local one = Spring.CreateUnit("tc_defender", x+180,y,z+200, heading, teamID)
					local two = Spring.CreateUnit("tc_defender", x-200,y,z-170, heading, teamID)
					local three= Spring.CreateUnit("tc_defender", x+200,y,z-210, heading, teamID)
					local four= Spring.CreateUnit("tc_defender", x-220,y,z+160, heading, teamID)
					local five= Spring.CreateUnit("tc_restless", x+150,y,z, heading, teamID)
					local six= Spring.CreateUnit("tc_enforcer", x-75,y,z, 4, teamID)
					local seven= Spring.CreateUnit("tc_gunner", x,y,z+75, 1, teamID)
					local eight= Spring.CreateUnit("tc_restless", x,y,z-125, 1, teamID)
					local nine= Spring.CreateUnit("tc_skeleton", x,y,z+100, 1, teamID)
					local ten= Spring.CreateUnit("tc_witch_shield", x+220,y,z, 1, teamID)
					local eleven= Spring.CreateUnit("tc_witch_shield", x-220,y,z, 1, teamID)
				else
					local heading = math.random(3)				
					local one= Spring.CreateUnit("tc_restless", x-50,y,z, heading, teamID)
					local two= Spring.CreateUnit("tc_mage", x+50,y,z, heading, teamID)
					local three= Spring.CreateUnit("tc_gunner", x,y,z-50, heading, teamID)
					local four= Spring.CreateUnit("tc_ghoul", x,y,z+50, heading, teamID)
				end
			else
				local heading = math.random(3)
				local obelisk = Spring.CreateUnit("tc_obelisk", x, y, z, heading, teamID)
				local heading = math.random(3)
				local ghoul = Spring.CreateUnit("tc_ghoul", x-60, y, z+40, heading, teamID)
				local heading = math.random(3)
				local gunner = Spring.CreateUnit("tc_gunner", x, y, z+60, heading, teamID)
				local heading = math.random(3)
				local hero = Spring.CreateUnit("tc_shade_lvl1", x-50, y, z-40, heading, teamID)
				local heading = math.random(3)
				local necrmancer = Spring.CreateUnit("tc_necromancer", x+40, y, z+60, heading, teamID)
				local heading = math.random(3)				
				local witch = Spring.CreateUnit("tc_witch", x, y, z-50, heading, teamID)				
			end
		end
	end
end

local function SpawnStartUnit(teamID)
	local startUnit = GetStartUnit(teamID)
	if (startUnit and startUnit ~= "") then
		-- spawn the specified start unit
		local x,y,z = Spring.GetTeamStartPosition(teamID)
		-- snap to 16x16 grid
		x, z = 16*math.floor((x+8)/16), 16*math.floor((z+8)/16)
		y = Spring.GetGroundHeight(x, z)
		-- facing toward map center
		local facing=math.abs(Game.mapSizeX/2 - x) > math.abs(Game.mapSizeZ/2 - z)
			and ((x>Game.mapSizeX/2) and "west" or "east")
			or ((z>Game.mapSizeZ/2) and "north" or "south")
		local unitID = Spring.CreateUnit(startUnit, x, y, z, facing, teamID)
		-- set the *team's* lineage root
		Spring.SetUnitLineage(unitID, teamID, true)
	end

	-- set start resources, either from mod options or custom team keys
	local teamOptions = select(7, Spring.GetTeamInfo(teamID))
	local m = teamOptions.startmetal  or modOptions.startmetal  or 1000
	local e = teamOptions.startenergy or modOptions.startenergy or 1000

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

local function SpawnFeaturePlacerStartUnit(teamID)
	local x,y,z = Spring.GetTeamStartPosition(teamID)
	local teamOptions = select(7, Spring.GetTeamInfo(teamID))
	local m = 1000000000000
	local e = 1000000000000
				local newUnit = Spring.CreateUnit("goldtree",x,y,z,0,teamID)
				local newUnit = Spring.CreateUnit("euf_constructor",x-80,y,z-80,0,teamID)
				local newUnit = Spring.CreateUnit("tc_necromancer",x+80,y,z+80,0,teamID)		
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
	
	local type = "std"
	type = Spring.GetModOptions().comm
		
	if (type == "sandbox" or type == "feature") then
		for i = 1,#teams do
			local teamID = teams[i]
			-- don't spawn a start unit for the Gaia team
			if (teamID ~= gaiaTeamID) then
				SpawnFeaturePlacerStartUnit(teamID)
			end
		end
	else
		for i = 1,#teams do
			local teamID = teams[i]
			-- don't spawn a start unit for the Gaia team
			if (teamID ~= gaiaTeamID) then
				SpawnStartUnit(teamID)
			end
		end	
	end
end
