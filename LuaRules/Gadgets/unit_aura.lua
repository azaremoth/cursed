--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
   return {
      name      = "Aura",
      desc      = "Give certain units an aura that affects units around them.",
      author    = "CarRepairer",
      date      = "2009-07-01",
      license   = "GNU GPL, v2 or later",
      layer     = 0,
      enabled   = true, 
   }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--SYNCED
if gadgetHandler:IsSyncedCode() then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local spGetUnitDefID        	= Spring.GetUnitDefID
local spAreUnitsAllied        	= Spring.AreUnitsAllied
local spGetUnitTeam        		= Spring.GetUnitTeam
local spSetUnitRulesParam  		= Spring.SetUnitRulesParam
local spGetUnitRulesParam  		= Spring.GetUnitRulesParam
local spGetUnitHealth  			= Spring.GetUnitHealth
local spSetUnitHealth  			= Spring.SetUnitHealth
local spGetUnitStates  			= Spring.GetUnitStates

local spSetUnitWeaponState  = Spring.SetUnitWeaponState

local spGetUnitsInCylinder 	= Spring.GetUnitsInCylinder
local spGetUnitPosition 	= Spring.GetUnitPosition

local spSpawnCEG 				= Spring.SpawnCEG

local random	= math.random
local echo = Spring.Echo

if not GG.attUnits then
	GG.attUnits = {}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local auraDefs = {
	['Hero Aura'] = {
		unittypes = {
			[UnitDefNames['euf_sarge_lvl1'].id] = 350,
			[UnitDefNames['euf_sarge_lvl2'].id] = 350,
			[UnitDefNames['euf_sarge_lvl3'].id] = 350,
			[UnitDefNames['euf_sarge_lvl4'].id] = 350,
			[UnitDefNames['euf_sarge_lvl5'].id] = 350,
			[UnitDefNames['tc_shade_lvl1'].id] = 350,
			[UnitDefNames['tc_shade_lvl2'].id] = 350,
			[UnitDefNames['tc_shade_lvl3'].id] = 350,
			[UnitDefNames['tc_shade_lvl4'].id] = 350,
			[UnitDefNames['tc_shade_lvl5'].id] = 350,			
		},
		ally = true,
		enemy = false,
--		aceg = 'AURA_HERO_CASTING',
		ceg = 'AURA_HERO',
		encName= 'Hero Aura',
	},
	['Frenzy Aura'] = {
		unittypes = {
			[UnitDefNames['tc_lich'].id] = 250,
			[UnitDefNames['tc_lich_sum'].id] = 250,
		},
		ally = true,
		enemy = false,
--		aceg = 'AURA_FRENZY_CASTING',
		ceg = 'AURA_FRENZY',	
--		req = UnitDefNames['tc_totem_red'].id,
		encName= 'Frenzy Aura',
	},
	['Heal Aura'] = {
		unittypes = {
			[UnitDefNames['tc_witch'].id] = 250,
			[UnitDefNames['tc_witch_shield'].id] = 250,
		},
		ally = true,
		enemy = false,
--		aceg = 'AURA_HEAL_CASTING',
		ceg = 'AURA_HEAL',	
--		req = UnitDefNames['tc_totem_purple'].id,
		encName= 'Regeneration Aura',
	},
	['Focus Aura'] = {
		unittypes = {
			[UnitDefNames['euf_priest'].id] = 250,
		},
		ally = true,
		enemy = false,		
--		aceg = 'AURA_FOCUS_CASTING',
		ceg = 'NULL',	
--		req = UnitDefNames['euf_church'].id,
		encName= 'Focus Aura',
	},
	['Fear Aura'] = {
		unittypes = {
			[UnitDefNames['euf_paladin'].id] = 150,		
			[UnitDefNames['euf_paladin_ai'].id] = 150,				
		},
		ally = false,
		enemy = true,		
--		aceg = 'AURA_CURSE_CASTING',
		ceg = 'NULL',
--		req = UnitDefNames['euf_sanctum'].id,
		encName= 'Cursed Aura',
	},
	['Pest Aura'] = {
		unittypes = {
			[UnitDefNames['tc_pestilence'].id] = 500,
		},
		ally = false,
		enemy = true,	
		aceg = 'AURA_CURSE_CASTING',
		ceg = 'AURA_CURSE',
--		req = UnitDefNames['tc_totem_black'].id,
		encName= 'Pest Aura',
	},	
}

local auraUnits = {
	['Hero Aura'] = {},
	['Heal Aura'] = {},
	['Focus Aura'] = {},	
	['Frenzy Aura'] = {},
	['Pest Aura'] = {},		
	['Fear Aura'] = {},	
}
local auraUnitsByUnit = {}
local encUnits = {}
local reqs = {}

local function addAura(auraType, auraDef, unitID, unitDefID, teamID)
	auraUnits[auraType][unitID] = nil
	spSetUnitRulesParam(unitID,'has_'..auraType,0)
	if reqs[teamID][auraType] ~= 0 then
		local range = auraDef.unittypes[unitDefID]
		if range then
			auraUnits[auraType][unitID] = range
			spSetUnitRulesParam(unitID,'has_'..auraType,1)
			spSetUnitRulesParam(unitID,auraType..'_range',range)			
			GG.attUnits[unitID] = true
			encUnits[unitID] = true
		end
	end
	
end
			
local function updateAuraUnits(teamID)
	for _, unitID in ipairs(Spring.GetTeamUnits(teamID)) do
		local unitDefID = spGetUnitDefID(unitID)
		for auraType, auraDef in pairs(auraDefs) do
			addAura(auraType, auraDef, unitID, unitDefID, teamID)
		end
	end
