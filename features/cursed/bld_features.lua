local objects = {
	"features/modtower/bld_L0_F1.s3o",
	"features/modtower/bld_L0_F2.s3o",
	"features/modtower/bld_L1_F1.s3o",
	"features/modtower/bld_L1_F2.s3o",
	"features/modtower/bld_L2_F1.s3o",
	"features/modtower/bld_L2_F2.s3o",
	"features/modtower/bld_L3_F1.s3o",
	"features/modtower/bld_L3_F2.s3o",
	"features/modtower/bld_L4_F1.s3o",
	"features/modtower/bld_L4_F2.s3o",
	"features/modtower/bld_L5_F1.s3o",
	"features/modtower/bld_L5_F2.s3o",
	"features/modtower/bld_L6_F1.s3o",
	"features/modtower/bld_L6_F2.s3o",
	"features/modtower/bld_L7_F1.s3o",
	"features/modtower/bld_L7_F2.s3o",
	"features/modtower/bld_L8_F1.s3o",
	"features/modtower/bld_L8_F2.s3o",
}

local BuildingModuleDef = {}
local function createBuildingModuleDef(i)
  BuildingModuleDef["buildingfeature_" .. i] = {
     description = [[Building Attachment]],
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
     footprintX  = 1,
     footprintZ  = 1,
--	 collisionVolumeType 	= "Box",
--	 collisionVolumeScales 	= "3 3 3",
--	 collisionVolumeOffsets 	= "0 0 0", 
	 customparams = { 
			normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		= "yes",			
		},  
  }
end

for i=1,18 do
  createBuildingModuleDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( BuildingModuleDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------