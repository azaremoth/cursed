-- $Id$

local objects = {
	"features/euf_container1.s3o",
	"features/euf_container2.s3o",
	"features/euf_container3.s3o",		
	"features/euf_container4.s3o",
}

local containerDef = {}
local function createContainerDef(i)
  containerDef["containertype" .. i] = {
     description = [[Cargo Containers]],
     blocking    = true,
     burnable    = false,
     reclaimable = false,
	 upright 	 = false,	 
     energy      = 25,
     damage      = 5,
     metal       = 0,
     reclaimTime = 9999999999,
     mass        = 1000,
     object = objects[(i % #objects) + 1] ,
     footprintX  = 2,
     footprintZ  = 5,
     collisionVolumeScales = [[30 30 95]],
     collisionVolumeType = [[Box]],
     collisionVolumeOffsets 	= "0 0 0",
		customparams = { 
			normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
			normalmaps 		   	= "yes",
		}, 	
  }
end

for i=1,4 do
  createContainerDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( containerDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------