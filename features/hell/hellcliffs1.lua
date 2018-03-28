local featureDef	=	{
	name				= "HellCliffs1",
	blocking			= true,
	category			= "cliffs",
	damage				= 1000000,
	description			= "Hell Cliffs",

	collisionVolumeType 		= "Box",
	collisionVolumeScales 		= "75 200 400",
	collisionVolumeOffsets 		= "0 100 0",	
	
	flammable			= 0,
	footprintX			= 3,
	footprintZ			= 3,
	height				= "120",
	hitdensity			= "5",
	metal 				= 0,

	object				= "features/hell/hellcliffs1.s3o",
	reclaimable			= false,
	autoreclaimable		= false, 
	upright 			= true,
	
	world				= "All Worlds",
	customparams = { 
		author 	 		= "azaremoth", 
		category 	 	= "cliffs", 
		normaltex 		= "unittextures/normalmaps/hell_features_normal.png",
		randomrotate	= "false", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

