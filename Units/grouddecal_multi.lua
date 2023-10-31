local DECAL0 = {
  unitname           = "grounddecal",
  name               = "Grounddecal",  
  description = "Grounddecal",
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 25,
  buildingGroundDecalSizeY = 25,
  buildingGroundDecalType = "tc_groundplate1.png",
}
local DECAL1 = {
  unitname           = "trails1",
  name        = "Trails1",
  description = "Trails1",
  buildingGroundDecalDecaySpeed = 0.0000000001,
  buildingGroundDecalSizeX = 40,
  buildingGroundDecalSizeY = 40,
  buildingGroundDecalType = "trails1.png",
}
local DECAL2 = {
  unitname           = "trails2",
  name        = "Trails2",
  description = "Trails2",
  buildingGroundDecalDecaySpeed = 0.0000000001,
  buildingGroundDecalSizeX = 40,
  buildingGroundDecalSizeY = 40,
  buildingGroundDecalType = "trails2.png",
}
local DECAL3 = {
  unitname           = "trails3",
  name        = "Trails3",
  description = "Trails3",
  buildingGroundDecalDecaySpeed = 0.0000000001,
  buildingGroundDecalSizeX = 40,
  buildingGroundDecalSizeY = 40,
  buildingGroundDecalType = "trails3.png",
}
local DECAL4 = {
  unitname           = "trails4",
  name        = "Trails4",
  description = "Trails4",
  buildingGroundDecalDecaySpeed = 0.0000000001,
  buildingGroundDecalSizeX = 40,
  buildingGroundDecalSizeY = 40,
  buildingGroundDecalType = "trails4.png",
}
------------------------------------------------------ BASE CLASS
local BASE = {
  armortype          = "HEAVY",
  buildCostEnergy    = 1,
  buildCostMetal     = 1,
  useBuildingGroundDecal = true,  
  buildPic           = "NULL.png",
  buildTime          = 1,
  canAssist          = false,
  canBeAssisted      = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = false,
  cantBeTransported  = true, 
  capturable         = false,   
  category           = "CANTATTACK",
  corpse             = "",
    customParams          = {	
				factionname		   = "neutral",
	},
  damageModifier     = 0.001,
  description        = "Hidden Grounddecal",
  energyMake         = 0,
  explodeAs          = "SMOKE_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 1,
  footprintZ         = 1,
  hideDamage         = true,
  iconType           = "neverseeme",
  idleAutoHeal       = 50,
  idleTime           = 200,
  levelGround        = true,
  maxDamage          = 99999999,
  maxSlope           = 45,
  maxWaterDepth      = 0,
  metalMake          = 0,
  mobilestandorders  = "1",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  objectName         = "empty.s3o",
  radarDistance      = 1,
  reclaimable        = false,
  script = 'empty.lua',
  selfDestructAs     = "SMOKE_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "neutral",
  sightDistance      = 0,
  smoothAnim         = false,
  stealth		   = true,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  yardMap            = "c",
  sfxtypes = {
    explosiongenerators = {
      "custom:Structurebuilding_Big",
    },
  },
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "",
    working            = "",
    arrived = {
      "",
    },
    cant = {
      "",
    },
    count = {
      "",
      "",
      "",
      "",
      "",
      "",
    },
    ok = {
      "",
    },
    select = {
      "",
    },
  },
}

----------------------------------- FINALIZE ---------------------------------------------
function DefCopyTable(tableToCopy, deep)
  local copy = {}
  for key, value in pairs(tableToCopy) do
    if (deep and type(value) == "table") then
      copy[key] = DefCopyTable(value, true)
    else
      copy[key] = value
    end
  end
  return copy
end

function DefMergeTable(primary, secondary, deep)
    local new = DefCopyTable(primary, deep)
    for i, v in pairs(secondary) do
	    -- key not used in primary, assign it the value at same key in secondary
	    if not new[i] then
		    if (deep and type(v) == "table") then
			    new[i] = DefCopyTable(v, true)
		    else
			    new[i] = v
		    end
	    -- values at key in both primary and secondary are tables, merge those
	    elseif type(new[i]) == "table" and type(v) == "table"  then
		    new[i] = DefMergeTable(new[i], v, deep)
	    end
    end
    return new
end

return lowerkeys({
	grounddecal = DefMergeTable(BASE, DECAL0),
	trails1 = DefMergeTable(BASE, DECAL1),
	trails2 = DefMergeTable(BASE, DECAL2),
	trails3 = DefMergeTable(BASE, DECAL3),
	trails4 = DefMergeTable(BASE, DECAL4),		
})
