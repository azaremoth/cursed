local objectname= "crystal_small2" 
local featureDef  =  {
   name           = "crystal_small2",
   blocking       = false,	
   mass			   = 1000000000,
   category         = [[dragonteeth]],
   collisionVolumeType 	= "Box",
   collisionVolumeScales 	= "5 5 5",
   collisionVolumeOffsets 	= "0 0 0",	   
   damage            = 10000,
   description       = "small purple crystals",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = false,
   footprintX        = 1,
   footprintZ        = 1,
   upright          = false,
   height      		= "5",
   hitdensity       = "1000000000",
   metal            = 0,
   object           = "crystal_small2.s3o",  
   reclaimable		= false,
   autoreclaimable	= false,
   world            = "allworld",
}
return lowerkeys({[featureDef.name] = featureDef})