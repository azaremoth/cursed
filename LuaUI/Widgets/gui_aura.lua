--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Indicates auras",
    desc      = "Draws a circle around units under aura influence",
    author    = "trepan, aZaremoth",
    date      = "Apr 16, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Automatically generated local definitions

local GL_LINE_LOOP           = GL.LINE_LOOP
local GL_TRIANGLE_FAN        = GL.TRIANGLE_FAN
local glBeginEnd             = gl.BeginEnd
local glColor                = gl.Color
local glCreateList           = gl.CreateList
local glDeleteList           = gl.DeleteList
local glDepthTest            = gl.DepthTest
local glDepthMask			 = gl.DepthMask
local glDrawListAtUnit       = gl.DrawListAtUnit
local glLineWidth            = gl.LineWidth
local glPolygonOffset        = gl.PolygonOffset
local glVertex               = gl.Vertex
local spDiffTimers           = Spring.DiffTimers
local spGetAllUnits          = Spring.GetAllUnits
local spGetGroundNormal      = Spring.GetGroundNormal
local spGetSelectedUnits     = Spring.GetSelectedUnits
local spGetTeamColor         = Spring.GetTeamColor
local spGetTimer             = Spring.GetTimer
local spGetUnitBasePosition  = Spring.GetUnitBasePosition
local spGetUnitDefDimensions = Spring.GetUnitDefDimensions
local spGetUnitDefID         = Spring.GetUnitDefID
local spGetUnitRadius        = Spring.GetUnitRadius
local spGetUnitTeam          = Spring.GetUnitTeam
local spGetUnitViewPosition  = Spring.GetUnitViewPosition
local spIsUnitSelected       = Spring.IsUnitSelected
local spIsUnitVisible        = Spring.IsUnitVisible
local spSendCommands         = Spring.SendCommands
local spGetVisibleUnits      = Spring.GetVisibleUnits

local ScaleCircle = {
	[UnitDefNames.euf_transport.id] = "euf_transport",
	}
local noDraw = {
	[UnitDefNames.burrowcrust.id] = "burrowcrust",
	}
	
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function SetupCommandColors(state)
  local alpha = state and 1 or 0
  local f = io.open('cmdcolors.tmp', 'w+')
  if (f) then
    f:write('unitBox  0 1 0 ' .. alpha)
    f:close()
    spSendCommands({'cmdcolors cmdcolors.tmp'})
  end
  os.remove('cmdcolors.tmp')
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local teamColors = {}

local trackSlope = true
local SmallAlpha = 0.20
local LargeAlpha = 0.25

local circleLines  = 0
local circlePolys  = 0
local circleDivs   = 12

local circleLargeLines  = 0
local circleLargePolys  = 0
local circleLargeDivs   = 64

local circleOffset = 0

local startTimer = spGetTimer()

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Initialize()

  circleLines = glCreateList(function()
    glBeginEnd(GL_LINE_LOOP, function()
      local radstep = (2.0 * math.pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        glVertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
  end)

  circlePolys = glCreateList(function()
    glBeginEnd(GL_TRIANGLE_FAN, function()
      local radstep = (2.0 * math.pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        glVertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
  end)

  circleLargeLines = glCreateList(function()
    glBeginEnd(GL_LINE_LOOP, function()
      local radstep = (2.0 * math.pi) / circleLargeDivs
      for i = 1, circleLargeDivs do
        local a = (i * radstep)
        glVertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
  end)

  circleLargePolys = glCreateList(function()
    glBeginEnd(GL_TRIANGLE_FAN, function()
      local radstep = (2.0 * math.pi) / circleLargeDivs
      for i = 1, circleLargeDivs do
        local a = (i * radstep)
        glVertex(math.sin(a), circleOffset, math.cos(a))
      end
    end)
  end)  
  
  
  
  
  SetupCommandColors(false)
end


function widget:Shutdown()
  glDeleteList(circleLines)
  glDeleteList(circlePolys)
  glDeleteList(circleLargeLines)
  glDeleteList(circleLargePolys)
  SetupCommandColors(true)
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local realRadii = {}


local function GetUnitDefRealRadius(udid)
  local radius = realRadii[udid]
  if (radius) then
    return radius
  end

  local ud = UnitDefs[udid]
  if (ud == nil) then return nil end

  local dims = spGetUnitDefDimensions(udid)
  if (dims == nil) then return nil end

  local scale = ud.hitSphereScale -- missing in 0.76b1+
  scale = ((scale == nil) or (scale == 0.0)) and 1.0 or scale
  radius = dims.radius / scale
  realRadii[udid] = radius
  return radius
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local teamColors = {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:DrawWorldPreUnit()
  glLineWidth(3.0)
  glPolygonOffset(-100, -2)
  glDepthTest(true)
  glDepthMask(true)
  
  local Gaia = Spring.GetGaiaTeamID()
  local lastColorSet = nil
  for _,unitID in ipairs(spGetVisibleUnits(-1,nil,false)) do
      local teamID = spGetUnitTeam(unitID)
      if (teamID and teamID ~= Gaia) then
	  	local udid = spGetUnitDefID(unitID)
		if not noDraw [udid] and Spring.IsUnitSelected(unitID) then
--------------------------------------------
			if Spring.GetUnitRulesParam(unitID,'Hero Aura') == 1 then
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 1, 0, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.05, 1.0, radius*1.05, degrot, gz, 0, -gx)
				end
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Hero Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Hero Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 1, 0, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------
			if Spring.GetUnitRulesParam(unitID,'Frenzy Aura') == 1 then
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.2, 0, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.1, 1.0, radius*1.1, degrot, gz, 0, -gx)
				end		
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Frenzy Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Frenzy Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.2, 0, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------
			if Spring.GetUnitRulesParam(unitID,'Heal Aura') == 1 then
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.2, 1, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.15, 1.0, radius*1.15, degrot, gz, 0, -gx)
				end		
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Heal Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Heal Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.2, 0, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------			
			if Spring.GetUnitRulesParam(unitID,'Focus Aura') == 1 then
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end			
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 0, 1, 1, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.2, 1.0, radius*1.2, degrot, gz, 0, -gx)
				end		
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Focus Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Focus Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 0, 1, 1, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------		
			if Spring.GetUnitRulesParam(unitID,'Fear Aura') == 1 then
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end			
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.5, 0.5, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.25, 1.0, radius*1.25, degrot, gz, 0, -gx)
				end		
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Fear Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Fear Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 0.5, 0.5, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------			
			if Spring.GetUnitRulesParam(unitID,'Curse Aura') == 1 then		
				local radius = GetUnitDefRealRadius(udid)			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end			
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 1, 1, SmallAlpha })
					glDrawListAtUnit(unitID, circleLines, true, radius*1.3, 1.0, radius*1.3, degrot, gz, 0, -gx)
				end		
			end
-----------		
			if Spring.GetUnitRulesParam(unitID,'has_Curse Aura') == 1 then
				local radius = Spring.GetUnitRulesParam(unitID,'Curse Aura_range')			
				if (radius) then
					if ScaleCircle [udid] then
						radius = radius*5
					end
					local x, y, z = spGetUnitBasePosition(unitID)
					local gx, gy, gz = spGetGroundNormal(x, z)
					local degrot = math.acos(gy) * 180 / math.pi
					glColor({ 1, 1, 1, LargeAlpha })
					glDrawListAtUnit(unitID, circleLargeLines, true, radius, 1.0, radius, degrot, gz, 0, -gx)
				end
			end
--------------------------------------------		
		end
     end
  end

  glPolygonOffset(false)
  glDepthTest(false)
end
              

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
