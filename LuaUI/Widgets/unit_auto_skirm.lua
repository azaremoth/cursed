
function widget:GetInfo()
  return {
    name      = "Auto Skirm",
    desc      = "Automatically keeps units at max range",
    author    = "Google Frog",
    date      = "Dec 23, 2008",
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

--------------------------
----CONFIG
--------------------------

local orderDis = 100

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
 
  if (n%30<1) then 
	checkSkirms()
  end
  
end

function checkSkirms()
  for unit, v in pairs(skirm) do
  
    if checkIdle(unit,v) then
	
	  local enemy = spGetUnitNearestEnemy(unit,v.range+200,true)
	  if (enemy) then
	    local ed = spGetUnitDefID(enemy)
	    local er = UnitDefs[ed].maxWeaponRange
	    if (er) and (er < v.range) and (er ~= 0) then
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
	
  end
end

function checkIdle(unit,v)

  local cQueue = spGetCommandQueue(unit,6)

  if cQueue and (#cQueue == 0) then
    return true
  elseif (#cQueue == 1) then
  
    local cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
	if (cx == v.cx) and (cy == v.cy) and (cz == v.cz) then
	  return true
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

local function IsSkirm(ud)
  
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
  
    if ( (ud ~= nil) and IsSkirm(ud) ) then
    
	  skirm[unitID] = {range = ud.maxWeaponRange-35, cx = 0, cy = 0, cz = 0}
	
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


