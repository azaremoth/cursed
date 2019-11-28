local objects = {
	"features/rocks/rocks_pillar1.s3o",
	"features/rocks/rocks_pillar2.s3o",
}

local BuildingModuleDef = {}
local function createBuildingModuleDef(i)
  BuildingModuleDef["rocks_big" .. i] = {
     description = [[Big rock pillars]],
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
     footprintX  = 5,
     footprintZ  = 5,
	 customparams = { 
			normaltex 		= "unittextures/normalmaps/feat_rocksA.png",
			normalmaps 		= "yes",			
		},  
  }
end

for i=1,2 do
  createBuildingModuleDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( BuildingModuleDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------