-- $Id: morph_defs.lua 4643 2009-05-22 05:52:27Z carrepairer $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local devolution = false


local morphDefs = {

  --[[ // sample definition1 with multiple possible morphs... you nest arrays inside the definition
  armcom = {
    {
      into = 'armmoho',
      time = 20,
      metal = 10,
      energy = 10,
      tech = 1,
      xp = 0,
    },
    {
      into = 'corcom',
      time = 20,
      metal = 10,
      energy = 10,
      tech = 1,
      xp = 0,
    },
  },

--]]


  tc_necromancer = {
    {
      into = 'tc_lich',
	metal = 300,
	energy = 300,
	time = 20,
	require = 'tc_heart',
      tech = 0,
      xp = 0,
	texture = 'tc_lich.png',
    },
    {
      into = 'tc_necromancer_sum',
	metal = 0,
	energy = 0,
	time = 0,
      tech = 0,
      xp = 0,
	texture = 'summoning.png',
	text = 'Get into the summoning stance',
    },
  },

  tc_necromancer_sum= {
    {
      into = 'tc_necromancer',
	metal = 0,
	energy = 0,
	time = 0,
      tech = 0,
      xp = 0,
	texture = 'summoning.png',
	text = 'Get out of the summoning stance',
    },
    {
      into = 'tc_lich_sum',
	metal = 300,
	energy = 300,
	time = 20,
	require = 'tc_heart',
      tech = 0,
      xp = 0,
	texture = 'tc_lich.png',
    },
  },
  tc_lich= {
    {
      into = 'tc_lich_sum',
	metal = 0,
	energy = 0,
	time = 0,
      tech = 0,
      xp = 0,
	texture = 'summoning.png',
	text = 'Get into the summoning stance',
    },
  },
  tc_lich_sum= {
    {
      into = 'tc_lich',
	metal = 0,
	energy = 0,
	time = 0,
      tech = 0,
      xp = 0,
	texture = 'summoning.png',
	text = 'Get out of the summoning stance',
    },
  },
  tc_obelisk = {
    {
      into = 'tc_obelisk_lvl2',
	metal = 300,
	energy = 300,
	time = 30,
	require = 'tc_heart',
      tech = 0,
      xp = 0,
	texture = 'tc_obelisk_lvl2.png',
    },
  },
--[[  tc_darkassembler = {
    {
      into = 'tc_darkassembler_lvl2',
	metal = 500,
	energy = 500,
	time = 40,
	require = 'tc_heart',
      tech = 0,
      xp = 0,
	texture = 'tc_darkassembler_lvl2.png',
    },
  },]]--
  tc_witch = {
    {
      into = 'tc_witch_shield',
	metal = 0,
	energy = 0,
	time = 0,
	require = 'tc_altar',
      tech = 0,
      xp = 0,
	texture = 'tc_witch_shield.png',
	text = 'Cast Shield Spell',
    },
  },
  tc_witch_shield = {
    {
      into = 'tc_witch',
	metal = 0,
	energy = 0,
	time = 0,
      tech = 0,
      xp = 0,
	texture = 'tc_witch.png',
	text = 'Uncast Shield Spell',
    },
  },
  euf_priest = {
    {
    into = 'euf_wolf',
	metal = 0,
	energy = 0,
	time = 0,
	require = 'euf_church',	
    tech = 0,
    xp = 0,
	texture = 'wolf.png',
	text = 'Turn into a wolf',
    },
  }, 
    euf_wolf = {
    {
    into = 'euf_priest',
	metal = 0,
	energy = 0,
	time = 0,
    tech = 0,
    xp = 0,
	texture = 'wolf.png',
	text = 'Turn into a priest',
    },
  },
    euf_scorpion = {
    {
    into = 'euf_scorpion_burrowed',
	metal = 0,
	energy = 0,
	time = 0,
    tech = 0,
    xp = 0,
	texture = 'burrow.png',
	text = 'Go subterrain',
    },
  },
    euf_scorpion_burrowed = {
    {
    into = 'euf_scorpion',
	metal = 0,
	energy = 0,
	time = 0,
    tech = 0,
    xp = 0,
	texture = 'unburrow.png',
	text = 'Go subterrain',
    },
  },    
    euf_techcenter = {
    {
    into = 'euf_techcenter_shield',
	metal = 300,
	energy = 300,
	time = 100,
    tech = 0,
    xp = 0,
	texture = 'upgrade_shield.png',
	text = 'Upgrade with shield generator',
    },
  },  
}



--
-- Here's an example of why active configuration
-- scripts are better then static TDF files...
--

--
-- devolution, babe  (useful for testing)
--
if (devolution) then
  local devoDefs = {}
  for src,data in pairs(morphDefs) do
    devoDefs[data.into] = { into = src, time = 10, metal = 1, energy = 1 }
  end
  for src,data in pairs(devoDefs) do
    morphDefs[src] = data
  end
end


return morphDefs

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
