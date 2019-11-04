local objectname= "bld_B1L_1" 
local featureDef  =  {
   name           = "bld_B1L_1",
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
     object      = "features/modtower/bld_B1L_1.s3o",  
     footprintX  = 24,
     footprintZ  = 14,
	 collisionVolumeType 	= "Box",
	 collisionVolumeScales 	= "430 55 230",
	 collisionVolumeOffsets = "0 0 0",    
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
