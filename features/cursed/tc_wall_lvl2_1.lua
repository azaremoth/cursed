local objectname= "tc_wall_lvl2_1" 
local featureDef  =  {
   name           = "tc_wall_lvl2_1",
   blocking       = true,	
   mass			   = 10000,
   category         = [[dragonteeth]],
	customparams = { 
		normaltex 		= "unittextures/normalmaps/tc_wall_lvl2_normal.png",
		normalmaps 		= "yes",			
	},
   collisionVolumeType 	= "Box",
   collisionVolumeScales 	= "80 70 10",
   collisionVolumeOffsets 	= "0 0 5",	   
   damage            = 10000,
   description       = "cursed walls",
   energy            = 0,
   flammable         = 0,
   footprintX        = 5,
   footprintZ        = 1,
   upright          = true,
   height      		= "18",
   hitdensity       = "10000",
   metal            = 20,
   object           = "tc_wall_lvl2_1.s3o",
   nodrawundergray  = true,     
   reclaimable		= true,
   autoreclaimable	= false,
   world            = "allworld",
}
return lowerkeys({[featureDef.name] = featureDef})
