function widget:GetInfo()
	return {
		name = "Local Team Colors",
		desc = "Makes neat team color scheme - you teal, allies blueish, enemies reddish",
		author = "Licho, adapted for the cursed by azaremoth",
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
		value = true,
		desc = 'All allies are green, all enemies are red.',
		OnChange = function() widget:Initialize() end
	},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local gaiaColor = {}
local myColor = {}
local myTrueColor = {}
local allyColors = {}
local enemyColors = {}
local rand1 = (0.25*math.random())
local rand2 = (0.25*math.random())
local teamRand1 = {}
local teamRand2 = {}
for _, teamID in ipairs(Spring.GetTeamList()) do
	teamRand1[teamID]=(0.50*math.random())
	teamRand2[teamID]=(0.75*math.random())
end

local myTeam = Spring.GetMyTeamID()

mtr,mtg,mtb,_ = Spring.GetTeamColor(myTeam)

-- Use your set color in any case
myTrueColor[1] = mtr
myTrueColor[2] = mtg
myTrueColor[3] = mtb

myColor[1] = 0.0
myColor[2] = 0.2
myColor[3] = 0.8

gaiaColor[1] = 0.25
gaiaColor[2] = 0.25
gaiaColor[3] = 0.25

allyColors[1] = 0.0
allyColors[2] = 1.0
allyColors[3] = 0.0

enemyColors[1] = 1.0
enemyColors[2] = 0.0
enemyColors[3] = 0.0

WG.LocalColor = (type(WG.LocalColor) == "table" and WG.LocalColor) or {}
WG.LocalColor.listeners = WG.LocalColor.listeners or {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local is_speccing

local function SetNewTeamColors() 
	local gaia = Spring.GetGaiaTeamID()
	Spring.SetTeamColor(gaia, unpack(gaiaColor))
	
	local myAlly = Spring.GetMyAllyTeamID()
	local teams = Spring.GetTeamList()

	local a = 0.30
	local e = 0.30
	local increase = 0.25
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		if (allyID == myAlly) then
			local g = allyColors[2]*a
			local r = teamRand1[teamID]*g
			local b = teamRand2[teamID]*g
			Spring.SetTeamColor(teamID, r,g,b)
			
			a = a+increase
			if (a > 1) then 
				a = 0.1 + rand1
			end
			
		elseif (teamID ~= gaia) then		
			local r = enemyColors[1]*e
			local g = teamRand1[teamID]*r
			local b = teamRand2[teamID]*r
			Spring.SetTeamColor(teamID, r,g,b)
			
			e = e+increase
			if (e > 1) then  
				e = 0.1 + rand2
			end			
			
		end
	end
	if not is_speccing then
		Spring.SetTeamColor(myTeam, unpack(myTrueColor))	-- overrides previously defined color
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

