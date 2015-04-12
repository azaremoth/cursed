--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    featuredefs_post.lua
--  brief:   featureDef post processing
--  author:  Dave Rodgers
--
--  Copyright (C) 2008.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Per-unitDef featureDefs
--

local function isbool(x)   return (type(x) == 'boolean') end
local function istable(x)  return (type(x) == 'table')   end
local function isnumber(x) return (type(x) == 'number')  end
local function isstring(x) return (type(x) == 'string')  end
local spGetModOptions   = Spring.GetModOptions

--------------------------------------------------------------------------------

local function ProcessUnitDef(udName, ud)

  local fds = ud.featuredefs
  if (not istable(fds)) then
    return
  end

  -- add this unitDef's featureDefs
  for fdName, fd in pairs(fds) do
    if (isstring(fdName) and istable(fd)) then
      local fullName = udName .. '_' .. fdName
      FeatureDefs[fullName] = fd
      fd.filename = ud.filename
    end
  end

  -- FeatureDead name changes
  for fdName, fd in pairs(fds) do
    if (isstring(fdName) and istable(fd)) then
      if (isstring(fd.featuredead)) then
        local fullName = udName .. '_' .. fd.featuredead:lower()
        if (FeatureDefs[fullName]) then
          fd.featuredead = fullName
        end
      end
    end
  end

  -- convert the unit corpse name
  if (isstring(ud.corpse)) then
    local fullName = udName .. '_' .. ud.corpse:lower()
    local fd = FeatureDefs[fullName]
    if (fd) then
      ud.corpse = fullName
    end
  end
end


if (spGetModOptions and (spGetModOptions().comm  == "sandbox" or spGetModOptions().comm  == "feature")) then
	local IimperialGuardBuild = DEFS.unitDefs["euf_constructor"].buildoptions
	local CursedBuild = DEFS.unitDefs["tc_necromancer"].buildoptions
	local goldtreeBuild = DEFS.unitDefs["goldtree"].buildoptions

	for name, fd in pairs(FeatureDefs) do
		unit = {}
		DEFS.unitDefs[name .. "_unit"] = unit
		setmetatable(unit, {__index = fd})
		unit.isfeature		= true
		unit.corpse			= name
		unit.objectname		= unit.object
		unit.script			= "default.cob"

		if(spGetModOptions().comm  == "feature")then
			unit.maxslope		= 255
			unit.maxwaterdepth	= 255
		end
		
		unit.footprintX		= footprintX
		unit.footprintZ		= footprintX
		unit.levelGround	= false
		
		unit.collisionvolumetype  		= collisionvolumetype
		unit.collisionvolumescales 		= collisionvolumescales
		unit.collisionvolumeoffsets 	= collisionvolumeoffsets	
		
		goldtreeBuild[#goldtreeBuild + 1] = name .. "_unit"
	end
	
	Spring.Echo("Sandbox mode active!")
		
	for unitdefname, ud in pairs(DEFS.unitDefs) do
		if(spGetModOptions().comm  == "feature")then
			ud.levelGround		= false
			ud.maxslope			= 255
			ud.maxwaterdepth	= 255	
			ud.footprintX		= 1
			ud.footprintZ		= 1	
			DEFS.unitDefs[unitdefname].buildtime		= 0
			DEFS.unitDefs[unitdefname].metalcost		= 0
			DEFS.unitDefs[unitdefname].energycost		= 0
		end
		ud.energycost	= 0
		ud.metalcost	= 0	
		ud.buildtime		= 0.2 -- instant build didn't look cool!

		if ( ud.customparams  and not ud.customparams.featureplacer ) then
			if  ( ud.customparams.factionname == "cursed" ) then
				CursedBuild[#CursedBuild + 1] = ud.unitname
			else
				if  (ud.customparams and ud.customparams.factionname == "neutral" or ud.customparams and ud.customparams.factionname == "randm" ) then
					goldtreeBuild[#goldtreeBuild + 1] = ud.unitname
				else
					IimperialGuardBuild[#IimperialGuardBuild + 1] = ud.unitname
				end
			end	
		end
	end
	
	Spring.Echo(#goldtreeBuild .. " Generic features loaded" )
	Spring.Echo(#IimperialGuardBuild .. "  Imperial Guard entities loaded" )
	Spring.Echo(#CursedBuild .. " Cursed entities loaded " )
end
--------------------------------------------------------------------------------

-- Process the unitDefs

local UnitDefs = DEFS.unitDefs

for udName, ud in pairs(UnitDefs) do
  if (isstring(udName) and istable(ud)) then
    ProcessUnitDef(udName, ud)
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
