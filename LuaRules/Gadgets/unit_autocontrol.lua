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

local std_updateinterval = 35 -- in gameframes

-- skirm
local orderDis = 100
local rangeReduction = 30
-- swarm
local leeway = 10 -- substracted from own weapon's range
local std_jinkOrderDis = 150
local jinkVariation = 20 -- was 80
local circleOrderDis = 130
local searchRange = 600
local minimumjumpdist = 100

local unitstate = {}
local updateListUnits = {}
local spec_updateinterval = {}
local spec_jinkorderdis = {}
local spec_jumprange = {}
local controlledUnits = {}
local swarmSet = {}
local skrimSet = {}


-- swarmers will more or less circle strafe around targets and move in zick-zack towards it
local swarmArray = { 
-- melees or close range
  "bug_med",
  "bug_med_undead",  
  "euf_pyro",
  "euf_paladin",
  "euf_werewolf",
  "tc_decoyshade",
  "tc_ghoul",
  "tc_undeadmarine_melee",
  "tc_skeleton",
-- ranged 
  "euf_marine",
  "euf_raider", 
  "tc_undeadmarine_gun",  
  "tc_gunner",
  "tc_mage",
}

-- Automatically sends units to (almost) max range
local skrimArray = { 
  "bug_larva",
  "bug_larva_undead",  
  "euf_sniper",
  "euf_bazooka",
  "euf_hover",
  "euf_tank",
  "euf_aatank",
  "tc_enforcer",  
  "tc_bonebeast",
  "tc_mermeoth",    
  "tc_agares",  
  "tc_witch",
}

----- JUMPERS

local jumpDefNames  = VFS.Include"LuaRules/Configs/jump_defs.lua"
local jumpDefs = {}
local runrange = 300

for name, data in pairs(jumpDefNames) do
	jumpDefs[UnitDefNames[name].id] = data
end

local JumperPairs = {
	[UnitDefNames.euf_pyro.id] = "euf_pyro",
	[UnitDefNames.tc_ghoul.id] = "tc_ghoul",
	[UnitDefNames.tc_mage.id] = "tc_mage",
--	[UnitDefNames.tc_cacodemon.id] = "tc_cacodemon",
	[UnitDefNames.euf_sarge_lvl2.id] = "euf_sarge_lvl2",
	[UnitDefNames.euf_sarge_lvl3.id] = "euf_sarge_lvl3",
	[UnitDefNames.euf_sarge_lvl4.id] = "euf_sarge_lvl4",
	[UnitDefNames.euf_sarge_lvl5.id] = "euf_sarge_lvl5",
	[UnitDefNames.tc_shade_lvl2.id] = "tc_shade_lvl2",
	[UnitDefNames.tc_shade_lvl3.id] = "tc_shade_lvl3",
	[UnitDefNames.tc_shade_lvl4.id] = "tc_shade_lvl4",
	[UnitDefNames.tc_shade_lvl5.id] = "tc_shade_lvl5",
}	

	
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
	    return target,false,false
	  elseif (cQueue[1].id == 16) then
	    return -1,false,false
	  end
    elseif (cQueue[1].id == CMD.MOVE) and #cQueue > 1 then
	  local cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
	  if (cx == v.cx) and (cy == v.cy) and (cz == v.cz) then
	    if (cQueue[2].id == CMD.ATTACK) or (cQueue[2].id == 16) then
          local target,check = cQueue[2].params[1],cQueue[2].params[2]
	      if not check then
	        return target,true,false
	      elseif (cQueue[2].id == 16) then
	        return -1,true,false
	      end
	    end
	  end
	elseif (cQueue[1].id == CMD_JUMP) and #cQueue > 1 then
	  local target,check = cQueue[1].params[1],cQueue[1].params[2]
	  if not check then
	    return target,false,true
	  elseif (cQueue[1].id == 16) then
	    return -1,false,true
	  end
	end
  end
  return false
end

