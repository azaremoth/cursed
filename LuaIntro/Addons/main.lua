
if addon.InGetInfo then
	return {
		name    = "Main",
		desc    = "displays a simplae loadbar",
		author  = "jK",
		date    = "2012,2013",
		license = "GPL2",
		layer   = 0,
		depend  = {"LoadProgress"},
		enabled = true,
	}
end

------------------------------------------

local lastLoadMessage = ""

function addon.LoadProgress(message, replaceLastLine)
	lastLoadMessage = message
end

------------------------------------------

local font = gl.LoadFont("FreeSansBold.otf", 50, 20, 1.95)

function addon.DrawLoadScreen()
	local loadProgress = SG.GetLoadProgress()

	local vsx, vsy = gl.GetViewSizes()

	-- draw progressbar
	local hbw = 3.5/vsx
	local vbw = 3.5/vsy
	local hsw = 0.2
	local vsw = 0.2
	gl.BeginEnd(GL.QUADS, function()

		--bar bg
		gl.Color(0,0,0,0.85)
			gl.Vertex(0.2, 0.1)
			gl.Vertex(0.8, 0.1)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.2, 0.15)

		--progress
		gl.Color(0.6,0.6,0.6,0.3)
			gl.Vertex(0.2, 0.1)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.1)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.15)
			gl.Vertex(0.2, 0.15)
		gl.Color(0.7,0.7,0.7,0.1)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.1)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.15)
		gl.Color(0.4,0.4,0.4,0)
			gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress+0.01)) * 0.6, 0.15)
			gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress+0.01)) * 0.6, 0.1)

		--bar borders
		gl.Color(1,1,1,1) --Top Bar
			gl.Vertex(0.2, 0.15)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.8, 0.15-vbw)
			gl.Vertex(0.2, 0.15-vbw)
		gl.Color(1,1,1,1) --Bottom Bar
			gl.Vertex(0.2, 0.10)
			gl.Vertex(0.8, 0.10)
			gl.Vertex(0.8, 0.10+vbw)
			gl.Vertex(0.2, 0.10+vbw)
		gl.Color(1,1,1,1) --Left Side Bar
			gl.Vertex(0.2, 0.1)
			gl.Vertex(0.2, 0.15)
			gl.Vertex(0.2+hbw, 0.15)
			gl.Vertex(0.2+hbw, 0.1)
		gl.Color(1,1,1,1) --Right Side Bar
			gl.Vertex(0.8, 0.1)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.8-hbw, 0.15)
			gl.Vertex(0.8-hbw, 0.1)
	end)


	-- progressbar text
	gl.PushMatrix()
	gl.Scale(1/vsx,1/vsy,1)
		local barTextSize = vsy * (0.05 - 0.015)

		--font:Print(lastLoadMessage, vsx * 0.5, vsy * 0.3, 50, "sc")
		--font:Print(Game.gameName, vsx * 0.5, vsy * 0.95, vsy * 0.07, "sca")
		font:Print(lastLoadMessage, vsx * 0.205, vsy * 0.14, barTextSize * 0.5, "sa")
		if loadProgress>0 then
			font:Print(("%.0f%%"):format(loadProgress * 100), vsx * 0.5, vsy * 0.115, barTextSize, "oc")
		else
			font:Print(" ", vsx * 0.5, vsy * 0.165, barTextSize, "oc")
		end
	gl.PopMatrix()
end


function addon.MousePress(...)
	--Spring.Echo(...)
end


function addon.Shutdown()
	gl.DeleteFont(font)
end
