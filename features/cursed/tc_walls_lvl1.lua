-- $Id$

local objects = {
	"features/tc_wall_lvl1_1.s3o",
	"features/tc_wall_lvl1_2.s3o",
	"features/tc_wall_lvl1_3.s3o",	
}

local treeDefs = {}
local function CreateWallDef(i)
  treeDefs["tc_wall_lvl1_" .. i] = {
	object = objects[(i % #objects) + 1] ,
    resurrectable	   = 0,  
    category         = [[dragonteeth]],
    autoreclaimable    = "0",
	mass			   = 1500,
	customparams = { 	}, 		
    damage             = 2400,
    description        = "Perimeter Defense",
    footprintX         = 1,
    footprintZ         = 1,
    height             = "30",
    hitdensity         = "1000",
    energy      	   = 0,
    metal              = 8,
    reclaimTime 	   = 25,	
    world              = "allworld",
    blocking           = true, 
    burnable    	   = false,
    nodrawundergray    = true,  	
    reclaimable        = true,	
	upright 	       = false,	
  }
end

for i=0,3 do
  CreateWallDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( treeDefs )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------