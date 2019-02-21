--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	HOW TO USE
--	- see http://springrts.com/wiki/Lua_SaveLoad
--	- tl;dr:	/save -y <filename> to save to Spring/Saves
--					remove the -y to not overwrite
--				/savegame to save to Spring/Saves/QuickSave.ssf
--				open an .ssf with spring.exe to load
--				/reloadgame reloads the save you loaded 
--					(gadget purges existing units and feautres)
--	NOTES
--	- heightmap saving is implemented by engine
--	- gadgets which wish to save/load their data must either submit a table and
--		filename to save, or else handle it themselves
--	TODO
--	- handle fac command queues
--	- handle gadget data (CAI and chicken are particularly important)
--	- handle nonexistent unitDefs
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Save/Load",
    desc      = "General save/load stuff",
    author    = "KingRaptor (L.J. Lim)",
    date      = "25 September 2011",
    license   = "GNU LGPL, v2 or later",
    layer     = -math.huge,	-- we want this to go first
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local generalFile = "general.lua"
local unitFile = "units.lua"
local featureFile = "features.lua"

local AUTOSAVE_FREQUENCY = 30*60*5	-- 5 minutes
local FEATURE_ID_CONSTANT = 32000	-- when featureID is x, param of command issued on feature is x + this

GG.SaveLoad = GG.SaveLoad or {}

if (gadgetHandler:IsSyncedCode()) then
-----------------------------------------------------------------------------------
--  SYNCED
-----------------------------------------------------------------------------------
-- speedups
local spSetGameRulesParam	= Spring.SetGameRulesParam
local spSetTeamRulesParam	= Spring.SetTeamRulesParam
local spSetTeamResource		= Spring.SetTeamResource
local spCreateUnit			= Spring.CreateUnit
local spSetUnitHealth		= Spring.SetUnitHealth
local spSetUnitMaxHealth	= Spring.SetUnitMaxHealth
local spSetUnitVelocity		= Spring.SetUnitVelocity
local spSetUnitRotation		= Spring.SetUnitRotation
local spSetUnitExperience	= Spring.SetUnitExperience
local spSetUnitShieldState	= Spring.SetUnitShieldState
local spSetUnitWeaponState	= Spring.SetUnitWeaponState
local spSetUnitStockpile	= Spring.SetUnitStockpile
local spSetUnitNeutral		= Spring.SetUnitNeutral
local spGetUnitIsBuilding	= Spring.GetUnitIsBuilding
local spGiveOrderToUnit		= Spring.GiveOrderToUnit
local spCreateFeature		= Spring.CreateFeature
local spSetFeatureDirection	= Spring.SetFeatureDirection
local spSetFeatureHealth	= Spring.SetFeatureHealth
local spSetFeatureReclaim	= Spring.SetFeatureReclaim

local cmdTypeIconModeOrNumber = {
--	[CMD.AUTOREPAIRLEVEL] = true,
--	[CMD.SET_WANTED_MAX_SPEED] = true,
}

-- vars
local savedata = {
	general = {},
	unit = {},
	feature = {},
	gadgets = {}
}

local toCleanupFactory = {}
local cleanupFrame
local autosave = false
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
local function ReadFile(zip, name, file)
	name = name or ''
	if (not file) then return end
	local dataRaw, dataFunc, data, err
	
	zip:open(file)
	dataRaw = zip:read("*all")
	if not (dataRaw and type(dataRaw) == 'string') then
		err = name.." save data is empty or in invalid format"
	else
		dataFunc, err = loadstring(dataRaw)
		if dataFunc then
			success, data = pcall(dataFunc)
			if not success then	-- execute Borat
				err = data
			end
		end
	end
	if err then 
		Spring.Log(gadget:GetInfo().name, LOG.ERROR, 'Save/Load error: ' .. err)
		return nil
	end
	return data
end
GG.SaveLoad.ReadFile = ReadFile

local function boolToNum(bool)
	if bool then return 1
	else return 0 end
end

-- FIXME: obsolete in >92.0
local function GetNewUnitID(oldUnitID)
	return savedata.unit[oldUnitID] and savedata.unit[oldUnitID].newID
end
GG.SaveLoad.GetNewUnitID = GetNewUnitID

local function GetNewFeatureID(oldFeatureID)
	return savedata.feature[oldFeatureID] and savedata.feature[oldFeatureID].newID
