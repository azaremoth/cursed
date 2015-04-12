
function gadget:GetInfo()
	return {
		name = "Sinking Wrecks",
		desc = "Make wrecks sink into the ground like in all those dumb commercial R.T.S. (modified for The Cursed)",
		author = "zwzsg",
		date = "3rd of May 2010",
		license = "Free",
		layer = 0,
		version = 1,
		enabled = true
	}
end

-- modified the script: only corpses with the customParam "featuredecaytime" will disappear

if (gadgetHandler:IsSyncedCode()) then

	-- Configuration:
	local SinkDurationTime = 15*30 -- In frame (10 seconds x 30 frames per seconds)
	local function isWreck(FeatureID) return FeatureDefs[Spring.GetFeatureDefID(FeatureID)].resurrectable end
	local SinkBeginTimeMultiplier = 1

	-- Now the code:
	local WreckList={}
	local WreckSinkBeginList={}
	
	function gadget:Initialize()
		SinkBeginTimeMultiplier = Spring.GetModOptions().corpsetime
		if (SinkBeginTimeMultiplier == nil) then
			SinkBeginTimeMultiplier = 1
		end
	end	
	
	function gadget:FeatureCreated(FeatureID)
		if isWreck(FeatureID) then
			local fdid = Spring.GetFeatureDefID(FeatureID)
			local CustomSinkBeginTime = FeatureDefs[fdid].customParams.featuredecaytime
			if CustomSinkBeginTime ~= nil then
				WreckList[FeatureID]={BirthFrame=Spring.GetGameFrame()}
				local SetSinkBeginTime = 30*CustomSinkBeginTime*SinkBeginTimeMultiplier
				if SetSinkBeginTime == 0 then
					SetSinkBeginTime = 1
				end
				WreckSinkBeginList[FeatureID]=SetSinkBeginTime
			end
		end
	end

	function gadget:FeatureDestroyed(FeatureID)
		if WreckList[FeatureID] then
			WreckList[FeatureID]=nil
		end
	end

	function gadget:GameFrame(frame)
		for WreckID,WreckSinkInfo in pairs(WreckList) do
			local x,y,z=Spring.GetFeaturePosition(WreckID)
			local fdid = Spring.GetFeatureDefID(WreckID)
				SinkBeginTime=WreckSinkBeginList[WreckID]
				if WreckSinkInfo.SinkIncrement then
					if Spring.GetGroundHeight(x,z)>WreckSinkInfo.y+WreckSinkInfo.h then
						Spring.DestroyFeature(WreckID)
					else
						WreckSinkInfo.y=WreckSinkInfo.y-WreckSinkInfo.SinkIncrement
						Spring.SetFeaturePosition(WreckID,x,WreckSinkInfo.y,z,false)
					end
				elseif frame>=WreckSinkInfo.BirthFrame+SinkBeginTime then
					WreckSinkInfo.h=1.1*math.max(Spring.GetFeatureHeight(WreckID),Spring.GetFeatureRadius(WreckID))
					WreckSinkInfo.y=y
					WreckSinkInfo.SinkIncrement=(y-Spring.GetGroundHeight(x,z)+WreckSinkInfo.h)/SinkDurationTime
				end
		end
	end

end
