local objectname= "pad" 
local featureDef  =  {
   name           = "pad",
   blocking       = true,	
   mass			   = 1000000000,
   collisionVolumeType 	= "Box",
   collisionVolumeScales 	= "120 40 120",
   collisionVolumeOffsets 	= "0 0 0", 
   damage            = 10000,
   description       = "Storage",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = false,
   footprintX        = 9,
   footprintZ        = 9,
   upright          = true,
   height      		= "20",
   hitdensity       = "1000000000",
   metal            = 0,
   object           = "features/pad.s3o",  
   reclaimable		= false,
   autoreclaimable	= false,
   world            = "allworld",
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	   
}
return lowerkeys({[featureDef.name] = featureDef})