end


function gadget:Initialize()
	local allTeams = Spring.GetTeamList()
	for _,team in ipairs(allTeams) do
		reqs[team] = reqs[team] or {}
		for auraType, auraDef in pairs(auraDefs) do
			if (auraDef.req == nil) then
				reqs[team][auraType] = 1
			else
				reqs[team][auraType] = 0
			end
		end
--		reqs[team]['Hero Aura'] = 1		
	end
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local teamID = spGetUnitTeam(unitID)
		local unitDefID = spGetUnitDefID(unitID)
		gadget:UnitFinished(unitID, unitDefID, teamID)
	end
end

function gadget:UnitFinished(unitID, unitDefID, teamID)
	for auraType, auraDef in pairs(auraDefs) do
		--echo (unitDefID, auraDef.req)
		if unitDefID == auraDef.req then
			reqs[teamID][auraType] = reqs[teamID][auraType] + 1
			if reqs[teamID][auraType] == 1 then
				updateAuraUnits(teamID)
			end
		end
		addAura(auraType, auraDef, unitID, unitDefID, teamID)
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	for auraType,auraDef in pairs(auraDefs) do
		if unitDefID == auraDef.req then
			reqs[teamID][auraType] = reqs[teamID][auraType] - 1
			if reqs[teamID][auraType] == 0 then
				updateAuraUnits(teamID)
			end
		end
		
		auraUnits[auraType][unitID] = nil
		spSetUnitRulesParam(unitID,'has_'..auraType,0)
		GG.attUnits[unitID] = true
	end
	encUnits[unitID] = nil

end

function gadget:UnitTaken(unitID, unitDefID, oldTeamID, teamID)
	local _,_,_,_,buildProgress = Spring.GetUnitHealth(unitID)
	if buildProgress == 1 then
		gadget:UnitDestroyed(unitID, unitDefID, oldTeamID)
		gadget:UnitFinished(unitID, unitDefID, teamID)
	end
	
end


function gadget:GameFrame(f)
	
	if f % 32 < .1 then
	
		for eUnitID, _ in pairs(encUnits) do
			for auraType, _ in pairs(auraUnits) do
				spSetUnitRulesParam(eUnitID,auraType,0)
			end
		end
	
		for auraType, units in pairs(auraUnits) do
			local alliedAura = auraDefs[auraType].ally
			local enemyAura = auraDefs[auraType].enemy
			
			for unitID, range in pairs(units) do
				local x, y, z = spGetUnitPosition(unitID)
				local auraUnitTeam = Spring.GetUnitTeam(unitID)
				local eUnits = spGetUnitsInCylinder(x,z, range)
				if (x and auraUnitTeam and eUnits) then
					for _,eUnitID in ipairs(eUnits) do
						if eUnitID ~= unitID then
							local eTeam = Spring.GetUnitTeam(eUnitID)
							if (enemyAura and (eTeam ~= auraUnitTeam) and not (Spring.AreTeamsAllied(eTeam, auraUnitTeam))) then
								spSetUnitRulesParam(eUnitID,auraType,1)
								GG.attUnits[eUnitID] = true
								encUnits[eUnitID] = auraType
							elseif (alliedAura and (eTeam ~= auraUnitTeam) and (Spring.AreTeamsAllied(eTeam, auraUnitTeam))) then
								spSetUnitRulesParam(eUnitID,auraType,1)
								GG.attUnits[eUnitID] = true
								encUnits[eUnitID] = auraType
							elseif (not enemyAura and (eTeam == auraUnitTeam)) then
								spSetUnitRulesParam(eUnitID,auraType,1)
								GG.attUnits[eUnitID] = true
								encUnits[eUnitID] = auraType
							end						
						end
					end
				end
			end
		end

		--todo: move this into Attributes gadget
		for unitID, _ in pairs(encUnits) do
			local eud = spGetUnitDefID(unitID) and UnitDefs[spGetUnitDefID(unitID)]
			if eud then
				local tooltip = eud.tooltip
				for auraType, _ in pairs(auraUnits) do
					if spGetUnitRulesParam(unitID,'has_'..auraType) == 1 then
						tooltip = tooltip ..' ('.. auraType ..')'
					end
					if spGetUnitRulesParam(unitID,auraType) == 1 then
						tooltip = tooltip ..' *'..auraDefs[auraType].encName ..'*'
					end
				end
				Spring.SetUnitTooltip(unitID,eud.humanName .. " - " .. tooltip)	
			end
			
		end

		
    end
	if f % 16 < .1 then
		local cx, cy, cz = -10+20*random(), -10+30*random(), -10+20*random()
		for unitID, _ in pairs(encUnits) do
			for auraType, _ in pairs(auraUnits) do
				if spGetUnitRulesParam(unitID,auraType) == 1 then
					local states = spGetUnitStates(unitID)
					if not states.cloak then
						local x, y, z = spGetUnitPosition(unitID)
						spSpawnCEG(auraDefs[auraType].ceg, x+cx, y+cy, z+cz)
					end
				end
			end
		end
--[[		for auraType, units in pairs(auraUnits) do
			for unitID, range in pairs(units) do
				local x, y, z = spGetUnitPosition(unitID)
				spSpawnCEG(auraDefs[auraType].aceg, x, y, z)
			end
		end]]--
	end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--SYNCED
else
--UNSYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--UNSYNCED
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
