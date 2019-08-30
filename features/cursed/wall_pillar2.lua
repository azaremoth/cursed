local objectname= "wall_pillar2" 
local featureDef  =  {
   name           = "wall_pillar2",
     description = [[Pillar]],
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
     object      = "features/wall_pillar2.s3o",  
     footprintX  = 1,
     footprintZ  = 1,
--	 collisionVolumeType 	= "Box",
--	 collisionVolumeScales 	= "3 20 5",
--	 collisionVolumeOffsets = "0 0 0",    
	customparams = { 
		normaltex 		= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		= "yes",			
	},   
}
return lowerkeys({[featureDef.name] = featureDef})
