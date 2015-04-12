--------------------------------------------------------------------------------
--
--  Proposed Command ID Ranges:
--
--    all negative:  Engine (build commands)
--       0 -   999:  Engine
--    1000 -  9999:  Group AI
--   10000 - 19999:  LuaUI
--   20000 - 29999:  LuaCob
--   30000 - 39999:  LuaRules
--



CMD_JUMP = 38580
CMD_MORPH_STOP = 32210
CMD_MORPH = 31210
CMD_BURROW = 32630
CMD_TRANSFORM_PURGATORY = 32631
CMD_TRANSFORM_PURGATORY_OFF = 32632
CMD_KAMIKAZE= 32633
-- CMD_TELEPORT = 38522
CMD_SPECIALSKILL= 32634
CMD_CHANGEWEAPON_LUA= 32635
CMD_PRIORITY = 34220

-- CMD_AUTOMEX = 31143 
-- CMD_UPGRADEMEX = 31244
 
-- terraform
--[[CMD_RAMP = 39734
CMD_LEVEL = 39736
CMD_RAISE = 39737
CMD_SMOOTH = 39738
CMD_RESTORE = 39739
CMD_TERRAFORM_INTERNAL = 39801]]--

-- not included here, just listed
--[[
CMD_PURCHASE = 32601	-- planetwars, range up to 32601 + #purchases
CMD_MORPH_STOP = 32210	-- range up to 32210 + #morphs
CMD_MORPH = 31210		-- ditto
]]--

-- deprecated
--[[
CMD_PLANTBOMB =     	32523
CMD_AUTOREPAIR =    	33250 	-- up to 33250 + 3
CMD_AUTORECLAIM =   	33251
CMD_AUTOASSIST  =   	33252
CMD_AUTOATTACK  =   	33253
CMD_PRIORITY=			34220
CobButton =         	34520 	-- up to 32520 + different cob buttons
CMD_SCRAMBLE =      	35128
CMD_WRECK =         	36734
CMD_RESTOREBOMB = 		39735
]]--