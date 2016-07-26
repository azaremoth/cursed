VFS.Include("LuaRules/Configs/customcmds.h.lua")

--FIXME: use this table until state tooltip detection is fixed
local tooltips = {
	priority = "Priority: Set construction priority (low, normal, high)",
	fireState = "Fire State: Sets under what conditions a unit will fire without an explicit attack order (never, when attacked, always)",
	moveState = "Move State: Sets how far out of its way a unit will move to attack enemies",
	["repeat"] = "Repeat: if on the unit will continously push finished orders to the end of its order queue",
}

local factories = {}

--Integral menu is NON-ROBUST
--all buildings (except facs) need a row or they won't appear!
--you can put too many things into the same row, but the buttons will be squished
local econ = {}
local defense = {
	euf_plasmatower =    {order = 0, row = 1, col = 1},
	euf_aatower =   {order = 1, row = 1, col = 2},
	euf_lasertower =   {order = 1, row = 1, col = 3},
	euf_artytower =  {order = 1, row = 1, col = 4},
	euf_radar_lvl1  =  {order = 1, row = 2, col = 1},
	euf_radar_lvl2  =  {order = 1, row = 2, col = 1},
	euf_wall =  {order = 1, row = 2, col = 2},
	euf_wall_lvl2 =  {order = 1, row = 2, col = 2},
	euf_bunker =  {order = 1, row = 2, col = 3},

	tc_defender =    {order = 0, row = 1, col = 1},
	tc_tower =   {order = 1, row = 1, col = 2},
	tc_hellfire =   {order = 1, row = 1, col = 3},
	tc_seer =  {order = 1, row = 2, col = 1},
	tc_teeth =  {order = 1, row = 2, col = 2},
	tc_wall_lvl2 =  {order = 1, row = 2, col = 2},
	
}
local aux = {}
local super = {}

--manual entries not needed; menu has autodetection
local common_commands = {}
local states_commands = {}
local factory_commands = {}
local econ_commands = {}
local defense_commands = {}
local special_commands = {}

local function CopyBuildArray(source, target)
	for name, value in pairs(source) do
		udef = (UnitDefNames[name])
		if udef then
			target[-udef.id] = value
		end
	end
end

CopyBuildArray(factories, factory_commands)
CopyBuildArray(econ, econ_commands)
CopyBuildArray(aux, special_commands)
CopyBuildArray(defense, defense_commands)
CopyBuildArray(super, special_commands)

-- Global commands defined here - they have cmdDesc format + 
local globalCommands = {}

-- Command overrides. State commands by default expect array of textures, one for each state.
-- You can specify texture, text,tooltip, color
local imageDir = 'LuaUI/Images/commands/cursed/'
local imageDirTwo = 'LuaUI/Images/commands/imperials/'
local imageDirSpecials = 'LuaUI/Images/commands/specials/'

