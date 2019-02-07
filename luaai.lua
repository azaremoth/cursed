--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  LuaAI.lua
--
--    List of LuaAIs supported by the mod.
--
--

return {
  {
    name = 'Zombie Survival: Very Easy',
    desc = 'For PvE in PvP games'
  },
  {
    name = 'Zombie Survival: Easy',
    desc = 'Ice cold'
  },
  {
    name = 'Zombie Survival: Normal',
    desc = 'Lukewarm'
  },
  {
    name = 'Zombie Survival: Hard',
    desc = 'Will burn your ass'
  },
  {
    name = 'Zombie Survival: Suicidal',
    desc = 'Flaming hell!'
  },
--  {
--    name = 'Zombie Survival: Custom',
--    desc = 'A survival experience customizable using modoptions'
--  },
  {
	-- to be recognised as a CAI there must be an entry with this name in
	-- LuaRules\Configs\cai\configCoordinator.lua
    name = 'Skirmish AI',
    desc = 'AI that plays regular skirmish games'
  },
  {
	-- to be recognised as a CAI there must be an entry with this name in
	-- LuaRules\Configs\cai\configCoordinator.lua
    name = 'NO AI',
    desc = 'This AI does absolutely nothing. For testing purposes only.'
  },   
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
