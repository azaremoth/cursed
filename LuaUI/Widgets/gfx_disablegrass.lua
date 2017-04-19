function widget:GetInfo()
	return {
		name	= "Disable Grass",
		desc	= "Disables Spring Grass (improves FPS)",
		author	= "Some Loser",
		date	= "2012-08-11",
		license	= "GPL v2 or later",
		layer	= 5,
		enabled	= false
	}
end

function widget:Initialize()
	Spring.SetConfigInt("GrassDetail",0)
end