end
GG.SaveLoad.GetNewFeatureID = GetNewFeatureID

local function GetSavedGameFrame()
	return savedata.general.gameFrame
end
GG.SaveLoad.GetSavedGameFrame = GetSavedGameFrame

-- FIXME: autodetection is fairly broken
local function IsCMDTypeIconModeOrNumber(unitID, cmdID)
	--Spring.Echo(cmdID, CMD.SET_WANTED_MAX_SPEED, cmdTypeIconModeOrNumber[cmdID])
	if cmdTypeIconModeOrNumber[cmdID] then return true end	-- check cached results first
	local index = Spring.FindUnitCmdDesc(unitID, cmdID)
	local cmdDescs = Spring.GetUnitCmdDescs(unitID, index, index) or {}
	if cmdDescs[1] and (cmdDescs[1].type == CMDTYPE.ICON_MODE or cmdDescs[1].type == CMDTYPE.NUMBER) then
		cmdTypeIconModeOrNumber[cmdID] = true
		return true
	end
	return false
end
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
local function LoadUnits()
	local factoryBuildeesToDelete = {}
	-- prep units
	for oldID, data in pairs(savedata.unit) do
		local px, py, pz = unpack(data.pos)
		local unitDefID = UnitDefNames[data.unitDefName].id
		if (not UnitDefs[unitDefID].canMove) then
			py = Spring.GetGroundHeight(px, pz)
		end
		local isNanoFrame = data.buildProgress < 1
		local newID = spCreateUnit(data.unitDefName, px, py, pz, 0, data.unitTeam, isNanoFrame, true, oldID)
		if newID then
			data.newID = newID
			-- position and velocity
			spSetUnitVelocity(newID, unpack(data.vel))
			--spSetUnitDirection(newID, unpack(data.dir))	-- FIXME: callin does not exist
			Spring.MoveCtrl.Enable(newID)
			Spring.MoveCtrl.SetHeading(newID, data.heading)	-- workaround?
			Spring.MoveCtrl.Disable(newID)
			
			if UnitDefNames[data.unitDefName].isImmobile then
				if data.groundHeight and GG.Terraform then
					GG.Terraform.SetStructureHeight(newID, data.groundHeight)
				end
			else
				Spring.MoveCtrl.Enable(newID)
				Spring.MoveCtrl.SetHeading(newID, data.heading)	-- workaround?
				Spring.MoveCtrl.Disable(newID)
			end			
			-- health
			spSetUnitMaxHealth(newID, data.maxHealth)
			spSetUnitHealth(newID, {health = data.health, capture = data.captureProgress, paralyze = data.paralyzeDamage, build = data.buildProgress})
			-- experience
			spSetUnitExperience(newID, data.experience)
			-- weapons
			for i,v in pairs(data.weapons) do
				if v.reloadState then
					spSetUnitWeaponState(newID, i, "reloadState", v.reloadState)
				end
				if data.shield[i] then
					spSetUnitShieldState(newID, i, data.shield[i].enabled, data.shield[i].power)
				end
			end
			spSetUnitStockpile(newID, data.stockpile.num, data.stockpile.progress)
			
			-- states
			spGiveOrderToUnit(newID, CMD.FIRE_STATE, {data.states.firestate}, {})
			spGiveOrderToUnit(newID, CMD.MOVE_STATE, {data.states.movestate}, {})
			spGiveOrderToUnit(newID, CMD.REPEAT, {boolToNum(data.states["repeat"])}, {})
			spGiveOrderToUnit(newID, CMD.CLOAK, {boolToNum(data.states.cloak)}, {})
			spGiveOrderToUnit(newID, CMD.ONOFF, {boolToNum(data.states.active)}, {})
			spGiveOrderToUnit(newID, CMD.TRAJECTORY, {boolToNum(data.states.trajectory)}, {})
