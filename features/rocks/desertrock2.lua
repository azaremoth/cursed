local featureDef	=	{
	name				= "DesertRock2",
	blocking			= true,
	category			= "rocks",
	damage				= 3000,
	description			= "Desert Rock",

	flammable			= 0,
	footprintX			= 3,
	footprintZ			= 3,
	height				= "36",
	hitdensity			= "5",
	metal 				= 0,

	object				= "features/desert/desertrock2.s3o",
	reclaimable			= true,
	autoreclaimable		= true, 	
	world				= "All Worlds",
	customparams = { 
		author 	 		= "yughues", 
		category 	 	= "rock", 
		normaltex 		= "unittextures/normalmaps/feat_rocksA.png",
		randomrotate	= "true", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

