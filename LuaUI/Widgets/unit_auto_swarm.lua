
function widget:GetInfo()
  return {
    name      = "Auto Swarm",
    desc      = "Handels raider jinking and swarming",
    author    = "Google Frog",
    date      = "Apr 27, 2009",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local team = Spring.GetMyTeamID()
local raider = {}
local CMD_SWARM = 38000

----SPEEDUPS

local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitNearestEnemy = Spring.GetUnitNearestEnemy
local spGetUnitDefID = Spring.GetUnitDefID
local spGetCommandQueue = Spring.GetCommandQueue
local spGetUnitSeparation = Spring.GetUnitSeparation
local random = math.random

--------------------------
----CONFIG
--------------------------

local leeway = 40

local jinkOrderDis = 150
local circleOrderDis = 60
local jinkVariation = 80
local searchRange = 600

local unitArray = { 
-- melees
  "tc_ghoul",
  "tc_shade",
  "tc_shade_lvl1",
  "tc_shade_lvl2",
  "tc_shade_lvl3",
  "tc_shade_lvl4",
  "tc_shade_lvl5",
  "tc_undeadmarine_melee",
  "euf_pyro",
-- others  
--[[  "tc_gunner",
  "tc_mage",
  "tc_bonebeast",
  "tc_mermeoth",
  "tc_agares",
  "tc_mancubus",
  "tc_belial",
  "euf_sarge",
  "euf_sarge_lvl1",
  "euf_sarge_lvl2",
  "euf_sarge_lvl3",
  "euf_sarge_lvl4",
  "euf_sarge_lvl5",  
  "euf_marine",
  "euf_bazooka",
  "euf_sniper",
  "euf_raider",  
  "euf_tank",
  "euf_aatank",
  "euf_mlrs",
  "euf_scorpion", ]]--
}


--------------------------
----SKIRMISHER CONTROL
--------------------------

function widget:GameFrame(n)
 
  if (n%15<1) then 
	checkRaiders()
  end
  
end

function checkRaiders()

  for unit, v in pairs(raider) do
	local cQueue = spGetCommandQueue(unit,2)
	local enemy,move = getAttack(unit,v,cQueue) 
  
    if enemy then
	
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
	  
	    if v.range < pointDis then
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

--------------------------
----UNIT DETECTION
--------------------------

local unitSet = {}

function widget:Initialize() 
  local playerID = Spring.GetMyPlayerID()
  local _, _, spec, _, _, _, _, _ = Spring.GetPlayerInfo(playerID)
		
  if ( spec == true ) then
    widgetHandler:RemoveWidget()
  end

  for i, v in pairs(unitArray) do
    unitSet[v] = true
  end
end

local function IsInUnitArray(ud)
  
  for i, v in pairs(unitSet) do
    if (unitSet[ud.name]) then
	  return true
	end
  end
  
  return false
  
end


function widget:UnitCreated(unitID, unitDefID, unitTeam)
  if (unitTeam == team) then
	
	local ud = UnitDefs[unitDefID]
    if ( (ud ~= nil) and ( IsInUnitArray(ud)) ) then

	  raider[unitID] = {range = ud.maxWeaponRange-leeway, cx = 0, cy = 0, cz = 0,dir = jinkVariation, rot = random(0,1)*2-1}
	  
    end
  elseif (raider[unitID]) then
    raider[unitID] = nil
  end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam)
  widget:UnitCreated(unitID, unitDefID, unitTeam)
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (raider[unitID]) then
    raider[unitID] = nil
  end
end