function checkUnit(unitID)
	if (unitstate[unitID] == 1) then
	  local v = controlledUnits[unitID]
	  if (v ~= nil) then
		local cQueue = spGetCommandQueue(unitID,2)
		local enemy,move,jumpcom = getAttack(unitID,v,cQueue) 
		local burrowed = Spring.GetUnitRulesParam(unitID,"burrowed")	
		if ((burrowed ~= 1) and enemy) then
		  if enemy == -1 then
			enemy = spGetUnitNearestEnemy(unitID,searchRange)
			if not enemy then
			  return
			end
		  end
		  local ex,ey,ez = spGetUnitPosition(enemy)
		  local ux,uy,uz = spGetUnitPosition(unitID)
		  local pointDis = spGetUnitSeparation(unitID,enemy)
		  local cx 
		  local cy
		  local cz 
		  if pointDis then
			if (v.dir == nil) then -- skirm check
				local holdPos = (Spring.GetUnitStates(unitID).movestate == 0)
				if not holdPos then 
					if v.range > pointDis then
						local ed = spGetUnitDefID(enemy)
						local er = UnitDefs[ed].maxWeaponRange
						if (er) and (er < v.range) and (er > 0) then -- I can outdistance the enemy so run
						  local dis = orderDis 
						  local f = dis/pointDis
						  if (pointDis+dis > v.range) then
							f = (v.range-pointDis)/pointDis
						  end
						  local cx = ux+(ux-ex)*f
						  local cy = uy
						  local cz = uz+(uz-ez)*f
						  spGiveOrderToUnit(unitID,CMD.MOVE,{cx,cy,cz},CMD.OPT_RIGHT)
						  v.cx,v.cy,v.cz = cx,cy,cz
						end
					end
				end
			else -- it is a swarmer or jumper
				if v.range < pointDis then -- enemy not yet in own range, close in
					  local ed = spGetUnitDefID(enemy)
					  local er = UnitDefs[ed].maxWeaponRange
					  local jump = false
					  if v.jumper then
							jump = ((Spring.GetUnitRulesParam(unitID, "jumpReload") == nil) or (Spring.GetUnitRulesParam(unitID, "jumpReload") == 1))
					  end
					  if (pointDis < er and (not v.jumperonly) and (not jump)) then -- within enemy's range => zick zack
							v.dir = v.dir*-1
							local dir = v.dir or 1
							if (move or jumpcom) then
								 spGiveOrderToUnit(unitID, CMD.REMOVE, {cQueue[1].tag}, {} )		
							end
							cx = ux+(-(ux-ex)*spec_jinkorderdis[unitID]-(uz-ez)*dir)/pointDis
							cy = uy
							cz = uz+(-(uz-ez)*spec_jinkorderdis[unitID]+(ux-ex)*dir)/pointDis
							spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
							v.cx,v.cy,v.cz = cx,cy,cz
					  else -- outside of the enemy's range
							if jump then	-- only relevant for jumpers: outside of the enemy's range. Jump there!	
								local dis = orderDis 
								local f = dis/pointDis
								if (pointDis+dis > v.range) then
									f = (v.range-pointDis)/pointDis
								end
								local cx = ux+(ux-ex)*f
								local cy = uy
								local cz = uz+(uz-ez)*f
								local unittposdist = math.sqrt((ux-cx)^2+(uz-cz)^2)
								-- Spring.Echo(unittposdist)
								if (unittposdist > minimumjumpdist) then
									if (move or jumpcom) then
										 spGiveOrderToUnit(unitID, CMD.REMOVE, {cQueue[1].tag}, {} )
									end
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, cx,cy,cz }, {"alt"} )
								end
							end
							v.cx,v.cy,v.cz = cx,cy,cz
					  end
				elseif (not v.jumperonly) then -- enemy is in own fire range. Don't jump too far here. Circle around
						local jump = false				
						if v.jumper then
							jump = ((Spring.GetUnitRulesParam(unitID, "jumpReload") == nil) or (Spring.GetUnitRulesParam(unitID, "jumpReload") == 1))
						end
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
						if (move or jumpcom) then
							  spGiveOrderToUnit(unitID, CMD.REMOVE, {cQueue[1].tag}, {} )
							  if jump then						  
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, cx,cy,cz }, {"alt"} )
							  else
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
							  end	
						else
							  if jump then				  
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, cx,cy,cz }, {"alt"} )
							  else
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
							  end
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

local function prepareUnit(unitID, unitDefID)
	Spring.InsertUnitCmdDesc(unitID, unitAICmdDesc)
	if not unitstate[unitID] then
		unitstate[unitID] = 1
	end
	spec_updateinterval[unitID] = ((tonumber(UnitDefs[unitDefID].customParams.unitaiupdate)) or std_updateinterval)
	spec_jinkorderdis[unitID] = ((tonumber(UnitDefs[unitDefID].customParams.unitaijinkdis)) or std_jinkOrderDis)		
	spec_jumprange[unitID] = ((tonumber(UnitDefs[unitDefID].customParams.unitjumpjink)) or std_jinkOrderDis)
	updateListUnits[unitID] = (Spring.GetGameFrame() + spec_updateinterval[unitID])
	return true
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
			if IsSkirm(ud) then
				prepareUnit(unitID, unitDefID)
				if JumperPairs [unitDefID] then
					controlledUnits[unitID] = {jumper = true, update = nextupdate, range = (ud.maxWeaponRange-rangeReduction), cx = 0, cy = 0, cz = 0}
				else
					controlledUnits[unitID] = {update = nextupdate, range = (ud.maxWeaponRange-rangeReduction), cx = 0, cy = 0, cz = 0}
				end
			elseif IsSwarm(ud) then
				prepareUnit(unitID, unitDefID)
				if JumperPairs [unitDefID] then
					controlledUnits[unitID] = {jumper = true, update = nextupdate, range = (ud.maxWeaponRange-leeway), cx = 0, cy = 0, cz = 0, dir = jinkVariation, rot = random(0,1)*2-1}
				else
					controlledUnits[unitID] = {update = nextupdate, range = (ud.maxWeaponRange-leeway), cx = 0, cy = 0, cz = 0, dir = jinkVariation, rot = random(0,1)*2-1}
				end
			end
		elseif (JumperPairs [unitDefID]) then
			prepareUnit(unitID, unitDefID)
