function widget:GetInfo()
  return {
    name      = "Louder Unit Sounds",
    desc      = "Louder Unit Sounds",
    author    = "azaremoth",
    date      = "22 Okt 2011",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
	alwaysStart = true,	
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local originalvolume = ((Spring.GetConfigString("snd_volunitreply") or 100) / 100)

function widget:Initialize()
	Spring.SetConfigString("snd_volunitreply", 700)
end

function widget:GameOver()
	Spring.SetConfigString("snd_volunitreply", originalvolume)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------