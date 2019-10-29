local objectname= "tank" 
local featureDef  =  {
   name           = "tank",
   blocking       = true,	
   mass			   = 1000000000,
   collisionVolumeType 		= "CylY",
   collisionVolumeScales 	= "50 60 50",
   collisionVolumeOffsets 	= "0 0 0", 
   damage            = 10000,
   description       = "Tank",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = false,
   footprintX        = 2,
   footprintZ        = 2,
   upright          = true,
   height      		= "10",
   hitdensity       = "1000000000",
   metal            = 0,
   object           = "features/tank.s3o",  
   reclaimable		= false,
   autoreclaimable	= false,
   world            = "allworld",
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	   
}
return lowerkeys({[featureDef.name] = featureDef})
