
function widget:GetInfo()
	return {
		name      = "Build Split",
		desc      = "Splits builds over cons, and vice versa  Deletes Units queues",
		author    = "Niobium 1.0, DJMAD 1.1",
		version   = "v1.1",
		date      = "Nov 05, 2012",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled = true  --  loaded by default?
	}
end

local spGetGameFrame = Spring.GetGameFrame
local spGetSpecState = Spring.GetSpectatingState

local spTestBuildOrder = Spring.TestBuildOrder

local spGetSelUnitCount = Spring.GetSelectedUnitsCount
local spGetSelUnitsSorted = Spring.GetSelectedUnitsSorted

local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGiveOrderToUnitArray = Spring.GiveOrderToUnitArray

local uDefs = UnitDefs

local buildID = 0
local buildLocs = {}
local buildCount = 0

function widget:Initialize()
	if spGetGameFrame() > 0 then
		widget:GameStart()
	end
end

function widget:GameStart()
	
	local areSpec = spGetSpecState()
	if areSpec then
		widgetHandler:RemoveWidget(self)
	end
end



function widget:CommandNotify(cmdID, cmdParams, cmdOpts) -- 3 of 3 parameters
    if not (cmdOpts.shift and cmdOpts.meta) then return false end -- Note: All multibuilds require shift
	-- Bauwerkkontrolle
	-- Spring . Echo ( cmdID , #cmdParams , #cmdOpts, buildCount )	
			
	if spGetSelUnitCount() < 2 then return false end
	
	if #cmdParams < 4 then return false end -- Probably not possible, commented for now
	
	if spTestBuildOrder(-cmdID, cmdParams[1], cmdParams[2], cmdParams[3], cmdParams[4]) == 0 then return false end
	

	
	buildID = -cmdID
	buildOpts = cmdOpts
	buildCount = buildCount + 1
	buildLocs[buildCount] = cmdParams
	
	
	return false
end

function widget:Update() -- 0 of 0 parameters
	
	if buildCount == 0 then return end
	
	local selUnits = spGetSelUnitsSorted()
	selUnits.n = nil
	
	local builders = {}
	local builderCount = 0
	
	for uDefID, uIDs in pairs(selUnits) do
		
		local uBuilds = uDefs[uDefID].buildOptions
		
		for bi=1, #uBuilds do
			
			if uBuilds[bi] == buildID then
				
				for ui=1, #uIDs do
					builderCount = builderCount + 1
					builders[builderCount] = uIDs[ui]
				end
				break
			end
		end
	end
	-- Kontrolle builder zu buildings

	
	
	if buildCount > builderCount then
	--dubug:  Spring . Echo ( "buildcount", buildCount , " / builderCount", builderCount , "ratio", math.floor(buildCount / builderCount ) )			
		local ratio = math.floor(buildCount / builderCount)

		local excess = buildCount - builderCount * ratio -- == buildCount % builderCount
		local buildingInd = 0
		
		for bi=1, #builders do  --clear all commands
		spGiveOrderToUnit(builders[bi], CMD.STOP ,{},{})
		end
		
		for bi=1, builderCount do
			for r=1, ratio do
				buildingInd = buildingInd + 1
				spGiveOrderToUnit(builders[bi], -buildID, buildLocs[buildingInd], {"shift"})
			end
			
			if bi <= excess then
				buildingInd = buildingInd + 1
				spGiveOrderToUnit(builders[bi], -buildID, buildLocs[buildingInd], {"shift"})
			end
		end
	else
	--dubug:  Spring . Echo ( "builderCount", builderCount , "/ buildcount", buildCount ,"ratio", math.floor(builderCount / buildCount) )	
		local ratio = math.floor(builderCount / buildCount)
		local excess = builderCount - buildCount * ratio -- == builderCount % buildCount
		local builderInd = 0
		
		for bi=1, #builders do  --clear all commands
		spGiveOrderToUnit(builders[bi], CMD.STOP ,{},{})
		end
		
		for bi=1, buildCount do
			
			
			local setUnits = {}
			local setCount = 0
			
			for r=1, ratio do
				builderInd = builderInd + 1
				setCount = setCount + 1
				setUnits[setCount] = builders[builderInd]
			end
			
			if bi <= excess then
				builderInd = builderInd + 1
				setCount = setCount + 1
				setUnits[setCount] = builders[builderInd]
			end
			spGiveOrderToUnitArray(setUnits, -buildID, buildLocs[bi], {"shift"})
		end
	end
	
	buildCount = 0
end
