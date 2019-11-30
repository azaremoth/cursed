local objectname= "bld_tunnel_med" 
local featureDef  =  {
   name           = "bld_tunnel_med",
     description = [[Tunnel]],
	 autoreclaimable = false,
     blocking    = false,
     burnable    = false,
     nodrawundergray = false,
     reclaimable = false,
	 upright 	 = true,
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/modtower/bld_tunnel_med.s3o",  
     footprintX  = 0,
     footprintZ  = 0,
	 collisionVolumeType 	= "Box",
	 collisionVolumeScales 	= "50 60 180",
	 collisionVolumeOffsets = "0 0 0",    
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
