function gadget:GetInfo()
	return {
		name      = "Spawner",
		desc      = "Spawns Features and Units",
		author    = "Gnome, Smoth",
		date      = "August 2008",
		license   = "PD",
		layer     = -5,
		enabled   = true  --  loaded by default?
	}
end

	local	SetUnitNeutral			= Spring.SetUnitNeutral
	local	SetUnitBlocking			= Spring.SetUnitBlocking
	local   SetUnitRotation 		= Spring.SetUnitRotation
	local	SetUnitAlwaysVisible	= Spring.SetUnitAlwaysVisible
	local	CreateUnit				= Spring.CreateUnit
	local	CreateFeature			= Spring.CreateFeature
	local	updateFrame		= 10

	local	featurecfg 
	local	mapProfile
	local	featureslist	= {}
	local	buildinglist	= {}
	local	unitlist		= {}	
	
if (gadgetHandler:IsSyncedCode()) then

	function gadget:Initialize()
	
		if VFS.FileExists("config/featureconfig.lua") then
			featurecfg = VFS.Include("config/featureconfig.lua")
			
			featureslist	= featurecfg.objectlist
			buildinglist	= featurecfg.buildinglist
			unitlist		= featurecfg.unitlist
		else
			Spring.Echo("missing file: config/featureconfig.lua")
			Spring.Echo("No features loaded")
		end
		
	end
		
	function gadget:GameFrame(n)
		if ( featurecfg ~= nil ) then
			if n == updateFrame then
				gaiaID = Spring.GetGaiaTeamID()
					
				if ( featureslist )	then
					for i,fDef in pairs(featureslist) do
						local flagID = CreateFeature(fDef.name, fDef.x, 0, fDef.z)
					end
				end
				
				if ( buildinglist )	then	
					for i,uDef in pairs(unitlist) do
						local flagID = CreateUnit(uDef.name, uDef.x, 0, uDef.z, 0, gaiaID)
						SetUnitRotation(flagID, 0, -uDef.rot * math.pi / 32768, 0)
						SetUnitNeutral(flagID,true)
						SetUnitAlwaysVisible(flagID,true)
						SetUnitBlocking(flagID,true)
					end
				end
				
				if ( buildinglist )	then
					for i,bDef in pairs(buildinglist) do
						local flagID = CreateUnit(bDef.name, bDef.x, 0, bDef.z, bDef.rot, gaiaID)
						SetUnitNeutral(flagID,true)
						SetUnitAlwaysVisible(flagID,true)
						SetUnitBlocking(flagID,true)
					end
				end	
				
				gadgetHandler:RemoveGadget()
			end 
		end	
	end--end GameFrame()	
end --end synced