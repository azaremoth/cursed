--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Chili Theme",
    desc      = "v0.01 Set the Chili theme.",
    author    = "CarRepairer",
    date      = "2010-06-06",
    license   = "GNU GPL, v2 or later",
    layer     = math.huge-2,
    enabled   = true,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local Chili
WG.myteamside = WG.myteamside

local themes = {
	cursed = 'cursed',
	imperials = 'imperials',
}
local cursors = {
	cursed = 'cursed',
	imperials = 'imperials',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function SetTheme()
	local myTeamID = Spring.GetMyTeamID()
	local side
--	Spring.Echo("WG.myteamside")
--	Spring.Echo(WG.myteamside)	
	if not WG.myteamside then -- WG.myteamside may be overwriten by faction selector widget
		side = Spring.GetTeamRulesParam(myTeamID, "side") -- should be defined by api_faction.lua
		if not side then
			WG.myteamside = "imperials"
			side = "imperials"
			Spring.Echo("WARNING: No faction defined by luarules. Imperials theme is used.")
		else 
			WG.myteamside = side
		end
	else 
		side = WG.myteamside
	end

	if not Chili then
		Chili = WG.Chili
	end
	
	if Chili then
		if (themes[side] ~= nil) then
			Chili.theme.skin.general.skinName = themes[side]
		else
			Chili.theme.skin.general.skinName = 'imperial'
		end
	end
	
	if WG.crude and WG.crude.SetCursor then
		if (cursors[side] ~= nil) then
			WG.crude.SetCursor( cursors[side] )
		else
			WG.crude.SetCursor( 'imperial' )
		end
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--[[ chili skin won't change unless windows or luaui gets reloaded
function widget:Update()
	cycle = cycle % 300 +1
	if cycle == 1 then
		SetTheme()
	end
end]]--

function widget:GameFrame(n)
    if n==0 then
		SetTheme()
	elseif n>0 then
		Spring.SendCommands("luaui disablewidget EPIC Menu")
		Spring.SendCommands("luaui disablewidget Chili Integral Menu")
		Spring.SendCommands("luaui disablewidget Chili Resource Bars Classic")
		Spring.SendCommands("luaui disablewidget Chili Chat")
		Spring.SendCommands("luaui disablewidget Chili Selections & CursorTip v2")
		Spring.SendCommands("luaui disablewidget Chili Minimap")
		Spring.SendCommands("luaui disablewidget Context Menu")
		Spring.SendCommands("luaui disablewidget Chili Crude Player List")
		
		Spring.SendCommands("luaui enablewidget EPIC Menu")
		Spring.SendCommands("luaui enablewidget Chili Integral Menu")
		Spring.SendCommands("luaui enablewidget Chili Resource Bars Classic")
		Spring.SendCommands("luaui enablewidget Chili Chat")
		Spring.SendCommands("luaui enablewidget Chili Selections & CursorTip v2")
		Spring.SendCommands("luaui enablewidget Chili Minimap")		
		Spring.SendCommands("luaui enablewidget Context Menu")
		Spring.SendCommands("luaui enablewidget Chili Crude Player List")
		
        widgetHandler:RemoveWidget(self)
    end
end

function widget:Initialize()
	SetTheme()
end


