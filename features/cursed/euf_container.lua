-- $Id$

local objects = {
	"features/behe/euf_container1.s3o",
	"features/behe/euf_container2.s3o",
	"features/behe/euf_container3.s3o",		
	"features/behe/euf_container4.s3o",
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
     collisionVolumeScales = [[25 25 60]],
     collisionVolumeType = [[Box]],
     collisionVolumeOffsets 	= "0 10 0",
	 
	 
 --    customParams = {
 --      mod = true,
 --    },
  }
end

for i=0,3 do
  createContainerDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( containerDef )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------