-----------------------------------------------------------------------------
--  GreyRock6
-----------------------------------------------------------------------------
local featureDef	=	{
	name				= "GreyRock6",
	blocking			= true,
	category			= "rocks",
	damage				= 1000,
	description			= "Grey Rock",


  energy = 0,
-- energy				= 0,
	flammable			= 0,
	footprintX			= 2,
	footprintZ			= 1,
	height				= "36",
	hitdensity			= "5",
	metal = 0,
--metal				= 35,
	object				= "features/lathan/GreyRock6.s3o",
	reclaimable			= true,
	autoreclaimable		= true, 	
	world				= "All Worlds",
	customparams = { 
		 author 	 = "Lathan", 
		 category 	 = "rock", 
		 set 		 = "Lathan's Rocks", 
 
		randomrotate		= "true", 
	}, 
}
return lowerkeys({[featureDef.name] = featureDef})

