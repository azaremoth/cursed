--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Summoning effect",
    desc      = "Draws an effect for summoned units",
    author    = "aZaremoth",
    date      = "2013-05-01",
    license   = "GNU GPL, v2 or later",
    experimental = false,
    layer     = 0,
    hidden = true,	
    enabled   = true,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local echo = Spring.Echo

local GL_ONE                 = GL.ONE
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local GL_SRC_ALPHA           = GL.SRC_ALPHA
local glBlending             = gl.Blending
local glColor                = gl.Color
local glCreateShader         = gl.CreateShader
local glDeleteShader         = gl.DeleteShader
local glDepthTest            = gl.DepthTest
local glFeature              = gl.Feature
local glGetShaderLog         = gl.GetShaderLog
local glPolygonOffset        = gl.PolygonOffset
local glSmoothing            = gl.Smoothing
local glUseShader            = gl.UseShader
local spEcho                 = Spring.Echo
local GetPlayerControlledUnit = Spring.GetPlayerControlledUnit
local GetMyPlayerID           = Spring.GetMyPlayerID
local TraceScreenRay          = Spring.TraceScreenRay
local GetMouseState           = Spring.GetMouseState
local GetUnitTeam             = Spring.GetUnitTeam
local ValidUnitID             = Spring.ValidUnitID
local ValidFeatureID          = Spring.ValidFeatureID


local spGetCameraPosition	= Spring.GetCameraPosition
local spGetGameFrame		= Spring.GetGameFrame
local spGetSelectedUnits	= Spring.GetSelectedUnits
local spGetVisibleUnits		= Spring.GetVisibleUnits
local spIsUnitSelected		= Spring.IsUnitSelected



--halo
local GL_ZERO      = GL.ZERO
local GL_KEEP      = 0x1E00
local GL_REPLACE   = 0x1E01  
local GL_INCR      = 0x1E02  
local GL_DECR      = 0x1E03
local GL_INCR_WRAP = 0x8507 
local GL_DECR_WRAP = 0x8508 
local GL_STENCIL_BITS = 0x0D57


local GetUnitRadius       = Spring.GetUnitRadius
local GetUnitViewPosition = Spring.GetUnitViewPosition
local GetUnitBasePosition = Spring.GetUnitBasePosition
local IsUnitVisible       = Spring.IsUnitVisible
local GetGroundNormal     = Spring.GetGroundNormal
local GetMyTeamID         = Spring.GetMyTeamID
local GetModKeyState      = Spring.GetModKeyState
local DrawUnitCommands    = Spring.DrawUnitCommands
local GetFeatureRadius   = Spring.GetFeatureRadius
local GetFeaturePosition = Spring.GetFeaturePosition

local GetPlayerInfo      = Spring.GetPlayerInfo

local acos   = math.acos
local PI_DEG = 180 / math.pi

local ipairs = ipairs

local glPushMatrix = gl.PushMatrix
local glTranslate  = gl.Translate
local glScale      = gl.Scale
local glRotate     = gl.Rotate
local glCallList   = gl.CallList
local glPopMatrix  = gl.PopMatrix
local glLineWidth  = gl.LineWidth
local glColor          = gl.Color
local glDrawListAtUnit = gl.DrawListAtUnit
local glUnit = gl.Unit



------------------------------------------------------------------------------------

if (not glCreateShader) then
  spEcho("Hardware is incompatible with Xray shader requirements")
  return false
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  simple configuration parameters
--

local edgeExponent = 0.25

local overlayColor 	= { 0.6, 1, 0.15 }

-- looks a lot nicer, esp. without FSAA  (but eats into the FPS too much)
local smoothPolys = glSmoothing and true

local myPlayerID = Spring.GetMyPlayerID()

local type, data  --  for the TraceScreenRay() call
local shader


local circleLines  = 0
local circleDivs   = 32
local circleOffset = 0


local visibleSelected = {}
local unitsUnderConstruction = {}

local uCycle = 1

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:UnitCreated(unitID, unitDefID, team, builderID)
	if (UnitDefs[unitDefID].customParams.factionname == "cursed") then
		unitsUnderConstruction[unitID] = true
	end
end

