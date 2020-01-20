
function widget:GetInfo()
    return {
        name    = 'CPV Guide window',
        desc    = 'Gives basic information about the control point victory game mode',
        author  = 'azaremoth',
        date    = 'January 2019',
        license = 'GNU GPL v2',
        layer   = 1003,
        enabled = true,
    }
end

-------------------------------------------------------------------------------

local teamList = Spring.GetTeamList()
local myTeamID = Spring.GetMyTeamID()
local modOptions = Spring.GetModOptions()
local campaignBattleID = modOptions.singleplayercampaignbattleid

local glTexCoord = gl.TexCoord
local glVertex = gl.Vertex
local glColor = gl.Color
local glTexture = gl.Texture
local glTexRect = gl.TexRect
local glDepthTest = gl.DepthTest
local glBeginEnd = gl.BeginEnd
local GL_QUADS = GL.QUADS
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spGetGroundHeight = Spring.GetGroundHeight
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg
local spGetSpectatingState = Spring.GetSpectatingState

local buttonColour, panelColour, sliderColour 

local TextBox
local textBox

local size = 600

local cvMode = modOptions.scoremode

if cvMode == nil then
	cvMode = "disabled"
end

	local white = "\255\255\255\255"
	local offwhite = "\255\255\255\255" -- "\255\210\210\210"
	local yellow = "\255\255\255\0"
	
dominationScore = tonumber(Spring.GetModOptions().dominationscore)
dominationScoreTime = tonumber(Spring.GetModOptions().dominationscoretime) -- Time needed holding all points to score in multi domination
limitScore = tonumber(Spring.GetModOptions().limitscore)
metalPerPoint = tonumber(Spring.GetModOptions().metalperpoint)
energyPerPoint = tonumber(Spring.GetModOptions().energyperpoint)
tugofWarModifier = tonumber(Spring.GetModOptions().tugofwarmodifier) -- Radius around a point in which to capture it

local scoreModeAsString = "Disabled"
local modeDescription = " "
if cvMode == "countdown" then 
	scoreModeAsString = "Countdown"
	modeDescription = "Your score counts down until zero based upon how many points your enemy owns."
elseif cvMode == "tugofwar" then 
	scoreModeAsString = "Tug of War"
	modeDescription = "Score is transferred between teams. Score transferred is multiplied by " .. yellow .. tugofWarModifier .. offwhite
elseif cvMode == "domination" then 
	scoreModeAsString = "Domination"
	modeDescription = "Capture all controlpoints on the map for  " .. yellow .. dominationScoreTime .. offwhite .. [[ seconds in order to gain ]] .. yellow .. dominationScore .. offwhite .. [[ score. Goal ]] .. yellow .. limitScore .. offwhite .. [[.]]
end

local bonusText = ""
if metalPerPoint > 0 and energyPerPoint > 0 then
	bonusText = [[
 
You will also gain ]] .. white .. [[+]] .. yellow .. metalPerPoint .. offwhite .. [[ metal and ]] .. white .. [[+]] .. yellow .. energyPerPoint .. offwhite ..[[ energy for each controlpoint you own.
 
]]
elseif metalPerPoint > 0 then
	bonusText = [[
 
You will also gain ]] .. white .. [[+]] .. yellow .. metalPerPoint .. offwhite .. [[ energy for each controlpoint you own.
 
]]
elseif energyPerPoint > 0 then
	bonusText = [[
 
You will also gain ]] .. white .. [[+]] .. yellow .. metalPerPoint .. offwhite .. [[ metal for each controlpoint you own.
 
]]
end

local infotext = offwhite .. [[Controlpoints are spread across the map. They can be captured by moving units into the circles.
 
There are 3 modes (Current mode is ]] .. yellow .. scoreModeAsString .. offwhite .. [[): ]] .. modeDescription .. [[

]] .. bonusText .. [[
 
Note that you can only build certain units inside them (e.g. Metal Extractors).]]


--------------------------------------------------------------------------------
-- Funcs
--------------------------------------------------------------------------------
local function QuadVerts(x, z, r)
    local y = Spring.GetGroundHeight(x,z)
    glTexCoord(0, 0); glVertex(x-r, y, z-r)
    glTexCoord(1, 0); glVertex(x+r, y, z-r)
    glTexCoord(1, 1); glVertex(x+r, y, z+r)
    glTexCoord(0, 1); glVertex(x-r, y, z+r)
end

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
local Chili, control, imperial_button, cursed_button


function resizeUI(vsx,vsy)
    if control ~= nil then
        control:SetPos(vsx*0.47, vsy*0.10, vsx*0.10, vsy*0.10) 
    end
end

function widget:ViewResize(vsx,vsy)
	resizeUI(vsx,vsy)
end

function widget:Initialize()
   if (not WG.Chili) or cvMode = "disabled" or spGetSpectatingState() or Spring.GetGameFrame() > 300 then
		widgetHandler:RemoveWidget()
        return
    end
    
    Chili = WG.Chili
--    buttonColour = WG.buttonColour

	window_cpl = Chili.Window:New{
		name = "CPV",
--		caption = "Control Point Victory",
		color = {1,1,1,0.5},
		x = '33%',
		y = '33%',
		width  = '33%',
		height = '20%',
		padding = {8, 8, 8, 8};
		--autosize   = true;
		parent = Chili.Screen0,
		draggable = true,
		resizable = true,
		minWidth=500;
		minHeight=400;
	}	
	
	textBox = Chili.TextBox:New{
		parent  = window_cpl;
		text    = infotext or 'jgjhfjghdjkghdkjghdfkjghdfjkghjkdghdfjkghjkdfghjkdfghjdfghdfghdfghfdjghjghfdjkhgjdhfgjkdfhj',
		x       = '2%',
		y       = '2%',
		width   = '96%',
		height = '96%',		
		valign  = "ascender";
		align   = "left";
		font    = {
			size   = 16;
			shadow = true;
		},
	}	
		
    local vsx,vsy = Spring.GetViewGeometry()
    resizeUI(vsx,vsy)
	
end

function widget:GameFrame(n)
	if n > 300 then
		widgetHandler:RemoveWidget(self)
		return
    end
end