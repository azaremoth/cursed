local objectname= "rubble1" 
local featureDef  =  {
   name           = "rubble1",
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
     object      = "features/rubble1.s3o",  
     footprintX  = 3,
     footprintZ  = 3,
	customparams = { 
		normaltex 		= "unittextures/normalmaps/rubble.png",
		normalmaps 		= "yes",			
	},      
}
return lowerkeys({[featureDef.name] = featureDef})
