local objectname= "scaffold_8x8_high" 
local featureDef  =  {
   name           = "scaffold_8x8_high",
   blocking       = false,
    category         = [[corpses]],
   damage            = 100000,
   description       = "scaffold 8x8 high",
   energy            = 0,
   flammable         = 0,
   nodrawundergray   = true,  
   footprintX        = 8,
   footprintZ        = 8,
   upright           = true,
   height            = "0",
   hitdensity        = "100000",
   metal          = 0,
   object            = "features/euf_scaffold_8x8_high.s3o",
   flammable		= false,
   reclaimable		= false,
   autoreclaimable	= false,
   indestructible	= true,
   world          = "All Worlds",
}
return lowerkeys({[featureDef.name] = featureDef})
