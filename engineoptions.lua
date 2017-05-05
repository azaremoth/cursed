--  Custom Options Definition Table format

--  NOTES:
--  - using an enumerated table lets you specify the options order

--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  scope:    'all', 'player', 'team', 'allyteam'      <<< not supported yet >>>
--

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Example EngineOptions.lua
--

local options =
{
 --[[ {
    key    = 'GameMode',
    name   = 'Game end condition',
    desc   = 'Determines what condition triggers the defeat of a player',
    type   = 'list',
    def    = '0',
    items  =
    {
      {
        key  = '0',
        name = 'Kill everything',
        desc = 'The player will lose only after all units of the player will be killed',
      },
	  {
        key  = '3',
        name = 'Infinite',
        desc = 'Game will never end',
      },
    },
  }, ]]--

  {
    key    = 'GhostedBuildings',
    name   = 'Ghosted buildings',
    desc   = "Once an enemy building will be spotted\na ghost trail will be placed to memorize location even after the loss of the line of sight",
    type   = 'bool',
    def    = true,
  },
--[[  {
    key    = 'DiminishingMMs',
    name   = 'Diminishing metal makers efficiency',
    desc   = "Everytime a new metal maker will be built, the energy/metal efficiency ratio will decrease",
    type   = 'bool',
    def    = false,
  },

  {
    key    = 'FixedAllies',
    name   = 'Fixed ingame alliances',
    desc   = 'Disables the possibility of players to dynamically change alliances ingame',
    type   = 'bool',
    def    = true,
  },]]--

  {
    key    = 'a_Limits',
    name   = 'Game Restriction',
    desc   = 'Limits maximum and minimum speed that the players will be allowed to change to',
    type   = 'section',
  },
  {
    key    = 'MinSpeed',
    name   = 'Minimum game speed',
    desc   = 'Sets the minimum speed that the players will be allowed to change to',
    type   = 'number',
    section= 'a_Limits',
    def    = 0.3,
    min    = 0.1,
    max    = 100,
    step   = 0.1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },
  {
    key    = 'MaxSpeed',
    name   = 'Maximum game speed',
    desc   = 'Sets the maximum speed that the players will be allowed to change to',
    type   = 'number',
    section= 'a_Limits',
    def    = 3,
    min    = 0.1,
    max    = 100,
    step   = 0.1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },
  
  {
    key    = 'MaxUnits',
    name   = 'Max units',
    desc   = 'Determines the ceiling of how many units and buildings a player is allowed to own at the same time',
    type   = 'number',
    section= 'a_Limits',	
    def    = 1000,
    min    = 50,
    max    = 10000,
    step   = 1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },  
  
  {
    key    = 'DisableMapDamage',
    name   = 'Undeformable map',
    desc   = 'Prevents the map shape from being changed by weapons',
    type   = 'bool',
 --   section= 'a_Limits',	
    def    = false,
  },
}
return options
