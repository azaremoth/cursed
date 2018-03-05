function widget:GetInfo()
	return {
		name = "Local Team Colors",
		desc = "Makes neat team color scheme - you teal, allies blueish, enemies reddish",
		author = "Licho",
		date = "February, 2010",
		license = "GNU GPL v2, or later",
		layer = -10001,
		enabled = true,
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

options_path = 'Settings/Interface/Local Team Colors'
options = {
	simpleColors = {
		name = "Simple Colors",
		type = 'bool',
		value = false,
		desc = 'All allies are green, all enemies are red.',
		OnChange = function() widget:Initialize() end
	},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local gaiaColor = {}
local myColor = {}
local allyColors = {}
local enemyColors = {}

gaiaColor[1] = 0.25
gaiaColor[2] = 0.25
gaiaColor[3] = 0.25

myColor[1] = 0.0
myColor[2] = 0.0
myColor[3] = 0.8

allyColors[1] = math.random(0.1,0.5)
allyColors[2] = 1.0
allyColors[3] = math.random(0.1,0.5)

enemyColors[1] = 1.0
enemyColors[2] = math.random(0.1,0.5)
enemyColors[3] = math.random(0.1,0.5)

WG.LocalColor = (type(WG.LocalColor) == "table" and WG.LocalColor) or {}
WG.LocalColor.listeners = WG.LocalColor.listeners or {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local is_speccing

local function SetNewTeamColors() 
	local gaia = Spring.GetGaiaTeamID()
	Spring.SetTeamColor(gaia, unpack(gaiaColor))
	
	local myAlly = Spring.GetMyAllyTeamID()
	local myTeam = Spring.GetMyTeamID()
	local teams = Spring.GetTeamList()

	local a = 0.3
	local e = 0.3
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		if (allyID == myAlly) then
			a = a+0.3
			if (a > 1) then 
				a = a-1
			end
			local r = allyColors[1]*a
			local g = allyColors[2]*a
			local b = allyColors[3]*a
			Spring.SetTeamColor(teamID, r,g,b)
		elseif (teamID ~= gaia) then
			e = e+0.3
			if (e > 1) then 
				e = e-1
			end			
			local r = enemyColors[1]*e
			local g = enemyColors[2]*e
			local b = enemyColors[3]*e
			Spring.SetTeamColor(teamID, r,g,b)
		end
	end
	if not is_speccing then
		Spring.SetTeamColor(myTeam, unpack(myColor))	-- overrides previously defined color
	end
end

local function SetNewSimpleTeamColors() 
	local gaia = Spring.GetGaiaTeamID()
	Spring.SetTeamColor(gaia, unpack(gaiaColor))
	
	local myAlly = Spring.GetMyAllyTeamID()
	local myTeam = Spring.GetMyTeamID()

	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		if (allyID == myAlly) then
			Spring.SetTeamColor(teamID, unpack(allyColors))
		elseif (teamID ~= gaia) then
			Spring.SetTeamColor(teamID, unpack(enemyColors))
		end
	end
	if not is_speccing then
		Spring.SetTeamColor(myTeam, unpack(myColor))	-- overrides previously defined color
	end
end

local function ResetOldTeamColors()
	for _,team in ipairs(Spring.GetTeamList()) do
		Spring.SetTeamColor(team,Spring.GetTeamOrigColor(team))
	end
end

local function NotifyColorChange()
	for name,func in pairs(WG.LocalColor.listeners) do
		if type(func) == "function" then	-- because we don't trust other widget writers to not give us random junk
			func()				-- yeah we wouldn't even need to do this with static typing :(
		else
			Spring.Echo("<Local Team Colors> ERROR: Listener '" .. name .. "' is not a function!" )
		end
	end
end

function WG.LocalColor.localTeamColorToggle()
	options.simpleColors.value = not options.simpleColors.value
	widget:Initialize()
end

function WG.LocalColor.RegisterListener(name, func)
	WG.LocalColor.listeners[name] = func
end

function WG.LocalColor.UnregisterListener(name)
	WG.LocalColor.listeners[name] = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Initialize()
	is_speccing = Spring.GetSpectatingState()
	if options.simpleColors.value then
		SetNewSimpleTeamColors()
	else
		SetNewTeamColors()
	end
	
	NotifyColorChange()
end

function widget:Shutdown()
	ResetOldTeamColors()
	NotifyColorChange()
	WG.LocalColor.localTeamColorToggle = nil
end

