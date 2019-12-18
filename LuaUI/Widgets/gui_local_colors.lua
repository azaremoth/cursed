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
		value = false,
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

local maxAllyTeamSize = 0
local allyTeamSize = {}
local numberOfAllyTeams = 0
local teamInAlly = {}
local teamColorSpread = {}
local is_speccing = false

mtr,mtg,mtb,_ = Spring.GetTeamColor(myTeam)

-- Use your set color in any case
myTrueColor[1] = mtr
myTrueColor[2] = mtg
myTrueColor[3] = mtb

myColor[1] = 0.0
myColor[2] = 0.50
myColor[3] = 0.75

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
	local myTeam = Spring.GetMyTeamID()	
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		local colorSpread = teamColorSpread[teamID] or 0
		if (allyID == myAlly) then
			if (teamID == myTeam) then
				Spring.SetTeamColor(teamID, unpack(myColor))
			else
				local g = allyColors[2]
				local r = 0.5*colorSpread
				local b = 2*colorSpread
				Spring.SetTeamColor(teamID, r,g,b)
			end
		elseif (teamID ~= gaia) then
			local r = enemyColors[1]
			local g = 0.5*colorSpread
			local b = 2*colorSpread
			Spring.SetTeamColor(teamID, r,g,b)				
		end
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
			if (teamID == myTeam) then
				Spring.SetTeamColor(teamID, unpack(myColor))
			else
				Spring.SetTeamColor(teamID, unpack(allyColors))
			end	
		elseif (teamID ~= gaia) then
			Spring.SetTeamColor(teamID, unpack(enemyColors))
		end
	end
end

local function SetNewDifferentTeamColors()
	local gaia = Spring.GetGaiaTeamID()
	Spring.SetTeamColor(gaia, unpack(gaiaColor))
	local myTeam = Spring.GetMyTeamID()		
	local myAlly = Spring.GetMyAllyTeamID()
	local teams = Spring.GetTeamList()
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		if (teamID ~= gaia) then
			local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
			local colorSpread = teamColorSpread[teamID] or 0
			
			local r = 0
			local g = 0
			local b = 0

			if (not is_speccing) and (teamID == myTeam) then			
				Spring.SetTeamColor(teamID, unpack(myColor))
			elseif (not is_speccing) and (allyID == myAlly) and (teamID ~= myTeam) then
				local r = 0.25+colorSpread				
				local g = myColor[2]
				local b = myColor[3]
				Spring.SetTeamColor(teamID, r,g,b)				
			else
				if (allyID == 0) then
					r = 1
					g = 0
					b = colorSpread
				elseif (allyID == 1) then
					r = 0
					g = 1
					b = colorSpread
				elseif (allyID == 2) then
					r = colorSpread
					g = 0
					b = 0
				elseif (allyID == 3) then			
					r = 1
					g = 1
					b = colorSpread
				elseif (allyID == 4) then
					r = 1
					g = colorSpread
					b = 1
				elseif (allyID == 5) then
					r = colorSpread
					g = 1
					b = 1
				elseif (allyID == 6) then
					r = 0.33
					g = 0
					b = colorSpread
				elseif (allyID == 7) then
					r = 0
					g = 0.33
					b = colorSpread
				elseif (allyID == 8) then
					r = colorSpread
					g = 0
					b = 0.33
				elseif (allyID == 9) then			
					r = 0.33
					g = 0.33
					b = colorSpread
				elseif (allyID == 10) then
					r = 0.33
					g = colorSpread
					b = 0.33
				elseif (allyID == 11) then
					r = colorSpread
					g = 0.33
					b = 0.33		
				elseif (allyID == 12) then
					r = 0.66
					g = 0
					b = colorSpread
				elseif (allyID == 13) then
					r = 0
					g = 0.66
					b = colorSpread
				elseif (allyID == 14) then
					r = colorSpread
					g = 0
					b = 0.66
				elseif (allyID == 15) then			
					r = 0.66
					g = 0.66
					b = colorSpread
				elseif (allyID == 16) then
					r = 0.66
					g = colorSpread
					b = 0.66
				elseif (allyID == 17) then
					r = colorSpread
					g = 0.66
					b = 0.66				
				elseif (allyID == 18) then
					r = colorSpread
					g = colorSpread
					b = colorSpread				
				else
					r = math.random()
					g = math.random()
					b = math.random()
				end
			Spring.SetTeamColor(teamID, r,g,b)
			end
		end
	end
end

local function InitializeVariables()
	local allyteams = Spring.GetAllyTeamList()
	local gaiaT = Spring.GetGaiaTeamID()
	local gaiaAT = select(6, Spring.GetTeamInfo(gaiaT))
	local allyCounter = 0
--	local enemyTeamCounter = 0
	
	for i=1,#allyteams do
		if allyteams[i] ~= gaiaAT then
			local teams = Spring.GetTeamList()
			if #teams > 0  then
				allyCounter = allyCounter + 1
			end
		end
	end
	numberOfAllyTeams = allyCounter
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		local myTeam = Spring.GetMyTeamID()
		local myAlly = Spring.GetMyAllyTeamID()
		if allyTeamSize[allyID] ~= nil then		
			allyTeamSize[allyID] = allyTeamSize[allyID]+1
			teamInAlly[teamID] = allyTeamSize[allyID]
			if allyTeamSize[allyID] > maxAllyTeamSize then
				maxAllyTeamSize = allyTeamSize[allyID]
			end
		else
			allyTeamSize[allyID] = 1
			teamInAlly[teamID] = allyTeamSize[allyID]
		end
--		if (allyID ~= myAlly) and (allyID ~= gaiaAT) then
--			enemyTeamCounter = enemyTeamCounter + 1
--		end		
	end	
	
	for _, teamID in ipairs(Spring.GetTeamList()) do
		local _,_,_,_,_,allyID = Spring.GetTeamInfo(teamID)
		if allyTeamSize[allyID] > 1 then
			teamColorSpread[teamID] = 0.5*((teamInAlly[teamID]-1)/(allyTeamSize[allyID]-1))
		else
			teamColorSpread[teamID] = 0
		end
		if teamColorSpread[teamID] > 1 then
			teamColorSpread[teamID] = 1
		end	
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

local function ChangeColors()
	is_speccing = Spring.GetSpectatingState()
	if (not is_speccing and options.simpleColors.value) then -- red, green, blue only
		SetNewSimpleTeamColors()
	elseif (is_speccing or numberOfAllyTeams > 2) then -- FFA and Spec
		SetNewDifferentTeamColors()		
	else -- shades of red and green
		SetNewTeamColors()
	end
	
	NotifyColorChange()
end

function WG.LocalColor.localTeamColorToggle()
	options.simpleColors.value = not options.simpleColors.value
	ChangeColors()
--	widget:Initialize()
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
	InitializeVariables()
	ChangeColors()
end

function widget:Shutdown()
	ResetOldTeamColors()
	NotifyColorChange()
	WG.LocalColor.localTeamColorToggle = nil
end

