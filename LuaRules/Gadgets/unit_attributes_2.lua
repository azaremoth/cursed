--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
   return {
      name      = "Attributes for auras and burrowing",
      desc      = "Handles UnitRulesParam attributes that are not related to movement speed or reload time.",
      author    = "CarRepairer",
      date      = "2009-11-27",
      license   = "GNU GPL, v2 or later",
      layer     = -1,
      enabled   = true, 
   }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local KamikazePairs = {
	[UnitDefNames.tc_suicide.id] = "tc_suicide",
	[UnitDefNames.tc_pestilence.id] = "tc_pestilence",
	}

local MaxSizeX = Game.mapSizeX
local MaxSizeZ = Game.mapSizeZ

include("LuaRules/Configs/customcmds.h.lua")

--SYNCED
if gadgetHandler:IsSyncedCode() then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local spGetUnitDefID        	= Spring.GetUnitDefID
local spGetUnitStates  			= Spring.GetUnitStates

local spGetUnitRulesParam  		= Spring.GetUnitRulesParam
local spSetUnitRulesParam  		= Spring.SetUnitRulesParam

local spGetUnitHealth  			= Spring.GetUnitHealth
local spSetUnitHealth  			= Spring.SetUnitHealth

local spSetUnitMaxHealth  			= Spring.SetUnitMaxHealth

local spSetUnitWeaponState  = Spring.SetUnitWeaponState

local spGetUnitsInCylinder 	= Spring.GetUnitsInCylinder
local spGetUnitPosition 	= Spring.GetUnitPosition

local spSpawnCEG 				= Spring.SpawnCEG

local random	= math.random
local echo = Spring.Echo

local MAX_SPEED = 75

local COBRATIO = 1/30*65535

-- local heroaurahealthmultiplier = 1.5


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

KamikazeCommand = {
		id=CMD_KAMIKAZE,
		type=CMDTYPE.ICON,
		name="",
		texture="&.9x.9&bitmaps/icons/blank.tif&bitmaps/icons/kamikaze.png",
		tooltip="Sacrifice.\r\nHint: Kill this unit.",
		action="sacrifice"
		}
		
local activeUnits = {}

local burrow_crusts = {}
-- local currentmaxhp = {}	

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	activeUnits[unitID] = true
	if KamikazePairs [unitDefID] then
		Spring.InsertUnitCmdDesc(unitID, KamikazeCommand)
	end	
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	activeUnits[unitID] = nil
	if (burrow_crusts[unitID] and not KamikazePairs [unitDefID]) then
		Spring.DestroyUnit(burrow_crusts[unitID])
		burrow_crusts[unitID] = nil
	end	
end

function gadget:CommandFallback(unitID, unitDefID, unitTeam, cmd, param, opts)
	if cmd  == CMD_KAMIKAZE then
		local valid = 1
		local x,y,z = Spring.GetUnitPosition(unitID)
		local height = Spring.GetGroundHeight(x,z)
		local MaxSizeX = Game.mapSizeX
		local MaxSizeZ = Game.mapSizeZ
		if x < 0  or  x > MaxSizeX or z < 0 or z > MaxSizeZ or height < -5 then valid = 0 else valid = 1 end
		if valid == 1 then
			Spring.DestroyUnit(unitID,false,false)
			if (burrow_crusts[unitID]) then
				Spring.DestroyUnit(burrow_crusts[unitID])
				burrow_crusts[unitID] = nil
			end		
		end
	return true, true;
	end
	return false
end

