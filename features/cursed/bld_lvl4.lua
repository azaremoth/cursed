local objects = {
	"features/modtower/bld_L4_1.s3o",
	"features/modtower/bld_L4_2.s3o",
	"features/modtower/bld_L4_3.s3o",
	"features/modtower/bld_L4_4.s3o",
	"features/modtower/bld_L4_5.s3o",
	"features/modtower/bld_L4_6.s3o",
	"features/modtower/bld_L4_7.s3o",
	"features/modtower/bld_L4_8.s3o",		
}

local BuildingModuleDef = {}
local function createBuildingModuleDef(i)
  BuildingModuleDef["buildingmodule_lvl4_" .. i] = {
     description = [[Building]],
	 autoreclaimable = false,
     blocking    = true,
     burnable    = false,
     nodrawundergray = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object = objects[(i % #objects) + 1] ,
     footprintX  = 6,
     footprintZ  = 6,
	 collisionVolumeType 	= "Box",
	 collisionVolumeScales 	= "145 55 115",
  	 collisionVolumeOffsets 	= "0 -8 0", 
	 customparams = { 
			normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		= "yes",			
		},  
  }
end

for i=1,8 do
  createBuildingModuleDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( BuildingModuleDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------