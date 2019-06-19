local tubeDef = {}
tubeDef["tube"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube.s3o",  
     footprintX  = 1,
     footprintZ  = 6,
     collisionVolumeScales = [[25 25 120]],
     collisionVolumeType = [[Box]],
     collisionVolumeOffsets 	= "0 0 0",
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
}
tubeDef["tube_corner"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_corner.s3o",  
     footprintX  = 2,
     footprintZ  = 2,
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
}
tubeDef["tube_down"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_down.s3o",  
     footprintX  = 1,
     footprintZ  = 2,
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
}
tubeDef["tube_connect"] = {
     description = [[Tube Connector]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_connect.s3o",  
     footprintX  = 4,
     footprintZ  = 4,
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
}
tubeDef["tube_box"] = {
     description = [[Tube Connector]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = true,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_box.s3o",  
     footprintX  = 3,
     footprintZ  = 3,
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
}



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( tubeDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------