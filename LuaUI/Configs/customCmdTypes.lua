-- This is the list of name ("action name") related to unit command. This name won't work using command line (eg: /fight, won't activate FIGHT command) but it can be binded to a key (eg: /bind f fight, will activate FIGHT when f is pressed)
-- In reverse, one can use Spring.GetActionHotkey(name) to get the key binded to this name.
-- This table is used in Epicmenu for hotkey management.
local custom_cmd_actions = {
	-- cmdTypes are:
	-- 1: Targeted commands (eg attack)
	-- 2: State commands (eg on/off). Parameter 'state' creates actions to set a particular state
	-- 3: Instant commands (eg self-d)

	--SPRING COMMANDS
	selfd = {cmdType = 3, name = "Self Destruct"},
	attack = {cmdType = 1, name = "Force Fire"},
	stop = {cmdType = 3, name = "Stop"},
	fight = {cmdType = 1, name = "Attack Move"},
	guard = {cmdType = 1, name = "Guard"},
	move = {cmdType = 1, name = "Move"},
	patrol = {cmdType = 1, name = "Patrol"},
	wait = {cmdType = 3, name = "Wait"},
	timewait = {cmdType = 3, name = "Wait: Timer"},
	deathwait = {cmdType = 3, name = "Wait: Death"},
	squadwait = {cmdType = 3, name = "Wait: Squad"},
	gatherwait = {cmdType = 3, name = "Wait: Gather"},
	repair = {cmdType = 1, name = "Repair"},
	reclaim = {cmdType = 1, name = "Reclaim"},
	resurrect = {cmdType = 1, name = "Resurrect"},
	manualfire = {cmdType = 1, name = "Fire Special Weapon"},
	loadunits = {cmdType = 1, name = "Load Units"},
	unloadunits = {cmdType = 1, name = "Unload Units"},
	areaattack = {cmdType = 1, name = "Area Attack"},

	rawmove = {cmdType = 1, name = "Move"},

	-- states
	onoff = {cmdType = 2, name = "On/Off", states = {'Off', 'On'}},
	['repeat'] = {cmdType = 2, name = "Repeat", states = {'Off', 'On'}},
	wantcloak = {cmdType = 2, name = "Cloak", states = {'Off', 'On'}},
	movestate = {cmdType = 2, name = "Move State", states = {'Hold Position', 'Maneuver', 'Roam'}},
	firestate = {cmdType = 2, name = "Fire State", states = {'Hold Fire', 'Return Fire', 'Fire At Will'}},
	idlemode = {cmdType = 2, name = "Land/Fly", states = {'Land', 'Fly'}},
	autorepairlevel = {cmdType = 2, name = "Air Retreat Threshold", states = {'Off', '30%', '50%', '80%'}},
	preventoverkill = {cmdType = 2, name = "Prevent Overkill", states = {'Off', 'On'}},


	--CUSTOM COMMANDS
	areamex = {cmdType = 1, name = "Area Mex"},
	jump = {cmdType = 1, name = "Jump"},

	
	--states
	priority = {cmdType = 2, name = "Construction Priority", states = {'Low', 'Normal', 'High'}},
	unitai = {cmdType = 2, name = "Unit AI", states = {'Off', 'On'}},
--	autoassist = {cmdType = 2, name = "Factory Auto Assist", states = {'Off', 'On'}},
}

-- These actions are created from echoing all actions that appear when all units are selected.
-- See cmd_layout_handler for how to generate these actions.
local usedActions = {
	["stop"] = true,
	["attack"] = true,
	["wait"] = true,
	["timewait"] = true,
	["deathwait"] = true,
	["squadwait"] = true,
	["gatherwait"] = true,
	["selfd"] = true,
	["firestate"] = true,
	["movestate"] = true,
	["repeat"] = true,
	["loadonto"] = true,
	["rawmove"] = true,
	["patrol"] = true,
	["fight"] = true,
	["guard"] = true,
	["areaguard"] = true,
	["orbitdraw"] = true,
	["preventoverkill"] = true,
	["retreat"] = true,
	["unitai"] = true,
	["settarget"] = true,
	["settargetcircle"] = true,
	["canceltarget"] = true,
	["onoff"] = true,
	["miscpriority"] = true,
	["manualfire"] = true,
	["repair"] = true,
	["reclaim"] = true,
	["areamex"] = true,
	["priority"] = true,
	["jump"] = true,
	["idlemode"] = true,
	["areaattack"] = true,
	["divestate"] = true,
	["wantcloak"] = true,
	["floatstate"] = true,
	["airstrafe"] = true,
	["dontfireatradar"] = true,
	["stockpile"] = true,
	["trajectory"] = true,
	["resurrect"] = true,
	["loadunits"] = true,
	["unloadunits"] = true,
	["loadselected"] = true,
	["morph"] = true,
	--["prevmenu"] = true,
	--["nextmenu"] = true,

}

-- Clear unused actions.
for name,_ in pairs(custom_cmd_actions) do
	if not usedActions[name] then
		custom_cmd_actions[name] = nil
	end
end

-- Add toggle-to-particular-state commands
local fullCustomCmdActions = {}
for name, data in pairs(custom_cmd_actions) do
	if data.states then
		for i = 1, #data.states do
			fullCustomCmdActions[name .. " " .. (i-1)] = {
				cmdType = data.cmdType,
				name = data.name .. ": set " .. data.states[i],
			}
		end
		data.name = data.name .. ": toggle"
	end
	fullCustomCmdActions[name] = data
end

return fullCustomCmdActions