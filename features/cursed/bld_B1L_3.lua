local objectname= "bld_B1L_3" 
local featureDef  =  {
   name           = "bld_B1L_3",
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
     object      = "features/modtower/bld_B1L_3.s3o",  
     footprintX  = 8,
     footprintZ  = 6,
	 collisionVolumeType 	= "Box",
	 collisionVolumeScales 	= "80 30 60",
	 collisionVolumeOffsets = "0 0 0",    
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
