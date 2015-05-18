

function gadget:GetInfo()
	return {
		name = "K.O.T.H.",
		desc = "Manage KOTH mode",
		author = "zwzsg, aZaremoth",
		date = "20 january 2011",
		license = "Free",
		layer = 0,
		enabled = true
	}
end

local mokey="koth" -- Mod Option Key
local mokeyradius="kothr"

if (gadgetHandler:IsSyncedCode()) then
--SYNCED

	local Gauges = {}
	local CountsPerTeam = {}
	local Started = true
	local Finished = false
	local MapCenterX,MapCenterZ=Game.mapSizeX/2,Game.mapSizeZ/2
	local MaxGauge = 0
	local CenterRadius = 300
	local GaiaTeamID = Spring.GetGaiaTeamID()
	local MostCentralUnitsInTeam = nil
	local TeamsInGameList = Spring.GetTeamList()

	local function isUnitComplete(UnitID)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(UnitID)
		if buildProgress and buildProgress>=1 then
			return true
		else
			return false
		end
	end

	function gadget:Initialize()
		if Spring.GetModOptions()[mokey]==nil or Spring.GetModOptions()[mokey]=="0" then
			gadgetHandler:RemoveGadget()
		else		
			MaxGauge=60*tonumber(Spring.GetModOptions()[mokey])
			if (Spring.GetModOptions()[mokeyradius] ~= nil) then
				CenterRadius = tonumber(Spring.GetModOptions()[mokeyradius])
			end
			for _,team in ipairs(TeamsInGameList) do
				Gauges[team]=0
			end
			local crystals = Spring.CreateUnit("crystals", MapCenterX,0,MapCenterZ, 0, GaiaTeamID)
			local crystalcircle1 = Spring.CreateFeature("crystal", MapCenterX+CenterRadius,0,MapCenterZ, math.random(3), GaiaTeamID)
			local crystalcircle2 = Spring.CreateFeature("crystal", MapCenterX-CenterRadius,0,MapCenterZ, math.random(3), GaiaTeamID)
			local crystalcircle3 = Spring.CreateFeature("crystal", MapCenterX,0,MapCenterZ+CenterRadius, math.random(3), GaiaTeamID)
			local crystalcircle4 = Spring.CreateFeature("crystal", MapCenterX,0,MapCenterZ-CenterRadius, math.random(3), GaiaTeamID)
			local crystalcircle5 = Spring.CreateFeature("crystal2", MapCenterX+(CenterRadius*0.71),0,MapCenterZ+(CenterRadius*0.71), math.random(3), GaiaTeamID)
			local crystalcircle6 = Spring.CreateFeature("crystal2", MapCenterX+(CenterRadius*0.71),0,MapCenterZ-(CenterRadius*0.71), math.random(3), GaiaTeamID)			
			local crystalcircle7 = Spring.CreateFeature("crystal2", MapCenterX-(CenterRadius*0.71),0,MapCenterZ+(CenterRadius*0.71), math.random(3), GaiaTeamID)			
			local crystalcircle8 = Spring.CreateFeature("crystal2", MapCenterX-(CenterRadius*0.71),0,MapCenterZ-(CenterRadius*0.71), math.random(3), GaiaTeamID)			
		end
	end

	function gadget:GameFrame(f)
		if f%30==0 and Started and not Finished then
			local UnitsAroundCenter = Spring.GetUnitsInCylinder(MapCenterX,MapCenterZ,CenterRadius)
			for _,team in ipairs(TeamsInGameList) do
				CountsPerTeam[team] = 0
			end
			for _,cUnitID in ipairs(UnitsAroundCenter) do
				local cUnitTeamID = Spring.GetUnitTeam(cUnitID)
				CountsPerTeam[cUnitTeamID] = CountsPerTeam[cUnitTeamID]+1
			end
			for _,team in ipairs(TeamsInGameList) do
				if (MostCentralUnitsInTeam == nil) then
					MostCentralUnitsInTeam = team
				elseif (CountsPerTeam[team] > CountsPerTeam[MostCentralUnitsInTeam]) then
					MostCentralUnitsInTeam = team
				elseif (CountsPerTeam[team] == CountsPerTeam[GaiaTeamID]) and (team ~= GaiaTeamID) then
					MostCentralUnitsInTeam = team
				end
			end
--			Spring.Echo(MostCentralUnitsInTeam)
			if MostCentralUnitsInTeam then
				local team=MostCentralUnitsInTeam
				if (team ~= GaiaTeamID) then
					Gauges[team]=Gauges[team]+1
					_G.KOTH={Started=Started,MaxGauge=MaxGauge,Gauges=Gauges,LastTeam=team,LastX=x,LastY=y,LastZ=z}
					if Gauges[team]>=MaxGauge then
						Finished=true
						local names=nil
						for _,pid in ipairs(Spring.GetPlayerList(team,true)) do
							names=(names and names.."," or "").."<PLAYER"..pid..">"
						end
						Spring.SendMessage("Team"..team.."("..(names and names or "")..") won King Of The Hill!")
						for _,u in ipairs(Spring.GetAllUnits()) do
							if not Spring.AreTeamsAllied(Spring.GetUnitTeam(u),team)  then
								local x,y,z=Spring.GetUnitPosition(u)
								Spring.SpawnCEG("SUMMONDRAGON2",x,y,z,0,1,0,900,85000)
								Spring.DestroyUnit(u,true,false,u)
							end
						end
					end
				end
			end
		end
	end

