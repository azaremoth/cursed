local objects = {
	"features/modtower/bld_L0_W1.s3o",
	"features/modtower/bld_L0_W2.s3o",
	"features/modtower/bld_L1_W1.s3o",
	"features/modtower/bld_L1_W2.s3o",
	"features/modtower/bld_L2_W1.s3o",
	"features/modtower/bld_L2_W2.s3o",
	"features/modtower/bld_L3_W1.s3o",
	"features/modtower/bld_L3_W2.s3o",
	"features/modtower/bld_L4_W1.s3o",
	"features/modtower/bld_L4_W2.s3o",
	"features/modtower/bld_L5_W1.s3o",
	"features/modtower/bld_L5_W2.s3o",
	"features/modtower/bld_L6_W1.s3o",
	"features/modtower/bld_L6_W2.s3o",
	"features/modtower/bld_L7_W1.s3o",
	"features/modtower/bld_L7_W2.s3o",
	"features/modtower/bld_L8_W1.s3o",
	"features/modtower/bld_L8_W2.s3o",
	"features/modtower/bld_L0_W3.s3o",
	"features/modtower/bld_L0_W4.s3o",
	"features/modtower/bld_L1_W3.s3o",
	"features/modtower/bld_L1_W4.s3o",
	"features/modtower/bld_L2_W3.s3o",
	"features/modtower/bld_L2_W4.s3o",
	"features/modtower/bld_L3_W3.s3o",
	"features/modtower/bld_L3_W4.s3o",
	"features/modtower/bld_L4_W3.s3o",
	"features/modtower/bld_L4_W4.s3o",
	"features/modtower/bld_L5_W3.s3o",
	"features/modtower/bld_L5_W4.s3o",
	"features/modtower/bld_L6_W3.s3o",
	"features/modtower/bld_L6_W4.s3o",
	"features/modtower/bld_L7_W3.s3o",
	"features/modtower/bld_L7_W4.s3o",
	"features/modtower/bld_L8_W3.s3o",
	"features/modtower/bld_L8_W4.s3o",
}

local BuildingModuleDef = {}
local function createBuildingModuleDef(i)
  BuildingModuleDef["buildingwindow_" .. i] = {
     description = [[Window]],
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

for i=1,36 do
  createBuildingModuleDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( BuildingModuleDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------