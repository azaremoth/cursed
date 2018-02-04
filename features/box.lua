-----------------------------------------------------------------------------
--  GreyRock1
-----------------------------------------------------------------------------
local featureDef	=	{
	name				= "uselessbox",
	blocking			= true,
	category			= "rocks",
	damage				= 500,
	description			= "Boxy",


  energy = 0,
-- energy				= 0,
	flammable			= 0,
	footprintX			= 5,
	footprintZ			= 5,
	height				= "36",
	hitdensity			= "5",
	metal = 0,
--metal				= 35,
	object				= "features/box.s3o",
	reclaimable			= true,
	autoreclaimable		= true, 	
	world				= "All Worlds",
	customparams = { 
 
		randomrotate		= "true", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

