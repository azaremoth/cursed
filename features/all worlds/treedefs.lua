-- $Id$

local objects = {
	"features/behe/behepine_brown_1.s3o",
	"features/behe/behepine_big_brown_1.s3o",
	"features/behe/behepine_huge_brown_1.s3o",		
	"features/behe/behepine_brown_2.s3o",
	"features/behe/behepine_big_brown_2.s3o",
	"features/behe/behepine_huge_brown_2.s3o",
	"features/behe/behepine_brown_3.s3o",
	"features/behe/behepine_big_brown_3.s3o",
	"features/behe/behepine_huge_brown_3.s3o",
	"features/behe/behepine_regular_1.s3o",
	"features/behe/behepine_big_regular_1.s3o",	
	"features/behe/behepine_huge_regular_1.s3o",	
	"features/behe/behepine_regular_2.s3o",
	"features/behe/behepine_big_regular_2.s3o",	
	"features/behe/behepine_huge_regular_2.s3o",	
	"features/behe/behepine_regular_3.s3o",
	"features/behe/behepine_big_regular_3.s3o",	
	"features/behe/behepine_huge_regular_3.s3o",	
}

local treeDefs = {}
local function CreateTreeDef(i)
  treeDefs["treetype" .. i] = {
     description = [[Tree]],
     blocking    = true,
     burnable    = true,
     reclaimable = true,
	 upright 	 = true,	 
     energy      = 25,
     damage      = 5,
     metal       = 0,
     reclaimTime = 25,
     mass        = 20,
     object = objects[(i % #objects) + 1] ,
     footprintX  = 2,
     footprintZ  = 2,
     collisionVolumeScales = [[22 75 22]],
     collisionVolumeType = [[cylY]],

     customParams = {
       mod = true,
     },
  }
end

for i=0,20 do
  CreateTreeDef(i)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( treeDefs )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------