local overrides = {
--	[CMD_AUTOMEX] = { texture = imageDir .. 'upgrade.png',  text= ' '},
--	[CMD_UPGRADEMEX] = { texture = imageDir .. 'upgrade.png',  text= '\255\0\255\0U'},
	[CMD.ATTACK] = { texture = imageDir .. 'attack.png',  text= '\255\0\255\0A'},
	[CMD.CAPTURE] = { texture = imageDir .. 'capture.png',  text= '\255\0\255\0A'},	
	[CMD.STOP] = { texture = imageDir .. 'stop.png', text= '\255\0\255\0S'},
	[CMD.FIGHT] = { texture = imageDir .. 'fight.png',text= '\255\0\255\0F'},
	[CMD.GUARD] = { texture = imageDir .. 'guard.png', text= '\255\0\255\0G'},
	[CMD.MOVE] = { texture = imageDir .. 'move.png', text= '\255\0\255\0M'},
	[CMD.PATROL] = { texture = imageDir .. 'patrol.png', text= '\255\0\255\0P'},
	[CMD.WAIT] = { texture = imageDir .. 'wait.png', text= '\255\0\255\0W'},
	[CMD.REPAIR] = {text= '\255\0\255\0R', texture = imageDir .. 'repair.png'},
	[CMD.RECLAIM] = {text= '\255\0\255\0E', texture = imageDir .. 'reclaim.png'},
	[CMD.RESURRECT] = {text= '\255\0\255\0S', texture = imageDir .. 'resurrect.png'},
	[CMD.LOAD_UNITS] = { texture = imageDir .. 'load.png', text= '\255\0\255\0L'},
	[CMD.UNLOAD_UNITS] = { texture = imageDir .. 'unload.png', text= '\255\0\255\0U'},
	[CMD.AREA_ATTACK] = { texture = imageDir .. 'areaattack.png', text='\255\0\255\0Alt+A'},
	[CMD.RESTORE] = {text = ' ', texture = imageDir .. 'restore.png'},
	-- special commands
	[CMD_BURROW] = {text = ' ', texture = imageDirSpecials .. 'burrow.png'},
	[CMD_KAMIKAZE] = {text = ' ', texture = imageDirSpecials .. 'suicide.png'},			
	[CMD_JUMP] = {text = ' ', texture = imageDirSpecials .. 'jump.png'},	
--	[CMD_TELEPORT] = {text = ' ', texture = imageDirSpecials .. 'teleport.png'},
	[CMD_TRANSFORM_PURGATORY] = {text = ' ', texture = imageDirSpecials .. 'deploy.png'},	
	[CMD_TRANSFORM_PURGATORY_OFF] = {text = ' ', texture = imageDirSpecials .. 'deploy_off.png'},
	[CMD_CHANGEWEAPON_LUA] = {text = ' ', texture = imageDirSpecials .. 'weaponchange_sarge.png'},
	[CMD_SPECIALSKILL] = {text = ' ', texture = imageDirSpecials .. 'illusions.png'},		
	[CMD.DGUN] = { texture = imageDir .. 'manualfire.png',  text= '\255\0\255\0A'},	
	-- states
	[CMD.ONOFF] = { texture = {'LuaUI/Images/commands/states/off.png', 'LuaUI/Images/commands/states/on.png'}, text=''},
	[CMD.REPEAT] = { texture = {'LuaUI/Images/commands/states/repeat_off.png', 'LuaUI/Images/commands/states/repeat_on.png'}, text=''},
	[CMD.CLOAK] = { texture = {'LuaUI/Images/commands/states/cloak_off.png', 'LuaUI/Images/commands/states/cloak_on.png'},
		text ='', tooltip =  'Unit cloaking state - press \255\0\255\0K\008 to toggle'},
	[CMD_PRIORITY] = { texture = {'LuaUI/Images/commands/states/wrench_low.png', 'LuaUI/Images/commands/states/wrench_med.png', 'LuaUI/Images/commands/states/wrench_high.png'},
		text='', tooltip = tooltips.priority},
	[CMD.MOVE_STATE] = { texture = {'LuaUI/Images/commands/states/move_hold.png', 'LuaUI/Images/commands/states/move_engage.png', 'LuaUI/Images/commands/states/move_roam.png'}, text=''},
	[CMD.FIRE_STATE] = { texture = {'LuaUI/Images/commands/states/fire_hold.png', 'LuaUI/Images/commands/states/fire_return.png', 'LuaUI/Images/commands/states/fire_atwill.png'}, text=''},
}

