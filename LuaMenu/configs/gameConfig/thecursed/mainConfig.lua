local shortname = "tc"

local mapWhitelist       = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/mapWhitelist.lua")
local aiBlacklist        = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/aiBlacklist.lua")
local aiSimpleNames      = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/aiSimpleName.lua")
local singleplayerConfig = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/singleplayerMenu.lua")
local skirmishDefault    = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skirmishDefault.lua")
local defaultModoptions  = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/ModOptions.lua")
local rankFunction       = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/zk/rankFunction.lua")
local backgroundConfig   = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/skinConfig.lua")

local settingsConfig, settingsDefault = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/settingsMenu.lua")

local headingLarge    = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/headingLarge.png"
local headingSmall    = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/headingSmall.png"
local backgroundImage = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/background.jpg"
local taskbarIcon     = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/taskbarLogo.png"

local background = {
	image           = backgroundImage,
	backgroundFocus = backgroundConfig.backgroundFocus,
}

local minimapOverridePath  = LUA_DIRNAME .. "configs/gameConfig/zk/minimapOverride/"
local minimapThumbnailPath = LUA_DIRNAME .. "configs/gameConfig/zk/minimapThumbnail/"

---------------------------------------------------------------------------------
-- Getters
---------------------------------------------------------------------------------

local externalFuncAndData = {
	dirName                = "thecursed",
	name                   = "The Cursed",
	--_defaultGameArchiveName = "??", fill this in.
	_defaultGameRapidTag   = "thecursed:latest", -- Do not read directly
	mapWhitelist           = mapWhitelist,
	aiBlacklist            = aiBlacklist,
	settingsConfig         = settingsConfig,
	settingsDefault        = settingsDefault,
	singleplayerConfig     = singleplayerConfig,
	helpSubmenuConfig      = {},
	skirmishDefault        = skirmishDefault,
	defaultModoptions      = defaultModoptions,
	rankFunction           = rankFunction,
	headingLarge           = headingLarge,
	headingSmall           = headingSmall,
	taskbarIcon            = taskbarIcon,
	background             = background,
	minimapOverridePath    = minimapOverridePath,
	minimapThumbnailPath   = minimapThumbnailPath,
}

function externalFuncAndData.CheckAvailability()
	return true
end

return externalFuncAndData