function gadget:GameFrame(f)
	
	if f % 32 < .1 then
		for unitID, teamID in pairs(activeUnits) do
		
			if not Spring.ValidUnitID(unitID) then
				activeUnits[unitID] = nil
				if (burrow_crusts[unitID]) then
					Spring.DestroyUnit(burrow_crusts[unitID])
					burrow_crusts[unitID] = nil
				end
			end
		
			local udid = spGetUnitDefID(unitID)
			if not udid then return end
				
			local ud = UnitDefs[udid]
			
			local burrowed = spGetUnitRulesParam(unitID,"burrowed")
			
			-- AURAS ------------------------------------------------------------------------------------------------
			--- Heroes ---
			if (burrowed ~= 1 and spGetUnitRulesParam(unitID,"Hero Aura") == 1) then
				for i,w in ipairs(ud.weapons) do
					local origRange = WeaponDefs[w.weaponDef].range	
					spSetUnitWeaponState(unitID, i, {range = origRange * 1.25 } )
					-- Spring.Echo("increased from " .. origRange .. " to " .. origRange * 1.25 )
				end
				spSetUnitHealth(unitID, spGetUnitHealth(unitID)+10 ) 					
			end	
			--- Frenzy and Fear ---
			if (burrowed ~= 1 and spGetUnitRulesParam(unitID,"Frenzy Aura") == 1) and spGetUnitRulesParam(unitID,"Fear Aura") ~= 1 then
				for i,w in ipairs(ud.weapons) do
					local origSprayAngle  = WeaponDefs[w.weaponDef].sprayAngle
					local newSprayAngle = 0.1
					if origSprayAngle > 0.1 then
						newSprayAngle = (origSprayAngle * 1.15)
					end
					spSetUnitWeaponState(unitID, i, {sprayAngle  = newSprayAngle } ) -- was origSprayAngle+0.15
					spSetUnitRulesParam(unitID,"selfReloadSpeedChange", 1.33)	
				end
			elseif (burrowed ~= 1 and spGetUnitRulesParam(unitID,"Fear Aura") == 1) then
				for i,w in ipairs(ud.weapons) do
					local origSprayAngle  = WeaponDefs[w.weaponDef].sprayAngle
					local newSprayAngle = 0.3
					if origSprayAngle > 0.3 then
						newSprayAngle = (origSprayAngle * 1.33)
					end
					spSetUnitWeaponState(unitID, i, {sprayAngle  = newSprayAngle } ) -- was origSprayAngle+0.25
				end
			end
			--- Heal --
			if (burrowed ~= 1 and  spGetUnitRulesParam(unitID,"Heal Aura") == 1) then
				spSetUnitHealth(unitID, spGetUnitHealth(unitID)+15 ) -- heals 15 hp per second
			end
			--- Focus --
			if (burrowed ~= 1 and  spGetUnitRulesParam(unitID,"Focus Aura") == 1) then
				for i,w in ipairs(ud.weapons) do
					local origAcc = WeaponDefs[w.weaponDef].accuracy		
					spSetUnitWeaponState(unitID, i, {accuracy = origAcc * 0.66 } )		
				end
			end
			-- Pest --
			if burrowed ~= 1 and  spGetUnitRulesParam(unitID,"Pest Aura") == 1 then
				spSetUnitHealth(unitID, spGetUnitHealth(unitID)-25 )
			end	
			--END AURAS ------------------------------------------------------------------------------------------------
			if spGetUnitRulesParam(unitID,"Hero Aura") ~= 1 then
				for i,w in ipairs(ud.weapons) do
					local origRange = WeaponDefs[w.weaponDef].range	
					spSetUnitWeaponState(unitID, i, {range = origRange} )
					-- Spring.Echo("decreased")
				end
			end	

			if spGetUnitRulesParam(unitID,"Focus Aura") ~= 1 then
				for i,w in ipairs(ud.weapons) do
					local origAcc = WeaponDefs[w.weaponDef].accuracy		
					spSetUnitWeaponState(unitID, i, {accuracy = origAcc} )				
				end
			end

			if spGetUnitRulesParam(unitID,"Fear Aura") ~= 1 and spGetUnitRulesParam(unitID,"Frenzy Aura") ~= 1 then
				for i,w in ipairs(ud.weapons) do
					local origSprayAngle  = WeaponDefs[w.weaponDef].sprayAngle 
					spSetUnitWeaponState(unitID, i, {sprayAngle  = origSprayAngle } )
				end
			end	

			if spGetUnitRulesParam(unitID,"Frenzy Aura") ~= 1 then
				spSetUnitRulesParam(unitID,"selfReloadSpeedChange", 1)	
			end	
			
			
			-- BURROWED --
			if burrowed == 1 then
			
				if not burrow_crusts[unitID] then
					--make crust
					local x,y,z = spGetUnitPosition(unitID)
					local teamID = Spring.GetUnitTeam(unitID)					
					local crustID = Spring.CreateUnit('burrowcrust', x,y,z, 0, teamID )
					burrow_crusts[unitID] = crustID
					SendToUnsynced('setselectable', crustID, false)
					Spring.SetUnitBlocking(crustID, false, false, false, false, false, false, false)
					Spring.SetUnitCloak(crustID, 2, 0)
					
					--set cloak
					Spring.SetUnitCloak(unitID, 2, 0)
					Spring.SetUnitStealth(unitID, true)
					
					--don't block other units
					Spring.SetUnitBlocking(unitID, false, false, false, false, false, false, true)
					
					--don't move
				--	spSetUnitCOBValue(unitID, MAX_SPEED, 1)
					
					--make blind
					Spring.SetUnitSensorRadius(unitID, 'los', 0)
					Spring.SetUnitSensorRadius(unitID, 'airLos', 0)
				end
				
				--heal unit fast when burrowed
				spSetUnitHealth(unitID, spGetUnitHealth(unitID) + 15 )
				
			elseif burrowed == 0 then
				if burrow_crusts[unitID] then
					
					--see again
					local los = Spring.GetUnitSensorRadius(unitID, 'los')
					local airlos = Spring.GetUnitSensorRadius(unitID, 'airLos')
					local los		= ud.losRadius*16
					local airlos 	= ud.airLosRadius*16 
					Spring.SetUnitSensorRadius(unitID, 'los', los)
					Spring.SetUnitSensorRadius(unitID, 'airLos', airlos)
					
					--decloak
					Spring.SetUnitCloak(unitID, false)
					Spring.SetUnitStealth(unitID, false)
					
					--lock other units again
					Spring.SetUnitBlocking(unitID, true, true, true, true, true, true, false)			
											
					--remove crust
					Spring.DestroyUnit(burrow_crusts[unitID])
					burrow_crusts[unitID] = nil
				end
									
			end
			--end burrowed
				
			
		end
	end
	
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--SYNCED
else
--UNSYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--UNSYNCED
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
