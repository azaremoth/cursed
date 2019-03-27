local objects = {
	"features/tc_wall_lvl2_1.s3o",
	"features/tc_wall_lvl2_2.s3o",
}

local wallDefs = {}
local function CreateWallDef(i)
  wallDefs["tc_wall_lvl2_" .. i] = {
	object = objects[(i % #objects) + 1] ,
    resurrectable	   = 0,  
    category         = [[dragonteeth]],
    autoreclaimable    = "0",
	mass			   = 10000,
	customparams = { 
		normaltex 		= "unittextures/normalmaps/tc_wall_lvl2_normal.png",
		normalmaps 		= "yes",			
	},
    collisionVolumeType 	= "Box",
    collisionVolumeScales 	= "80 70 10",
    collisionVolumeOffsets 	= "0 0 5",
    damage             = 10000,
    description        = "Perimeter Defense",
    footprintX         = 5,
    footprintZ         = 1,
    height             = "35",
    hitdensity         = "10000",
    energy      	   = 0,
    metal              = 20,
    reclaimTime 	   = 25,	
    world              = "allworld",
    blocking           = true, 
    burnable    	   = false,
    nodrawundergray    = true,  	
    reclaimable        = true,	
	upright 	       = true,	
  }
end

for i=1,2 do
  CreateWallDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( wallDefs )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
