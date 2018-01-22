--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Chili Theme",
    desc      = "v0.01 Set the Chili theme.",
    author    = "CarRepairer",
    date      = "2010-06-06",
    license   = "GNU GPL, v2 or later",
    layer     = -1000,
    enabled   = false,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local echo = Spring.Echo

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local Chili

local themes = {
	cursed = 'Bones',
	imperials = 'Imperial',
}
local cursors = {
	cursed = 'cursed',
	imperials = 'imperial',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function SetTheme()
	local myTeamID = Spring.GetMyTeamID()
	local side = WG.faction or Spring.GetTeamRulesParam(myTeamID, "side") or select(5, Spring.GetTeamInfo(myTeamID)) or "cursed"

	if not Chili then
		Chili = WG.Chili
	end
	
	if Chili then
		if (themes[side] ~= nil) then
			Chili.theme.skin.general.skinName = themes[side]
		else
			Chili.theme.skin.general.skinName = 'Bones'
		end
	end
	
	if WG.crude and WG.crude.SetCursor then
		if (cursors[side] ~= nil) then
			WG.crude.SetCursor( cursors[side] )
		else
			WG.crude.SetCursor( 'cursed' )
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
        widgetHandler:RemoveWidget(self)
    end
end

function widget:Initialize()
	SetTheme()
end