function widget:UnitFinished(unitID, unitDefID, team)
	if (unitsUnderConstruction[unitID] ~= nil) then
		unitsUnderConstruction[unitID] = false
	end
end

function widget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	if (unitsUnderConstruction[unitID] ~= nil) then
		unitsUnderConstruction[unitID] = false
	end
end

local function GetVisibleUnits()
    local units = spGetVisibleUnits(-1, 30, true)
    --local visibleUnits = {}
    local visibleSelected = {}
    
    for i=1, #units do
	    local unitID = units[i]
	    if (unitsUnderConstruction[unitID]) then
		    visibleSelected[#visibleSelected+1] = unitID
	    end
    end
    
    return visibleSelected

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Shutdown()
    glDeleteShader(shader)
end

function widget:Initialize()

    shader = glCreateShader({
    
	uniform = {
	    edgeExponent = edgeExponent,
	},
	
	vertex = [[
	    // Application to vertex shader
	    varying vec3 normal;
	    varying vec3 eyeVec;
	    varying vec3 color;
	    uniform mat4 camera;
	    uniform mat4 caminv;
	    
	    void main()
	    {
		vec4 P = gl_ModelViewMatrix * gl_Vertex;
		
		eyeVec = P.xyz;
		
		normal  = gl_NormalMatrix * gl_Normal;
		
		color = gl_Color.rgb;
		
		gl_Position = gl_ProjectionMatrix * P;
	    }
	]],  
	
	fragment = [[
	    varying vec3 normal;
	    varying vec3 eyeVec;
	    varying vec3 color;
	    
	    uniform float edgeExponent;
	    
	    void main()
	    {
		float opac = dot(normalize(normal), normalize(eyeVec));
		//opac = 1.0 - abs(opac);
		opac = abs(opac)*2;
		opac = pow(opac, edgeExponent);
		
		gl_FragColor.rgb = color;
		gl_FragColor.a = opac;
	    }
	]],
    })
    
    if (shader == nil) then
	Spring.Log(widget:GetInfo().name, LOG.ERROR, glGetShaderLog())
	spEcho("Xray shader compilation failed.")
	widgetHandler:RemoveWidget()
    end
  
    -- halo
    local stencilBits = gl.GetNumber(GL_STENCIL_BITS)

  if (stencilBits < 1) then
    Spring.Echo('Hardware support not available, quitting')
    widgetHandler:RemoveWidget()
    return
  end

  circleLines = gl.CreateList(function()
    gl.BeginEnd(GL.LINE_LOOP, function()
      local radstep = (2.0 * math.pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        gl.Vertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
    gl.BeginEnd(GL.POINTS, function()
      local radstep = (2.0 * math.pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        gl.Vertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
  end)
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Update()
    local mx, my = GetMouseState()
    type, data = TraceScreenRay(mx, my)

    --visibleUnits, visibleSelected = GetVisibleUnits()
    uCycle = (uCycle + 1) % 4
    if uCycle == 1 then
        visibleSelected = GetVisibleUnits()
    end
end


function widget:DrawWorld()
    if Spring.IsGUIHidden() then return end
    if not( (type == 'feature') or (type == 'unit') or #visibleSelected > 0 ) then
        return
    end
	
	local visUnit,visCloakUnit,n,nc = {},{},1, 1
    for i=1, #visibleSelected do
        local unitID = visibleSelected[i]
        if IsUnitVisible(unitID,nil,true) then
			visUnit[n] = unitID
			n = n+1
        end
    end
    n = n - 1
    nc = nc - 1
	
    -- xray
	
    if (smoothPolys) then
        glSmoothing(nil, nil, true)
    end
    
    glColor(1, 1, 1, 1)
    glUseShader(shader)
    glDepthTest(true)
    glBlending(GL_SRC_ALPHA, GL_ONE)
    glPolygonOffset(-2, -2)
    
    if (n>0) then
        glColor(overlayColor)
		for i=1,n do
            --if unitID and unitID ~= data then
            glUnit(visUnit[i], true)
        end
    end
	
  glPolygonOffset(false)
  glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
  glDepthTest(false)
  glUseShader(0)
  glColor(1, 1, 1, 1)
  
  if (smoothPolys) then
    glSmoothing(nil, nil, false)
  end 
  
end
              

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------