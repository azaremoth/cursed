--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Scaffold",
    desc      = "Adds Scaffolds while units are build",
    author    = "azaremoth",
    date      = "2010-06-18",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


if gadgetHandler:IsSyncedCode() then
------ SYNCED ----------	

local scaffoldunit_2x2 = {
	[UnitDefNames['euf_radar_lvl1'].id] = true,
	[UnitDefNames['euf_radar_lvl2'].id] = true,	
}

local scaffoldunit_4x4 = {
	[UnitDefNames['euf_aatower'].id] = true,	
	[UnitDefNames['euf_metalextractor_lvl1'].id] = true,
	[UnitDefNames['euf_plasmatower'].id] = true,
	[UnitDefNames['euf_autotower'].id] = true,
	[UnitDefNames['euf_heavytower'].id] = true,	
	[UnitDefNames['euf_pyrotower'].id] = true,		
}

local scaffoldunit_6x6 = {
	[UnitDefNames['euf_bunker'].id] = true,
	[UnitDefNames['euf_bunker_ai'].id] = true,	
	[UnitDefNames['euf_metalextractor_lvl2'].id] = true,	
	[UnitDefNames['euf_sanctum'].id] = true,			
	[UnitDefNames['euf_solar'].id] = true,			
}

local scaffoldunit_6x6_high = {
	[UnitDefNames['euf_lasertower'].id] = true,
	[UnitDefNames['euf_artytower'].id] = true,	
}

local scaffoldunit_8x8 = {}

local scaffoldunit_8x8_high = {
	[UnitDefNames['euf_techcenter'].id] = true,	
}

local scaffoldunit_10x10_high = {
	[UnitDefNames['euf_airport'].id] = true,
}

local scaffoldunit_11x11 = {
	[UnitDefNames['euf_church'].id] = true,
	[UnitDefNames['euf_church_ai'].id] = true,	
}

local scaffoldunit_8x12 = {
	[UnitDefNames['euf_barracks'].id] = true,
	[UnitDefNames['euf_barracks_ai'].id] = true,
}

local scaffoldunit_12x12 = {
	[UnitDefNames['euf_factory'].id] = true,
	[UnitDefNames['euf_factory_ai'].id] = true,
	[UnitDefNames['euf_storage'].id] = true,	
}

local scaffoldunit_12x5 = {
	[UnitDefNames['euf_powerplant'].id] = true,
}

local ScaffoldList = {}

local function MakeFeature(scaffold, x, y, z, heading, teamID, unitID)
		local newFeatureID = Spring.CreateFeature(scaffold, x, y, z, heading, teamID)
--		Spring.SetFeatureCollisionVolumeData(newFeatureID,0,0,0,0,-200,0,-1,0,0)
		Spring.SetFeatureBlocking(newFeatureID,false,false)
		Spring.SetFeatureNoSelect(newFeatureID,true)
		ScaffoldList[unitID] = newFeatureID
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	local x,y,z = Spring.GetUnitPosition(unitID)
	local heading = Spring.GetUnitHeading(unitID)
	if scaffoldunit_2x2[unitDefID] then
		MakeFeature('scaffold_2x2', x, y, z, heading, teamID, unitID)
	end
	if scaffoldunit_4x4[unitDefID] then
		MakeFeature('scaffold_4x4', x, y, z, heading, teamID, unitID)
	end
	if scaffoldunit_6x6[unitDefID] then
		MakeFeature('scaffold_6x6', x, y, z, heading, teamID, unitID)
	end
	if scaffoldunit_6x6_high[unitDefID] then
		MakeFeature('scaffold_6x6_high', x, y, z, heading, teamID, unitID)
	end
	if scaffoldunit_8x8[unitDefID] then
		MakeFeature('scaffold_8x8', x, y, z, heading, teamID, unitID)
	end	
	if scaffoldunit_8x8_high[unitDefID] then
		MakeFeature('scaffold_8x8_high', x, y, z, heading, teamID, unitID)
	end	
	if scaffoldunit_10x10_high[unitDefID] then
		MakeFeature('scaffold_10x10_high', x, y, z, heading, teamID, unitID)
	end	
	if scaffoldunit_11x11[unitDefID] then
		MakeFeature('scaffold_11x11', x, y, z, heading, teamID, unitID)
	end		
	if scaffoldunit_8x12[unitDefID] then
		MakeFeature('scaffold_8x12', x, y, z, heading, teamID, unitID)
	end	
	if scaffoldunit_12x12[unitDefID] then
		MakeFeature('scaffold_12x12', x, y, z, heading, teamID, unitID)
	end
	if scaffoldunit_12x5[unitDefID] then
		MakeFeature('scaffold_12x5', x, y, z, heading, teamID, unitID)
	end		
end

function gadget:UnitFinished(unitID, unitDefID, teamID)
	if scaffoldunit_2x2[unitDefID] or scaffoldunit_4x4[unitDefID] or scaffoldunit_6x6[unitDefID] or scaffoldunit_6x6_high[unitDefID] or scaffoldunit_8x8[unitDefID] or scaffoldunit_8x8_high[unitDefID] or scaffoldunit_10x10_high[unitDefID] or scaffoldunit_11x11[unitDefID] or scaffoldunit_8x12[unitDefID] or scaffoldunit_12x12[unitDefID]  or scaffoldunit_12x5[unitDefID] then
		if ScaffoldList[unitID] ~= nil then
			Spring.DestroyFeature(ScaffoldList[unitID], false, true)
			ScaffoldList[unitID] = nil
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	if scaffoldunit_2x2[unitDefID] or scaffoldunit_4x4[unitDefID] or scaffoldunit_6x6[unitDefID] or scaffoldunit_6x6_high[unitDefID] or scaffoldunit_8x8[unitDefID] or scaffoldunit_8x8_high[unitDefID] or scaffoldunit_10x10_high[unitDefID] or scaffoldunit_11x11[unitDefID] or scaffoldunit_8x12[unitDefID] or scaffoldunit_12x12[unitDefID]  or scaffoldunit_12x5[unitDefID] then
		if ScaffoldList[unitID] ~= nil then
			Spring.DestroyFeature(ScaffoldList[unitID], false, true)
			ScaffoldList[unitID] = nil
		end
	end
end

end
