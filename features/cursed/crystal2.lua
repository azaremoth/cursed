local objectname= "crystal2" 
local featureDef  =  {
   name           = "crystal2",
   blocking       = true,	
   mass			   = 1000000000,
   category         = [[dragonteeth]],
   collisionVolumeType 	= "Box",
   collisionVolumeScales 	= "80 70 10",
   collisionVolumeOffsets 	= "0 0 5",	   
   damage            = 10000,
   description       = "purple crystal",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = false,
   footprintX        = 1,
   footprintZ        = 1,
   upright          = false,
   height      		= "18",
   hitdensity       = "1000000000",
   metal            = 0,
   object           = "crystal2.s3o",  
   reclaimable		= false,
   autoreclaimable	= false,
   world            = "allworld",
}
return lowerkeys({[featureDef.name] = featureDef})
