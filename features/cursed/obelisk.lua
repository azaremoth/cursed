local objectname= "obelisk" 
local featureDef  =  {
   name           = "obelisk",
   blocking       = true,	
   mass			   = 1000000000,	   
   damage            = 1000000000,
   description       = "Obelisk",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = false,
   footprintX        = 1,
   footprintZ        = 1,
   upright          = true,
   height      		= "80",
   hitdensity       = "1000000000",
   metal            = 0,
   object           = "features/obelisk.s3o",  
   reclaimable		= false,
   autoreclaimable	= false,
   world            = "allworld",
   customparams = { 
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
   },   
}
return lowerkeys({[featureDef.name] = featureDef})
