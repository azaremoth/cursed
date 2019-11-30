local featureDef	=	{
	name				= "rockcliffs",
	blocking			= true,
	category			= "rocks",
	damage				= 1000000,
	description			= "Desert Cliffs",

	collisionVolumeType 		= "Box",
	collisionVolumeScales 		= "100 200 300",
	collisionVolumeOffsets 		= "0 90 0",	
	
	flammable			= 0,
	footprintX			= 3,
	footprintZ			= 3,
	height				= "120",
	hitdensity			= "5",
	metal 				= 0,

	object				= "features/rocks/rocks_cliffs.s3o",
	reclaimable			= false,
	autoreclaimable		= false, 
	upright 			= true,
	
	world				= "All Worlds",
	customparams = { 
		author 	 		= "yughues", 
		category 	 	= "rock", 
		normaltex 		= "unittextures/normalmaps/feat_rocksA.png",
		randomrotate	= "false", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

