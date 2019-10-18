local objectname= "rubble2" 
local featureDef  =  {
   name           = "rubble2",
     description = [[Rubble]],
	 autoreclaimable = false,
     blocking    = true,
     burnable    = false,
     nodrawundergray = false,
     reclaimable = false,
	 upright 	 = false,
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/rubble2.s3o",  
     footprintX  = 3,
     footprintZ  = 3,
	customparams = { 
		normaltex 		= "unittextures/normalmaps/rubble.png",
		normalmaps 		= "yes",			
	},      
}
return lowerkeys({[featureDef.name] = featureDef})
