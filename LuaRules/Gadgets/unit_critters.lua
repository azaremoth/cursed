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


local modOptions = Spring.GetModOptions()
local cittersenabled = modOptions.critters
Spring.Echo("Critters loading: " .. cittersenabled)


if (gadgetHandler:IsSyncedCode() and cittersenabled == "1") then
-------------------------------------
----- SYNCED -----

local spGetUnitDefID 			= Spring.GetUnitDefID
local spGetUnitPosition 		= Spring.GetUnitPosition
local spGiveOrderToUnit 		= Spring.GiveOrderToUnit

local spSetUnitWeaponState 		= Spring.SetUnitWeaponState

local CMD_MOVE = CMD.MOVE

local MAXSPAWN = 35
local SPAWNPERIOD = 30
local MOVEPERIOD = 15


local critterdefs_i = {
	UnitDefNames['pig'].id,
	UnitDefNames['bug_larva'].id,	
	UnitDefNames['bug_med'].id,	
	UnitDefNames['bug_big'].id,
}
local critterdefs = {}
for _,udid in ipairs(critterdefs) do
	critterdefs[udid] = true
end


local critter_type_count = #critterdefs_i
local critters = {}
local crittercount = 0


local function SpawnCritter()
	if crittercount > MAXSPAWN then return end
	
	local x,y,z
	local tries = 100
	while tries>0 do
	
		x = Game.mapSizeX * math.random()
		z = Game.mapSizeZ * math.random()
		y = Spring.GetGroundHeight(x,z)
		
		local unitsincylinder = Spring.GetUnitsInCylinder(x,z,800)
--		Spring.Echo(unitsincylinder[1])
		
		if ((y > 0) and (unitsincylinder[1] == nil)) then
			tries = 0

			local crit_type = math.ceil(critter_type_count * math.random())
			local critID = Spring.CreateUnit(critterdefs_i[crit_type], x,y,z, 0, Spring.GetGaiaTeamID())
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
					--Spring.Echo ('movenow',x,y,z)
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


