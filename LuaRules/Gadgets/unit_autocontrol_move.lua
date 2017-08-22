function gadget:GetInfo()
  return {
    name      = "Move control",
    desc      = "Controls automated swarming and skirming",
    author    = "aZaremoth",
    date      = "2018-08-21",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end


local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitNearestEnemy = Spring.GetUnitNearestEnemy
local spGetUnitDefID = Spring.GetUnitDefID
local spGetCommandQueue = Spring.GetCommandQueue
local spGetUnitSeparation = Spring.GetUnitSeparation
local random = math.random

local CMD_ATTACK       = CMD.ATTACK
local CMD_FIGHT        = CMD.FIGHT

--------------------------
----CONFIG
--------------------------

-- skirm
local orderDis = 100
-- swarm
local leeway = 20 -- substracted from weapon range
local jinkOrderDis = 150
local jinkVariation = 80
local circleOrderDis = 130 --currently not used as it looks like a fixed circling range
local searchRange = 600

-- swarmers will more or less circle strafe around targets and move in zick-zack towards it
local swarmArray = { 
-- melees or close range
  "euf_pyro",
  "euf_paladin",
  "euf_werewolf",
  "tc_decoyshade",
  "tc_ghoul",
  "tc_undeadmarine_melee",  
  "tc_skeleton",
-- ranged 
  "euf_marine",
  "tc_undeadmarine_gun",  
  "tc_gunner",
  "tc_mage",
}

-- Automatically sends units to max range
local skrimArray = { 
--  "bug_larva",
--  "bug_larva_undead",  
--  "euf_sniper",
  "tc_bonebeast",
}

local unitstate = {}	
local controlledUnits = {}
local swarmSet = {}
local skrimSet = {}
	
---------------------------------------------------------------------------------------------------------------
if (not gadgetHandler:IsSyncedCode()) then
	return false
end

--------------------------------------------------------------------------------
-- Command

include("LuaRules/Configs/customcmds.h.lua")

local unitAICmdDesc = {
	id      = CMD_UNIT_AI,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Unit AI',
	action  = 'unitai',
	tooltip = 'Toggles automated movement control for the unit',
	params  = {1, 'AI On','AI Off'}
}

--------------------------------------------------------------------------------
-- Command Handling
local function AIToggleCommand(unitID, cmdParams, cmdOptions)
	if unitstate[unitID] then
		local state = cmdParams[1]
		local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_UNIT_AI)		
		if (cmdDescID) then
			unitAICmdDesc.params[1] = state
			Spring.EditUnitCmdDesc(unitID, cmdDescID, { params = unitAICmdDesc.params})
			unitstate[unitID] = state
		end
	end
end

function gadget:AllowCommand_GetWantedCommand()	
	return {[CMD_UNIT_AI] = true}
end

function gadget:AllowCommand_GetWantedUnitDefID()
	return true
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	if (cmdID ~= CMD_UNIT_AI) then
		return true  -- command was not used
	end
	AIToggleCommand(unitID, cmdParams, cmdOptions)  
	return false  -- command was used