else
--UNSYNCED

	local GaugeSY,GaugeSX,GaugeSZ,GaugeX0,GaugeZ0,TeamList=64*8,64,64,0,0,{}
	local GaiaTeamID = Spring.GetGaiaTeamID()
	
	function gadget:Initialize()
		if Spring.GetModOptions()[mokey]==nil or Spring.GetModOptions()[mokey]=="0" then
			gadgetHandler:RemoveGadget()
		else
			for _,team in ipairs(Spring.GetTeamList()) do
				if (team ~= GaiaTeamID) then
					table.insert(TeamList,team)
				end
			end
			GaugeX0=Game.mapSizeX/2-GaugeSX*#TeamList/2
			GaugeZ0=Game.mapSizeZ/2-GaugeSZ/2
		end
	end

	local function DrawSolidGauges()
		local x,y0,z1,z2=GaugeX0,1+Spring.GetGroundHeight(GaugeX0,GaugeZ0),GaugeZ0,GaugeZ0+GaugeSZ
		local function MuchBrighter(v)
			return 0.5+0.5*v
		end
		local function BitBrighter(v)
			return 0.25+0.75*v
		end
		local function BitDarker(v)
			return 0.75*v
		end
		for _,team in ipairs(TeamList) do
			if (team ~= GaiaTeamID) then
				local r,g,b,a=Spring.GetTeamColor(team)
				local y1=y0+GaugeSY*SYNCED.KOTH.Gauges[team]/SYNCED.KOTH.MaxGauge
				local x1,x2=x,x+GaugeSX
				--gl.Color(r,g,b,1)

				gl.Color(BitDarker(r),BitDarker(g),BitDarker(b),0.5)
				gl.Vertex(x1,y0,z1)
				gl.Vertex(x1,y1,z1)
				gl.Vertex(x1,y1,z2)
				gl.Vertex(x1,y0,z2)

				gl.Color(BitBrighter(r),BitBrighter(g),BitBrighter(b),0.5)
				gl.Vertex(x1,y0,z1)
				gl.Vertex(x1,y1,z1)
				gl.Vertex(x2,y1,z1)
				gl.Vertex(x2,y0,z1)

				gl.Color(BitDarker(r),BitDarker(g),BitDarker(b),0.5)
				gl.Vertex(x2,y0,z1)
				gl.Vertex(x2,y1,z1)
				gl.Vertex(x2,y1,z2)
				gl.Vertex(x2,y0,z2)

				gl.Color(BitBrighter(r),BitBrighter(g),BitBrighter(b),0.5)
				gl.Vertex(x1,y0,z2)
				gl.Vertex(x1,y1,z2)
				gl.Vertex(x2,y1,z2)
				gl.Vertex(x2,y0,z2)

				gl.Color(MuchBrighter(r),MuchBrighter(g),MuchBrighter(b),0.5)
				gl.Vertex(x1,y1,z1)
				gl.Vertex(x1,y1,z2)
				gl.Vertex(x2,y1,z2)
				gl.Vertex(x2,y1,z1)

				x=x+GaugeSX
			end
		end
	end

	local function DrawWireGauges()
		local x,y0,z1,z2=GaugeX0,1+Spring.GetGroundHeight(GaugeX0,GaugeZ0),GaugeZ0,GaugeZ0+GaugeSZ
		local y2=y0+GaugeSY
		local r,g,b,a=Spring.GetTeamColor(SYNCED.KOTH.LastTeam)
		gl.Color(r,g,b,0.75)
		for _,team in ipairs(TeamList) do
			if (team ~= GaiaTeamID) then
				local y1=y0+GaugeSY*SYNCED.KOTH.Gauges[team]/SYNCED.KOTH.MaxGauge
				local x1,x2=x,x+GaugeSX
				gl.Vertex(x1,y1,z1)
				gl.Vertex(x1,y2,z1)
				gl.Vertex(x1,y1,z2)
				gl.Vertex(x1,y2,z2)
				gl.Vertex(x2,y1,z1)
				gl.Vertex(x2,y2,z1)
				gl.Vertex(x2,y1,z2)
				gl.Vertex(x2,y2,z2)
				gl.Vertex(x1,y2,z1)
				gl.Vertex(x1,y2,z2)
				gl.Vertex(x1,y2,z2)
				gl.Vertex(x2,y2,z2)
				gl.Vertex(x2,y2,z2)
				gl.Vertex(x2,y2,z1)
				gl.Vertex(x2,y2,z1)
				gl.Vertex(x1,y2,z1)
				x=x+GaugeSX
			end
		end
	end

--[[
		gl.Material({
			ambient   = {0.1,0.1,0.1,1},
			diffuse   = {0.6,0.6,0.6,1},
			ambidiff  = {0,0,0,1},
			emission  = {0,0,0,1},
			specular  = {0,0,0,1},
			shininess = 0,
		})
		gl.Lighting(true)
		gl.Light(0,true)
		gl.Light(0,GL.POSITION,gl.GetSun("pos"))
		gl.Light(0,GL.AMBIENT,gl.GetSun("ambient"))
		gl.Light(0,GL.DIFFUSE,gl.GetSun("diffuse"))
		gl.Light(0,GL.SPECULAR,0,0,0)
]]--

	local function DrawHexGauges()
		gl.PushAttrib(GL.ALL_ATTRIB_BITS)
		gl.DepthTest(true)
		gl.DepthMask(true)
		gl.Texture(false)
		gl.Color(1,1,1,1)
		gl.BeginEnd(GL.QUADS,DrawSolidGauges)
		gl.BeginEnd(GL.LINES,DrawWireGauges)
		gl.Color(1,1,1,1)
		gl.Texture(false)
		gl.DepthMask(false)
		gl.DepthTest(false)
		gl.PopAttrib()
	end

	function gadget:DrawWorld()
		if SYNCED.KOTH then
			DrawHexGauges()
		end
	end

end
