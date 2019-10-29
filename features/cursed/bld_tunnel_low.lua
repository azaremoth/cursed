local objectname= "bld_tunnel_low" 
local featureDef  =  {
   name           = "bld_tunnel_low",
     description = [[Tunnel]],
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
     object      = "features/modtower/bld_tunnel_low.s3o",  
     footprintX  = 2,
     footprintZ  = 4,
	 collisionVolumeType 	= "Box",
	 collisionVolumeScales 	= "50 60 180",
	 collisionVolumeOffsets = "0 0 0",	 
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