end
--------------------------------------------------------------------------------
function getAttack(unit,v,cQueue)
  if cQueue and (#cQueue == 0) then
	return false
  else
	if (cQueue[1].id == CMD.ATTACK) or (cQueue[1].id == 16) then
	  local target,check = cQueue[1].params[1],cQueue[1].params[2]
	  if not check then
	    return target,false
	  elseif (cQueue[1].id == 16) then
	    return -1,false
	  end
    elseif (cQueue[1].id == CMD.MOVE) and #cQueue > 1 then
	  local cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
	  if (cx == v.cx) and (cy == v.cy) and (cz == v.cz) then
	    if (cQueue[2].id == CMD.ATTACK) or (cQueue[2].id == 16) then
          local target,check = cQueue[2].params[1],cQueue[2].params[2]
	      if not check then
	        return target,true
	      elseif (cQueue[2].id == 16) then
	        return -1,true
	      end
	    end
	  end
	end
  end
  return false
end

function checkSwarmers()
  for unit, v in pairs(controlledUnits) do
	if (unitstate[unit] == 1) then
		local cQueue = spGetCommandQueue(unit,2)
		local enemy,move = getAttack(unit,v,cQueue) 
		local burrowed = Spring.GetUnitRulesParam(unit,"burrowed")	
		if ((burrowed ~= 1) and enemy) then
		  if enemy == -1 then
			enemy = spGetUnitNearestEnemy(unit,searchRange)
			if not enemy then
			  return
			end
		  end
		  local ex,ey,ez = spGetUnitPosition(enemy)
		  local ux,uy,uz = spGetUnitPosition(unit)
		  local pointDis = spGetUnitSeparation(unit,enemy)
		  local cx 
		  local cy
		  local cz 
		  if pointDis then
			if (v.dir == nil) then -- skirm check
				Spring.Echo("SKIRM: " .. unit)
				local holdPos = (Spring.GetUnitStates(unit).movestate == 0)
				if not holdPos then 
					Spring.Echo("SKIRM: No hold position for " .. unit)
					if v.range > pointDis then
						local ed = spGetUnitDefID(enemy)
						local er = UnitDefs[ed].maxWeaponRange
						if (er) and (er < v.range) and (er > 0) then
						  Spring.Echo("SKIRM: Get out of range! " .. unit)
						  local ex,ez,ez = spGetUnitPosition(enemy)
						  local ux,uy,uz = spGetUnitPosition(unit)
						  local pointDis = spGetUnitSeparation(unit,enemy)
						  local dis = orderDis 
						  local f = dis/pointDis
						  if (pointDis+dis > v.range) then
							f = (v.range-pointDis)/pointDis
						  end
						  local cx = ux+(ux-ex)*f
						  local cy = uy
						  local cz = uz+(uz-ez)*f
						  spGiveOrderToUnit(unit,CMD.MOVE,{cx,cy,cz},CMD.OPT_RIGHT)
						  v.cx,v.cy,v.cz = cx,cy,cz
						end
					end
				end
			else
				if (v.range-leeway) < pointDis then
				  local ed = spGetUnitDefID(enemy)
				  local er = UnitDefs[ed].maxWeaponRange
				  if pointDis < er then
					v.dir = v.dir*-1
					local dir = v.dir
					cx = ux+(-(ux-ex)*jinkOrderDis-(uz-ez)*dir)/pointDis
					cy = uy
					cz = uz+(-(uz-ez)*jinkOrderDis+(ux-ex)*dir)/pointDis
					if move then
					  spGiveOrderToUnit(unit, CMD.REMOVE, {cQueue[1].tag}, {} )
					  spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
					else
					  spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
					end
					v.cx,v.cy,v.cz = cx,cy,cz
				  end
				else
				  local up = 0.9
				  local ep = 0.1
				  v.dir = v.dir*-1
				  if v.dir > 0 then
					up = 0.8
					ep = 0.2
				  end
				  cx = ux*up+ex*ep+v.rot*(uz-ez)*circleOrderDis/pointDis
				  cy = uy
				  cz = uz*up+ez*ep-v.rot*(ux-ex)*circleOrderDis/pointDis
				  if move then
					spGiveOrderToUnit(unit, CMD.REMOVE, {cQueue[1].tag}, {} )
					spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
				  else
					spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
				  end
				  v.cx,v.cy,v.cz = cx,cy,cz
				end
			end
		  end
		end 
	  end
	end
end

local function IsSwarm(ud)
  for i, v in pairs(swarmSet) do
    if (swarmSet[ud.name]) then
	  return true
	end
  end
  return false
end

local function IsSkirm(ud)
  for i, v in pairs(skrimSet) do
    if (skrimSet[ud.name]) then
	  return true
	end
  end
  return false
end

---------------------------------------------------------------------------------------------------------------
function gadget:Initialize()
  -- register command -----------------------
  gadgetHandler:RegisterCMDID(CMD_UNIT_AI)
  -------------------------------------------
  for i, v in pairs(swarmArray) do
    swarmSet[v] = true
  end
  for i, v in pairs(skrimArray) do
    skrimSet[v] = true
  end  
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	local ud = UnitDefs[unitDefID]
    if (ud ~= nil) then
		if (IsSkirm(ud) or IsSwarm(ud)) then
			Spring.InsertUnitCmdDesc(unitID, unitAICmdDesc)
			if not unitstate[unitID] then
				unitstate[unitID] = 1
			end
		end
		if IsSkirm(ud) then
		  controlledUnits[unitID] = {range = ud.maxWeaponRange, cx = 0, cy = 0, cz = 0}
		end
		if IsSwarm(ud) then
		  controlledUnits[unitID] = {range = ud.maxWeaponRange, cx = 0, cy = 0, cz = 0, dir = jinkVariation, rot = random(0,1)*2-1}
		end
	end
end

function gadget:UnitGiven(unitID, unitDefID, unitTeam)
  gadget:UnitCreated(unitID, unitDefID, unitTeam)
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (controlledUnits[unitID]) then
    controlledUnits[unitID] = nil
  end  
end

function gadget:GameFrame(n)
  if (n%15<1) then --was 35
	checkSwarmers()
  end
end

