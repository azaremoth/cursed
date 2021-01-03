function gadget:GetInfo()
  return {
    name      = "Critters",
    desc      = "Spawn neutral critters",
    author    = "CarRepairer",
    date      = "2009-11-18",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

include("LuaRules/Configs/customcmds.h.lua")


local modOptions = Spring.GetModOptions()
local cittersenabled = modOptions.critters
local campaignBattleID = Spring.GetModOptions().singleplayercampaignbattleid

if (cittersenabled == nil) or (cittersenabled == "0") or campaignBattleID then
	cittersenabled = false
end

local jumpDefNames  = VFS.Include"LuaRules/Configs/jump_defs.lua"
local jumpDefs = {}

for name, data in pairs(jumpDefNames) do
	jumpDefs[UnitDefNames[name].id] = data
end


if (gadgetHandler:IsSyncedCode() and cittersenabled) then
-------------------------------------
----- SYNCED -----

local spGetUnitDefID 			= Spring.GetUnitDefID
local spGetUnitPosition 		= Spring.GetUnitPosition
local spGiveOrderToUnit 		= Spring.GiveOrderToUnit

local CMD_MOVE = CMD.MOVE

local MAXSPAWN = 35
local SPAWNPERIOD = 30
local SPAWNDELAYLATE = 9000 -- = 30 frames x 60s x 5 minutes
local MOVEPERIOD = 15

local critterdefs_early = {
	UnitDefNames['pig'].id,
	UnitDefNames['bug_larva'].id,
	UnitDefNames['bug_med'].id,
	UnitDefNames['pig'].id,	
}

local critterdefs_late = {
	UnitDefNames['pig'].id,
	UnitDefNames['bug_larva'].id,
	UnitDefNames['bug_med'].id,
	UnitDefNames['bug_big'].id,
	UnitDefNames['pig'].id,	
}


local critterdefs = {}
for _,udid in ipairs(critterdefs) do
	critterdefs[udid] = true
end


local critter_type_count = #critterdefs_early
local critter_type_count_late = #critterdefs_late
local critters = {}
local crittercount = 0

local function SpawnCritter()
	if crittercount > MAXSPAWN then return end
	local x,y,z
	local crit_type = math.ceil(critter_type_count * math.random())
	local critterID = critterdefs_early[crit_type]
	local tries = 100
	while tries>0 do
		x = Game.mapSizeX * math.random()
		z = Game.mapSizeZ * math.random()
		y = Spring.GetGroundHeight(x,z)
		local unitsincylinder = Spring.GetUnitsInCylinder(x,z,800)
		local canMove = Spring.TestMoveOrder(critterID, x, y, z, 0, 0, 0, true, true, false) or false
		if ((y > 0) and (unitsincylinder[1] == nil) and canMove) then
			tries = 0
			local critID = Spring.CreateUnit(critterID, x,y,z, 0, Spring.GetGaiaTeamID())
			-- Spring.SetUnitNeutral(critID, true)
			critters[critID] = true
			crittercount = crittercount + 1			
		end
		tries = tries - 1
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if critters[unitID] then
		crittercount = crittercount - 1
		critters[unitID] = nil
	end
end

function gadget:GameFrame(f)
	if (f > SPAWNDELAYLATE and critterdefs_early ~= critterdefs_late) then
		critter_type_count = critter_type_count_late
		critterdefs_early = critterdefs_late
	end
	if f % (32 * SPAWNPERIOD) < 0.1 then
		SpawnCritter()
	end
	if f % (32 * MOVEPERIOD) < 0.1 then
		for critter_id, _ in pairs(critters) do
			if math.random() > 0.5 then
				local x,y,z = spGetUnitPosition(critter_id)
				if x then
					local xoffset = 20 - math.random()*40
					local zoffset = 20 - math.random()*40
					x = x + xoffset*xoffset
					z = z + zoffset*zoffset
					y = Spring.GetGroundHeight(x,z)
					spGiveOrderToUnit(critter_id, CMD_MOVE, {x,y,z}, {})
				end
			end
		end
		
	end
end



----- SYNCED -----
-------------------------------------
else
-------------------------------------
----- UNSYNCED -----


----- UNSYNCED -----
-------------------------------------
end


