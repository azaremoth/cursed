function widget:GetInfo()
  return {
    name      = "Auto Skirm",
    desc      = "v3 Automatically keeps units at max range",
    author    = "Google Frog",
    date      = "Dec 24, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local team = Spring.GetMyTeamID()
local skirm = {}

----SPEEDUPS

local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitNearestEnemy = Spring.GetUnitNearestEnemy
local spGetUnitDefID = Spring.GetUnitDefID
local spGetCommandQueue = Spring.GetCommandQueue
local spGetUnitSeparation = Spring.GetUnitSeparation
local echo = Spring.Echo

--------------------------
----CONFIG
--------------------------

local idleSkrim = false -- should units skirm when idle
local fightSkirm = true -- should they skirm when given a fight or patrol order
local rangeCheck = false -- should they only skirm things with less range than themselves
local onlySkirmTargets = true -- units only skirm things that they can hit when patrol or fight skirming

local leeway = 15

local orderDis = 120

local unitArray = { 
-- melees
  "tc_shade_lvl1",
  "tc_shade_lvl2",
  "tc_shade_lvl3",
  "tc_shade_lvl4",
  "tc_shade_lvl5",
  "tc_ghoul", 
  "euf_paladin",
-- others  
  "tc_gunner",
  "tc_mage",
  "tc_bonebeast",
  "tc_shade",
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
  "euf_pyro",
  "euf_raider",  
  "euf_tank",
  "euf_aatank",
  "euf_mlrs",
  "euf_scorpion",
}


--------------------------
----SKIRMISHER CONTROL
--------------------------

function widget:GameFrame(n)
 
  if (n%15<1) then 
	checkSkirms()
  end
  
end

function checkSkirms()
  for unit, v in pairs(skirm) do

	local cQueue = spGetCommandQueue(unit, 20)
	local orderType = checkIdle(unit,v,cQueue) 
  
    if (orderType ~= 0) then

	  local enemy = spGetUnitNearestEnemy(unit,v.range)

	  if rangeCheck then
	    local ed = spGetUnitDefID(enemy)
	    local er = UnitDefs[ed].maxWeaponRange
	    if not ((er) and (er < v.range) and (er ~= 0)) then
	      return
		end
	  end
	  
	  if (enemy) then

	    local ex,ey,ez = spGetUnitPosition(enemy)
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
		if (orderType == 1) then
	      spGiveOrderToUnit(unit,CMD.MOVE,{cx,cy,cz},CMD.OPT_RIGHT)
		elseif (orderType == 2) then
		  spGiveOrderToUnit(unit, CMD.REMOVE, {cQueue[1].tag}, {} )
		  spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
		elseif (orderType == 3) then
		  spGiveOrderToUnit(unit, CMD.INSERT, {0, CMD.MOVE, CMD.OPT_SHIFT, cx,cy,cz }, {"alt"} )
		end
		v.cx,v.cy,v.cz = cx,cy,cz
		
	  end
	  
	end
	
  end
end

function checkIdle(unit,v,cQueue)
if (cQueue ~= nil) then
  if (#cQueue == 0) then
    if idleSkirm then
	  return 1
	end
  elseif (#cQueue == 1) then
  
    local cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
	if (cx == v.cx) and (cy == v.cy) and (cz == v.cz) then
	  return 1
	end
	
  else
    
	if (cQueue[1].id == 16)  then
	  if fightSkirm then
	    if cQueue[1].params[2] then
		  if not onlySkirmTargets then
		    return 3
		  end
		else
		  return 2
		end
	  end
	else 
	  local cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
	  if (cx == v.cx) and (cy == v.cy) and (cz == v.cz) then
	    return 2
	  end
	end
  
  end

  return 0
end  
end

--------------------------
----UNIT DETECTION
--------------------------

local unitSet = {}

function widget:Initialize() 
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
    
	  skirm[unitID] = {range = ud.maxWeaponRange-leeway, cx = 0, cy = 0, cz = 0}

    end
  elseif (skirm[unitID]) then
    skirm[unitID] = nil
  end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam)
  widget:UnitCreated(unitID, unitDefID, unitTeam)
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (skirm[unitID]) then
    skirm[unitID] = nil
  end
end


