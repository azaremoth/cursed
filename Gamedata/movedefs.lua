
local moveDefs = {

	WALKER2X2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 40,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},
	WALKER3X3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 40,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},
	HEAVYWALKER2X2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 80,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 1250,
	},
	CLIMBER3X3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 30,
		maxslope = 90,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},
	Trooper1X1 = {
		footprintx = 1,
		footprintz = 1,
		maxwaterdepth = 30,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},	
	Trooper2X2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 30,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},
	Trooper3X3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 35,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 4,		
		crushStrength = 0,
	},	
	SubTrooper2X2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 255,
		maxslope = 30,
		depthmod = 0.1,
		slopemod = 4,		
		crushStrength = 0,
	},	
	SMALLHOVER2x2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 255,
		badslope = 30,
		maxslope = 30,
		badwaterslope = 255,
		maxwaterslope = 255,		
		slopemod = 4,
		depthmod = 0.1,		
		crushStrength = 0,
	},		
	TANKHOVER3x3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 255,
		badslope = 25,
		maxslope = 25,
		badwaterslope = 255,
		maxwaterslope = 255,		
		slopemod = 4,
		depthmod = 0.1,		
		crushStrength = 0,
	},	
	ULTRAHEAVYWALKER4X4 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 40,
		maxslope = 25,
		depthmod = 0.1,
		slopemod = 10,		
		crushStrength = 2500,
	},	
	TANK4X4 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 40,
		maxslope = 25,
		depthmod = 0.1,		
		slopemod = 20,		
		crushStrength = 2500,
	},	
	TANK3X3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 40,
		maxslope = 25,
		depthmod = 0.1,		
		slopemod = 20,		
		crushStrength = 2500,
	},		
	TANK2X2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 40,
		maxslope = 25,
		depthmod = 0.1,		
		slopemod = 40,		
		crushStrength = 1250,
	},
	TANK2X2_AMP = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 999,
		maxslope = 25,
		depthmod = 0.1,		
		slopemod = 40,		
		crushStrength = 1250,
	},	
	LIGHTTANK3X3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 30,
		maxslope = 30,
		depthmod = 0.1,		
		slopemod = 20,		
		crushStrength = 1250,
	},		
	SUBTERRAIN = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 999,
		maxslope = 90,
		depthmod = 0.1,		
		slopemod = 0,		
		crushStrength = 0,
	},
--[[	UBOAT = {
		footprintx = 3,
		footprintz = 3,
        minwaterdepth = 10,
		maxwaterdepth = 100000,
		crushstrength = 5,
		subMarine = 1,
	},]]
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- convert from map format to the expected array format

local array = {}
local i = 1
for k,v in pairs(moveDefs) do
	v.heatmapping = false -- disable heatmapping
	array[i] = v
	v.name = k
	i = i + 1
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return array

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

