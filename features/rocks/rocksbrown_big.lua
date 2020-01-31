local objects = {
	"features/rocksbrown/rocks_big1.s3o",
	"features/rocksbrown/rocks_big2.s3o",
	"features/rocksbrown/rocks_big3.s3o",
	"features/rocksbrown/rocks_big4.s3o",
	"features/rocksbrown/rocks_big5.s3o",
	"features/rocksbrown/rocks_big6.s3o",
	"features/rocksbrown/rocks_big7.s3o",
	"features/rocksbrown/rocks_big8.s3o",
	"features/rocksbrown/rocks_big9.s3o",
}

local BuildingModuleDef = {}
local function createBuildingModuleDef(i)
  BuildingModuleDef["brownrock" .. i] = {
     description = [[Brown rocks]],
	 autoreclaimable = false,
     blocking    = true,
     burnable    = false,
     nodrawundergray = false,
     reclaimable = true,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 10000,
     metal       = 100,
     reclaimTime = 10000,
     mass        = 9999999999,
     object = objects[(i % #objects) + 1] ,
     footprintX  = 8,
     footprintZ  = 8,
	 customparams = { 
			normaltex 		= "unittextures/normalmaps/feat_rocksB.png",
			normalmaps 		= "yes",			
		},  
  }
end

for i=1,9 do
  createBuildingModuleDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( BuildingModuleDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------