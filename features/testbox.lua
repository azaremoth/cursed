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
	object				= "features/testbox.s3o",
	reclaimable			= true,
	autoreclaimable		= true, 	
	world				= "All Worlds",
	customParams = { 
		normaltex = "unittextures/normalmaps/feat_rocks.png",
		randomrotate		= "true", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

