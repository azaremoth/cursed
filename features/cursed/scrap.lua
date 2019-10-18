-- $Id$

local objects = {
	"features/scrap1.s3o",
	"features/scrap2.s3o",
	"features/scrap3.s3o",
	"features/scrap4.s3o",
	"features/scrap5.s3o",
	"features/scrap6.s3o",
	"features/scrap7.s3o",
	"features/scrap8.s3o",
	"features/scrap9.s3o",
	"features/scrap10.s3o",
	"features/scrap11.s3o",
}

local scrapDef = {}
local function createscrapDef(i)
  scrapDef["scraptype" .. i] = {
     description = [[Scrap]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 0,
     damage      = 9999999999,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 9999999999,
     object = objects[(i % #objects) + 1] ,
     footprintX  = 2,
     footprintZ  = 2,
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
  }
end

for i=1,11 do
  createscrapDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( scrapDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------