local overrides_faction_two = {
--	[CMD_AUTOMEX] = { texture = imageDirTwo .. 'upgrade.png',  text= ' '},
--	[CMD_UPGRADEMEX] = { texture = imageDirTwo .. 'upgrade.png',  text= '\255\0\255\0U'},

	[CMD.ATTACK] = { texture = imageDirTwo .. 'attack.png',  text= '\255\0\255\0A'},
	[CMD.CAPTURE] = { texture = imageDirTwo .. 'capture.png',  text= '\255\0\255\0A'},		
	[CMD.STOP] = { texture = imageDirTwo .. 'stop.png', text= '\255\0\255\0S'},
	[CMD.FIGHT] = { texture = imageDirTwo .. 'fight.png',text= '\255\0\255\0F'},
	[CMD.GUARD] = { texture = imageDirTwo .. 'guard.png', text= '\255\0\255\0G'},
	[CMD.MOVE] = { texture = imageDirTwo .. 'move.png', text= '\255\0\255\0M'},
	[CMD.PATROL] = { texture = imageDirTwo .. 'patrol.png', text= '\255\0\255\0P'},
	[CMD.WAIT] = { texture = imageDirTwo .. 'wait.png', text= '\255\0\255\0W'},
	[CMD.REPAIR] = {text= '\255\0\255\0R', texture = imageDirTwo .. 'repair.png'},
	[CMD.RECLAIM] = {text= '\255\0\255\0E', texture = imageDirTwo .. 'reclaim.png'},
	[CMD.RESURRECT] = {text= '\255\0\255\0S', texture = imageDirTwo .. 'resurrect.png'},
	[CMD.LOAD_UNITS] = { texture = imageDirTwo .. 'load.png', text= '\255\0\255\0L'},
	[CMD.UNLOAD_UNITS] = { texture = imageDirTwo .. 'unload.png', text= '\255\0\255\0U'},
	[CMD.AREA_ATTACK] = { texture = imageDirTwo .. 'areaattack.png', text='\255\0\255\0Alt+A'},
	[CMD.RESTORE] = {text = ' ', texture = imageDirTwo .. 'restore.png'},
	-- special commands
	[CMD_BURROW] = {text = ' ', texture = imageDirSpecials .. 'burrow.png'},
	[CMD_KAMIKAZE] = {text = ' ', texture = imageDirSpecials .. 'suicide.png'},			
	[CMD_JUMP] = {text = ' ', texture = imageDirSpecials .. 'jump.png'},	
--	[CMD_TELEPORT] = {text = ' ', texture = imageDirSpecials .. 'teleport.png'},
	[CMD_TRANSFORM_PURGATORY] = {text = ' ', texture = imageDirSpecials .. 'deploy.png'},	
	[CMD_TRANSFORM_PURGATORY_OFF] = {text = ' ', texture = imageDirSpecials .. 'deploy_off.png'},
	[CMD_CHANGEWEAPON_LUA] = {text = ' ', texture = imageDirSpecials .. 'weaponchange_sarge.png'},
	[CMD_SPECIALSKILL] = {text = ' ', texture = imageDirSpecials .. 'illusions.png'},		
	-- states
	[CMD.ONOFF] = { texture = {'LuaUI/Images/commands/states/off.png', 'LuaUI/Images/commands/states/on.png'}, text=''},
	[CMD.REPEAT] = { texture = {'LuaUI/Images/commands/states/repeat_off.png', 'LuaUI/Images/commands/states/repeat_on.png'}, text=''},
	[CMD.CLOAK] = { texture = {'LuaUI/Images/commands/states/cloak_off.png', 'LuaUI/Images/commands/states/cloak_on.png'},
		text ='', tooltip =  'Unit cloaking state - press \255\0\255\0K\008 to toggle'},
	[CMD_PRIORITY] = { texture = {'LuaUI/Images/commands/states/wrench_low.png', 'LuaUI/Images/commands/states/wrench_med.png', 'LuaUI/Images/commands/states/wrench_high.png'},
		text='', tooltip = tooltips.priority},
	[CMD.MOVE_STATE] = { texture = {'LuaUI/Images/commands/states/move_hold.png', 'LuaUI/Images/commands/states/move_engage.png', 'LuaUI/Images/commands/states/move_roam.png'}, text=''},
	[CMD.FIRE_STATE] = { texture = {'LuaUI/Images/commands/states/fire_hold.png', 'LuaUI/Images/commands/states/fire_return.png', 'LuaUI/Images/commands/states/fire_atwill.png'}, text=''},
}


-- noone really knows what this table does but it's needed for epic menu to get the hotkey
local custom_cmd_actions = {
	-- states are 2, targeted commands (e.g. attack) are 1, instant commands (e.g. selfd) are 3
	-- can (probably) set to 1 instead of 3 if order doesn't need to be queueable
	--SPRING COMMANDS
	selfd=3,
	attack=1,
	stop=3,
	fight=1,
	guard=1,
	move=1,
	patrol=1,
	wait=3,
	repair=1,
	reclaim=1,
	resurrect=1,
	manualfire=1,
	loadunits=1,
	unloadunits=1,
	areaattack=1,
	
	-- states
	onoff=2,
	['repeat']=2,
	cloak=2,
	movestate=2,
	firestate=2,
	      
	--CUSTOM COMMANDS
	jump=1,
	
	--states
	priority=2,
}


return common_commands, states_commands, factory_commands, econ_commands, defense_commands, special_commands, globalCommands, overrides, overrides_faction_two, custom_cmd_actions