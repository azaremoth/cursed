local tubeDef = {}
tubeDef["tube"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube.s3o",  
     footprintX  = 1,
     footprintZ  = 5,
     collisionVolumeScales = [[30 5 5]],
     collisionVolumeType = [[Box]],
     collisionVolumeOffsets 	= "0 10 0",
}
tubeDef["tube_corner"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_corner.s3o",  
     footprintX  = 2,
     footprintZ  = 2,
}
tubeDef["tube_down"] = {
     description = [[Tube]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_down.s3o",  
     footprintX  = 1,
     footprintZ  = 2,
}
tubeDef["tube_connect"] = {
     description = [[Tube Connector]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_connect.s3o",  
     footprintX  = 2,
     footprintZ  = 2,
}
tubeDef["tube_box"] = {
     description = [[Tube Connector]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object      = "features/tube_box.s3o",  
     footprintX  = 2,
     footprintZ  = 2,
}



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( tubeDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------