local objectname= "bld_door" 
local featureDef  =  {
   name           = "bld_door",
     description = [[Door]],
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
     object      = "features/modtower/bld_door.s3o",  
     footprintX  = 1,
     footprintZ  = 1,
--	 collisionVolumeType 	= "Box",
--	 collisionVolumeScales 	= "120 30 60",
--	 collisionVolumeOffsets = "0 0 0",    
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
