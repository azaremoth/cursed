local objects = {
	"features/euf_wall_lvl1_1.s3o",
	"features/euf_wall_lvl1_2.s3o",
	"features/euf_wall_lvl1_3.s3o",	
}

local wallDefs = {}
local function CreateWallDef(i)
  wallDefs["euf_wall_lvl1_" .. i] = {
	object = objects[(i % #objects) + 1] ,
    resurrectable	   = 0,  
    category         = [[dragonteeth]],
    autoreclaimable    = "0",
	mass			   = 1500,
	collisionVolumeOffsets 	= "0 0 0",
	collisionVolumeScales 	= "30 27 30",
	collisionVolumeType 	= "CylY",	
	customparams = { 
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
	}, 		
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

for i=1,3 do
  CreateWallDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( wallDefs )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------