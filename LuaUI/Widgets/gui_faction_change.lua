
function widget:GetInfo()
    return {
        name    = 'Faction Change',
        desc    = 'Adds buttons to switch faction before the game starts',
        author  = 'Niobium, Bluestone',
        date    = 'May 2011',
        license = 'GNU GPL v2',
        layer   = 1002, -- must go after initial queue, or depthtest is wrong
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

function SetFaction(faction)
    -- tell initial_spawn
    spSendLuaRulesMsg('\138' .. faction) 
	-- Spring.Echo('Sending')
	-- Spring.Echo('\138' .. faction)
    -- tell sMenu and initial queue
    WG.faction = faction
end

function SetImperial()
    SetFaction('imperials')
    return true
end

function SetCursed()
    SetFaction('cursed')
    return true
end

function resizeUI(vsx,vsy)
    if control ~= nil then
        control:SetPos(vsx*0.47, vsy*0.10, vsx*0.10, vsy*0.10) 
    end
end

function widget:ViewResize(vsx,vsy)
	resizeUI(vsx,vsy)
end


function widget:Initialize()
   if spGetSpectatingState() or Spring.GetGameFrame() > 0 or (#Spring.GetTeamList()<=2 and Game.startPosType~=2) or campaignBattleID or WG.isMission then
		widgetHandler:RemoveWidget(self)
        return
    end
        
    WG.faction = cursed
    
    Chili = WG.Chili
    buttonColour = WG.buttonColour
    
    control = Chili.Control:New{
        parent = Chili.Screen0,
        padding     = {0,0,0,0},
        itemPadding = {0,0,0,0},
        itemMargin  = {0,0,0,0},
    }

    imperial_button = Chili.Button:New{
        parent = control,
        height = '100%',
        width  = '50%',
        onclick = {SetImperial},
        caption = "",
        backgroundColor = buttonColour,
        children = { Chili.Image:New{width='100%', height='100%', file='Sidepics/imperials_big.png'} }
    }

    cursed_button = Chili.Button:New{
        parent = control,
        x      = '50%',
        height = '100%',
        width  = '50%',
        onclick = {SetCursed},
        caption = "",
        backgroundColor = buttonColour,
        children = { Chili.Image:New{width='100%', height='100%', file='Sidepics/cursed_big.png'} }
    }
	
    local vsx,vsy = Spring.GetViewGeometry()
    resizeUI(vsx,vsy)
	
end

function widget:GameFrame(n)
   if n > 0 then
		widgetHandler:RemoveWidget(self)
        return
    end
end