--			spGiveOrderToUnit(newID, CMD.AUTOREPAIRLEVEL, {boolToNum(data.states.autorepairlevel)}, {})
			
			-- rulesparams
			for name,value in pairs(data.rulesParams) do
				Spring.SetUnitRulesParam(newID, name, value)
			end
			-- is neutral
			spSetUnitNeutral(newID, data.neutral)
			
			Spring.Echo("unitID check", oldID, newID)
		end
	end
	
	-- second pass for orders
	for oldID, data in pairs(savedata.unit) do
		for i=1,#data.commands do
			local command = data.commands[i]
			if (#command.params == 1 and data.newID and not(IsCMDTypeIconModeOrNumber(data.newID, command.id))) then
				local targetID = command.params[1]
				local isFeature = false
				if targetID > FEATURE_ID_CONSTANT then
					isFeature = true
					targetID = targetID - FEATURE_ID_CONSTANT
				end
				--Spring.Echo(CMD[command.id], command.params[1], GetNewUnitID(command.params[1]))
				--Spring.Echo("Order on entity " .. targetID)
				if (not isFeature) and GetNewUnitID(targetID) then
					--Spring.Echo("\tType: " .. savedata.unit[targetID].featureDefName)
					command.params[1] = GetNewUnitID(targetID)
				elseif isFeature and GetNewFeatureID(targetID) then
					--Spring.Echo("\tType: " .. savedata.feature[targetID].featureDefName)
					command.params[1] = GetNewFeatureID(targetID) + FEATURE_ID_CONSTANT
				end
				
			end
			
			-- workaround for stupid bug where the coordinates are all mixed up
			local params = {}
			for i=1,#command.params do
				params[i] = command.params[i]
			end
			
			local opts = command.options
			local alt, ctrl, shift, right = opts.alt, opts.ctrl, opts.shift, opts.right
			opts = {(alt and "alt"), (shift and "shift"), (ctrl and "ctrl"), (right and "right")} 
			Spring.GiveOrderToUnit(data.newID, command.id, params, opts)
		end
		
		if data.factoryData then
			for i=1,#data.factoryData.commands do
				local facCmd = data.factoryData.commands[i]
				local opts = facCmd.options
				local alt, ctrl, shift, right = opts.alt, opts.ctrl, opts.shift, opts.right
				opts = {(alt and "alt"), (shift and "shift"), (ctrl and "ctrl"), (right and "right")} 
				Spring.GiveOrderToUnit(data.newID, facCmd.id, facCmd.params, opts)
			end
			if data.factoryData.buildee then
				local buildeeData = data.factoryData.buildee
				local index = #factoryBuildeesToDelete+1
				buildeeData.unitID = GetNewUnitID(buildeeData.unitID)
				buildeeData.factoryID =  GetNewUnitID(buildeeData.factoryID)
				factoryBuildeesToDelete[index] = buildeeData
			end
		end
	end
	
	for i=1,#factoryBuildeesToDelete do
		local buildeeData = factoryBuildeesToDelete[i]
		--Spring.DestroyUnit(buildeeData.unitID, false, true)	-- clear the unit so factory can build it again
		Spring.SetUnitBlocking(buildeeData.unitID, false, false, false)
		toCleanupFactory[#toCleanupFactory + 1] = buildeeData
		--Spring.GiveOrderToUnit(buildeeData.factoryID, CMD.INSERT, {0, -buildeeData.unitDefID, CMD.OPT_ALT}, {"alt", "ctrl"})
	end
	cleanupFrame = Spring.GetGameFrame() + 75	-- needs to be some time to allow for factory opening animations
end

local function LoadFeatures()
	for oldID, data in pairs(savedata.feature) do
		local px, py, pz = unpack(data.pos)
		local featureDefID = FeatureDefNames[data.featureDefName].id
		local newID = spCreateFeature(data.featureDefName, px, py, pz, data.heading, data.allyTeam, oldID)
		data.newID = newID
		spSetFeatureDirection(newID, unpack(data.dir))
		-- health
		spSetFeatureHealth(newID, data.health)
		-- resources
		spSetFeatureReclaim(newID, data.reclaimLeft)
	end
end

local function LoadGeneralInfo()
	local gameRulesParams = savedata.general.gameRulesParams or {}
	for name,value in pairs(gameRulesParams) do
		spSetGameRulesParam(name, value)
	end
	
	-- team data
	for teamID, teamData in pairs(savedata.general.teams or {}) do
		-- this bugs with storage units - do it after units are created
		--spSetTeamResource(teamID, "m", teamData.resources.m)
		--spSetTeamResource(teamID, "ms", teamData.resources.ms)
		--spSetTeamResource(teamID, "e", teamData.resources.e)
		--spSetTeamResource(teamID, "es", teamData.resources.es)
		
		local rulesParams = teamData.rulesParams or {}
		for name, value in pairs (rulesParams) do
			spSetTeamRulesParam(teamID, name, value)
		end
	end
end

local function SetStorage()
	for teamID, teamData in pairs(savedata.general.teams or {}) do
		spSetTeamResource(teamID, "m", teamData.resources.m)
		spSetTeamResource(teamID, "ms", teamData.resources.ms)
		spSetTeamResource(teamID, "e", teamData.resources.e)
		spSetTeamResource(teamID, "es", teamData.resources.es)
	end
end


-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- callins
function gadget:Load(zip)
	-- get save data
	savedata.unit = ReadFile(zip, "Unit", unitFile) 
	local units = Spring.GetAllUnits()
	for i=1,#units do
		Spring.DestroyUnit(units[i], false, true)
	end

	savedata.feature = ReadFile(zip, "Feature", featureFile) or {}
	local features = Spring.GetAllFeatures()
	for i=1,#features do
		Spring.DestroyFeature(features[i])
	end
	
	savedata.general = ReadFile(zip, "General", generalFile)
	
	LoadGeneralInfo()
	LoadFeatures()	-- do features before units so we can change unit orders involving features to point to new ID
	LoadUnits()
	SetStorage()
	
	Spring.SetGameRulesParam("loadedGame", 1)
end

function gadget:GameFrame(n)
	if autosave and n % AUTOSAVE_FREQUENCY == 0 then
		Spring.SendCommands("save -y autosave")
	end
	
	if n == cleanupFrame then
		for i=1,#toCleanupFactory do
			local data = toCleanupFactory[i]
			local factoryID = data.factoryID
			if factoryID and (not Spring.GetUnitIsDead(factoryID)) then
				Spring.DestroyUnit(data.unitID, false, true)	-- clear the existing unit so factory can build it again
				local producedUnitID = spGetUnitIsBuilding(factoryID)
				if (producedUnitID) then
					spSetUnitHealth(producedUnitID, {health = data.health, capture = data.capture, paralyze = data.paralyze, build = data.build})
				end
			end
		end
		cleanupFrame = nil
		toCleanupFactory = nil
	end
end

-----------------------------------------------------------------------------------
--  END SYNCED
-----------------------------------------------------------------------------------
else
-----------------------------------------------------------------------------------
--  UNSYNCED
-----------------------------------------------------------------------------------
-- speedups
local spGetGameRulesParams	= Spring.GetGameRulesParams
local spGetTeamRulesParams	= Spring.GetTeamRulesParams
local spGetUnitDefID		= Spring.GetUnitDefID
local spGetUnitTeam			= Spring.GetUnitTeam
local spGetUnitNeutral		= Spring.GetUnitNeutral
local spGetUnitHealth		= Spring.GetUnitHealth
local spGetCommandQueue		= Spring.GetCommandQueue
local spGetUnitStates		= Spring.GetUnitStates
local spGetUnitStockpile	= Spring.GetUnitStockpile
local spGetUnitDirection	= Spring.GetUnitDirection
local spGetUnitHeading		= Spring.GetUnitHeading
local spGetUnitBasePosition	= Spring.GetUnitBasePosition
local spGetUnitVelocity		= Spring.GetUnitVelocity
local spGetUnitExperience	= Spring.GetUnitExperience
local spGetUnitWeaponState	= Spring.GetUnitWeaponState
local spGetUnitIsBuilding	= Spring.GetUnitIsBuilding
local spGetFeatureDefID		= Spring.GetFeatureDefID
local spGetFeatureAllyTeam	= Spring.GetFeatureAllyTeam
local spGetFeatureHealth	= Spring.GetFeatureHealth
local spGetFeatureDirection	= Spring.GetFeatureDirection
local spGetFeaturePosition	= Spring.GetFeaturePosition
local spGetFeatureHeading	= Spring.GetFeatureHeading
local spGetFeatureVelocity	= Spring.GetFeatureVelocity
local spGetFeatureResources	= Spring.GetFeatureResources
local spGetFeatureNoSelect	= Spring.GetFeatureNoSelect


-- vars
local savedata = {
	general = {},
	unit = {},
	feature = {},
	gadgets = {},
}

--------------------------------------------------------------------------------
-- I/O utility functions
--------------------------------------------------------------------------------
local function WriteIndents(num)
	local str = ""
	for i=1, num do
		str = str .. "\t"
	end
	return str
end

local keywords = {
	["repeat"] = true,
}

--[[
	raw = print table key-value pairs straight to file (i.e. not as a table)
	if you use it make sure your keys are valid variable names!
	
	valid params: {
		numIndents = int,
		raw = bool,
		prefixReturn = bool,
		forceLineBreakAtEnd = bool,
	}
]]
local function IsDictOrContainsDict(tab)
	for i,v in pairs(tab) do
		if type(i) ~= "number" then
			return true
		elseif i > #tab then
			return true
		elseif i <= 0 then
			return true
		elseif type(v) == "table" then
			return true
		end
	end
	return false
end

local function WriteTable(tab, tabName, params)
	params = params or {}
	local processed = {}
	
	params.numIndents = params.numIndents or 0
	local isDict = IsDictOrContainsDict(tab)
	local comma = params.raw and "" or ", "
	local endLine = comma .. "\n"
	local str = ""
	
	local function ProcessKeyValuePair(i,v, isArray, lastItem)
		local pairEndLine = (lastItem and "") or (isArray and comma) or endLine
		if isDict then
			str = str .. WriteIndents(params.numIndents + 1)
		end
		if type(i) == "number" then
			if not isArray then
				str = str .. "[" .. i .. "] = "
			end
		elseif keywords[i] or (type(i) == "string") then
			str = str .. "[" .. string.format("%q", i) .. "]" .. "= "
		else
			str = str .. i .. " = "
		end
		
		if type(v) == "table" then
			local arg = {numIndents = (params.numIndents + 1), endOfFile = false}
			str = str .. WriteTable(v, nil, arg)
		elseif type(v) == "boolean" then
			str = str .. tostring(v) .. pairEndLine
		elseif type(v) == "string" then
			str = str .. string.format("%q", v) .. pairEndLine
		else
			str = str .. v .. pairEndLine
		end
	end
	
	if not params.raw then
		if params.prefixReturn then
			str = "return "
		elseif tabName then
			str = tabName .. " = "
		end
		str = str .. (isDict and "{\n" or "{")
	end
	
	-- do array component first (ensures order is preserved)
	for i=0,#tab do
		local v = tab[i]
		if v then
			ProcessKeyValuePair(i,v, (tab[0] == nil), (not isDict) and i == #tab)
			processed[i] = true
		end
	end
	for i,v in pairs(tab) do
		if not processed[i] then
			ProcessKeyValuePair(i,v)
		end
	end
	
	if isDict then
		str = str .. WriteIndents(params.numIndents)
	end
	str = str ..  "}"
	if params.endOfFile == false then
		str = str .. endLine
	end
	
	return str
end

local function WriteSaveData(zip, filename, data)
	zip:open(filename)
	zip:write(WriteTable(data, nil, {prefixReturn = true}))
end
GG.SaveLoad.WriteSaveData = WriteSaveData

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

local function SaveUnits()
	local data = {}
	local units = Spring.GetAllUnits()
	for i=1,#units do
		local unitID = units[i]
		data[unitID] = {}
		local unitInfo = data[unitID]
		
		-- basic unit information
		local unitDefID = spGetUnitDefID(unitID)
		local unitDef = UnitDefs[unitDefID]
		unitInfo.unitDefName = unitDef.name
		local unitTeam = spGetUnitTeam(unitID)
		unitInfo.unitTeam = unitTeam
		local neutral = spGetUnitNeutral(unitID)
		-- save position/velocity
		unitInfo.pos = {spGetUnitBasePosition(unitID)}
		unitInfo.dir = {spGetUnitDirection(unitID)}
		unitInfo.vel = {spGetUnitVelocity(unitID)}
		unitInfo.heading = spGetUnitHeading(unitID)
		-- save health
		unitInfo.health, unitInfo.maxHealth, unitInfo.paralyzeDamage, unitInfo.captureProgress, unitInfo.buildProgress = spGetUnitHealth(unitID)
		-- save weapons
		local weapons = unitDef.weapons
		unitInfo.weapons = {}
		unitInfo.shield = {}
		for i=1,#weapons do
			unitInfo.weapons[i] = {}
			unitInfo.weapons[i].reloadState = spGetUnitWeaponState(unitID, i, reloadState)
			local enabled, power = Spring.GetUnitShieldState(unitID, i)
			if power then
				unitInfo.shield[i] = {enabled = enabled, power = power}
			end
		end
		unitInfo.stockpile = {}
		unitInfo.stockpile.num, _, unitInfo.stockpile.progress = spGetUnitStockpile(unitID)
		
		-- factory properties
		if unitDef.isFactory then
			local factoryCommands = Spring.GetFactoryCommands(unitID) or {}
			unitInfo.factoryData = { commands = factoryCommands }
			local producedUnitID = spGetUnitIsBuilding(unitID)
			if (producedUnitID) then
				local producedDefID = spGetUnitDefID(producedUnitID)
				if (producedDefID) then
					local health, _, paralyze, capture, build = spGetUnitHealth(producedUnitID)
					unitInfo.factoryData.buildee = {
						factoryID = unitID,
						unitID = producedUnitID,
						unitDefID = producedDefID,
						health = health,
						paralyze = paralyze,
						capture = capture,
						build = build,
					}
				end
			end
		end
		
		-- save commands and states
		local commands = spGetCommandQueue(unitID, 20)
		for i,v in pairs(commands) do
			if (type(v) == "table" and v.params) then v.params.n = nil end
		end
		unitInfo.commands = commands
		unitInfo.states = spGetUnitStates(unitID)
		-- save experience
		unitInfo.experience = spGetUnitExperience(unitID)
		-- save rulesparams
		unitInfo.rulesParams = {}		
		local params = Spring.GetUnitRulesParams(unitID)
		for i=1,#params do
			for name,value in pairs(params[i]) do
				unitInfo.rulesParams.name = value 
			end
		end
	end
	savedata.unit = data
end

local function SaveFeatures()
	local data = {}
	local features = Spring.GetAllFeatures()
	for i=1,#features do
		local featureID = features[i]
		data[featureID] = {}
		local featureInfo = data[featureID]
		
		-- basic feature information
		local featureDefID = spGetFeatureDefID(featureID)
		featureInfo.featureDefName = FeatureDefs[featureDefID].name
		local allyTeam = spGetFeatureAllyTeam(featureID)
		featureInfo.allyTeam = allyTeam
		-- save position/velocity
		featureInfo.pos = {spGetFeaturePosition(featureID)}
		featureInfo.dir = {spGetFeatureDirection(featureID)}
		featureInfo.heading = spGetFeatureHeading(featureID)		
		-- save health
		featureInfo.health, featureInfo.maxHealth, featureInfo.resurrectProgress = spGetFeatureHealth(featureID)
		featureInfo.reclaimLeft = select(5, spGetFeatureResources(featureID))
	end
	savedata.feature = data
end

local function SaveGeneralInfo()
	local data = {}
	
	data.gameFrame = Spring.GetGameFrame()
	
	-- gameRulesParams
	data.gameRulesParams = {}
	local gameRulesParams = spGetGameRulesParams()
	for i=1,#gameRulesParams do
		for name,value in pairs(gameRulesParams[i]) do
			data.gameRulesParams[name] = value 
		end
	end
	
	-- team stuff - rulesparams, resources
	data.teams = {}
	local teams = Spring.GetTeamList()
	for i=1,#teams do
		local teamID = teams[i]
		data.teams[teamID] = {}
		local m, ms = Spring.GetTeamResources(teamID, "metal")
		local e, es = Spring.GetTeamResources(teamID, "energy")
		data.teams[teamID].resources = { m = m, e = e, ms = ms, es = es }
		
		local rulesParams = spGetTeamRulesParams(teamID) or {}
		data.teams[teamID].rulesParams = {}
		for j=1,#rulesParams do
			for name,value in pairs(rulesParams[j]) do
				data.teams[teamID].rulesParams[name] = value 
			end
		end
	end
	
	savedata.general = data
end

local function ModifyUnitData(unitID)
end

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- callins
function gadget:Save(zip)
	SaveGeneralInfo()
	SaveUnits()
	SaveFeatures()
	WriteSaveData(zip, generalFile, savedata.general)
	WriteSaveData(zip, unitFile, savedata.unit)
	WriteSaveData(zip, featureFile, savedata.feature)
	
	for _,entry in pairs(savedata.gadgets) do
		WriteSaveData(zip, entry.filename, entry.data)
	end
end

function gadget:Initialize()

end
-----------------------------------------------------------------------------------
--  END UNSYNCED
-----------------------------------------------------------------------------------
end