--			Spring.Echo("Jumper only found!")
			controlledUnits[unitID] = {jumperonly = true, jumper = true, update = nextupdate, range = (ud.maxWeaponRange-leeway), cx = 0, cy = 0, cz = 0, dir = jinkVariation, rot = random(0,1)*2-1}
		end
	end
end

function gadget:UnitGiven(unitID, unitDefID, unitTeam)
  gadget:UnitCreated(unitID, unitDefID, unitTeam)
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (controlledUnits[unitID]) then
    controlledUnits[unitID] = nil
	spec_updateinterval[unitID] = nil
	spec_jinkorderdis[unitID] = nil
	spec_jumprange[unitID] = nil	
	updateListUnits[unitID] = nil
  end  
end

--[[function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)

	local ai = select(4, Spring.GetTeamInfo(unitTeam))
	local areallied = false
	
	if ((unitTeam ~= nil) and (attackerTeam ~=nil)) then
		if (unitTeam == attackerTeam) then
			areallied = true
		elseif ((unitTeam > 0) and (attackerTeam > 0)) then
			areallied = Spring.AreTeamsAllied(unitTeam, attackerTeam)
		end
	end
	
	if ( (not areallied) and ( (Spring.GetGaiaTeamID() == unitTeam) or (ai) or (AggressiveJumpersPairs[unitDefID] and (unitstate[unitID] == 1)) ) ) then	
		if (attackerID) then
			if JumperPairs [unitDefID] then
				local ud = UnitDefs[attackerDefID]
				if not ud.canFly then
					local jump = Spring.GetUnitRulesParam(unitID, "jumpReload")
					if ((not jump) or jump == 1) then
						local cQueue = Spring.GetCommandQueue(unitID, 1)
						if #cQueue == 0 or cQueue[1].id ~= CMD_JUMP then
							local randomx
							local randomy
							if (math.random(-1,1) > 0) then
								randomx = math.random(-50,50)
								randomz = math.random(30,50)*(-1)
							else 
								randomx = math.random(-50,50)						
								randomz = math.random(30,50)						
							end				
							local x,y,z = Spring.GetUnitPosition(unitID)
							local ax,ay,az = Spring.GetUnitPosition(attackerID)
							local dist = math.sqrt((ax-x)^2+(az-z)^2)

							local jumpdist = 0
							if (UnitDefs[unitDefID].weapons ~= nil) then
								for i,w in ipairs(UnitDefs[unitDefID].weapons) do
									jumpdist = (dist - (WeaponDefs[w.weaponDef].range))
								end
							else 
								jumpdist = (-jumpDefs[unitDefID])
							end
							local jx = x+randomx
							local jz = z+randomz
							if ( jumpdist < (jumpDefs[unitDefID].range + runrange)) then
								jx = x+((ax-x)*(jumpdist/dist))
								jz = z+((az-z)*(jumpdist/dist))
							else
								jx = x+((ax-x)*(-jumpDefs[unitDefID].range/dist))
								jz = z+((az-z)*(-jumpDefs[unitDefID].range/dist))
							end
							local burrowed = Spring.GetUnitRulesParam(unitID,"burrowed")						
							if (burrowed ~= 1 and (math.sqrt(jumpdist^2) > 50 )) then
								-- Spring.GiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, jx,y,jz }, {"alt"} ) -- should insert the command at the beginning of the command queue 
								  local move = false
								  if (cQueue[1] ~= nil) then
									move = (cQueue[1].id == CMD.MOVE)
								  end
								  if move then
									spGiveOrderToUnit(unitID, CMD.REMOVE, {cQueue[1].tag}, {} )
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, jx,y,jz }, {"alt"} )
								  else
									spGiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_JUMP, CMD.OPT_INTERNAL, jx,y,jz }, {"alt"} )
								  end
								
							end
						end
					end
				end
			end
		end
	end
end ]]--

function gadget:GameFrame(n)
	for unitID, updateframe in pairs(updateListUnits) do -- this should spread the calculation load to more gameframes
		if (updateframe <= n) then
			updateListUnits[unitID] = (n + spec_updateinterval[unitID] + random(0,1))
			checkUnit(unitID)
		end
	end
end

