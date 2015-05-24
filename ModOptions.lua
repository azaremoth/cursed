local options={
 ---- GAME SETTINGS ----
--[[	{
		key="comm",
		name="Game Mode",
		desc="What Game mode are you in",
		type="list",
		def="std",
		items = {
			{ key = "std", name = "Skirmish", desc = "Versus mode!"  },
--			{ key = "sandbox", name = "Sandbox mode", desc = "For testing stuff!" },
			{ key = "feature", name = "Feature Placer mode", desc = "Not for gameplay, used for map development." },
		},
	},]]--
  {
    key    = 'StartingResources',
    name   = 'Resources',
    desc   = 'Sets storage and amount of resources that players will start with',
    type   = 'section',
  },
  {
   key    = 'StartMetal',
   scope  = 'team',
   name   = 'Team Starting metal',
   desc   = 'Determines amount of metal and metal storage this team will start with',
   type   = 'number',
   section= 'StartingResources',
   def    = 1000,
   min    = 500,
   max    = 10000,
   step   = 1,  -- quantization is aligned to the def value
   -- (step <= 0) means that there is no quantization
  },
  {
    key    = 'StartEnergy',
    name   = 'Starting energy',
    desc   = 'Determines amount of energy and energy storage that each player will start with',
    type   = 'number',
    section= 'StartingResources',
    def    = 2000,
    min    = 500,
    max    = 10000,
    step   = 1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },
  --[[{
    key    = 'metalmult',
    name   = 'Metal Extraction Multiplier',
    desc   = 'Multiplies metal extraction rate. For use in large team games when there are fewer mexes per player.',
    type   = 'number',
    section= 'StartingResources',
    def    = 1,
    min    = 0,
    max    = 100,
    step   = 0.05,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },]]--
  ---- GAME OPTIONS ----
     {
    key    = 'corpsetime',
    name   = 'Corpse stay time',
    desc   = 'A factor that determines how long corpses will stay on the battlefield',
    type   = 'number',
 --   section= "gameoptions",		
    def    = 2,
    min    = 0,
    max    = 20,
    step   = 1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  }, 
      
  {
	key		= "qtpfs",
	name	= "QTPFS Pathfinder",
	desc	= "Enables Quadtree Pathfinding System (experimental)",
	type	= "bool",
	def		= false,
--	section	= "gameoptions",
  },    
  
  ---- AI OPTIONS ----
	{
		key    = 'aioptions',
		name   = 'Additional AI Options',
		desc   = 'Additional AI Options',
		type   = 'section',
	},
	{
		key="cheatingai",
		name="Should the AI cheat?",
		desc="A cheating AI starts with some defense buildings, base shields and an energy and metal producing central building.",
		type = "bool",
		def = false,
		section= "aioptions",	
	},
	{
		key="killstragglers",
		name="Kill AI stragglers?",
		desc="All (non survival mode) AI units will be killed after the AI's base was destroyed.",
		type = "bool",
		def = true,
		section= "aioptions",	
	},	
  {
	key		= "critters",
	name	= "Spawn critters",
	desc	= "This will enable spawning neutral critters on maps",
	type	= "bool",
	def		= true,
	section= "aioptions",	
  },   
	
 ---- CHICKEN/SURVIAL MODE STUFF ----
 {
    key    = 'chicken',
    name   = 'Survival Mode',
    desc   = 'Settings for Survival: Custom',
    type   = 'section',
  },
  {
    key    = 'chickenspawnrate',
    name   = 'Undead Spawn Rate',
    desc   = 'Sets the frequency of undead waves in seconds.',
    type   = 'number',
    section= 'chicken',
    def    = 50,
    min    = 20,
    max    = 200,
    step   = 1,
  },
  {
    key    = 'burrowspawnrate',
    name   = 'Burrow Spawn Rate',
    desc   = 'Sets the frequency of burrow spawns in seconds (modified by playercount and number of existing burrows).',
    type   = 'number',
    section= 'chicken',
    def    = 45,
    min    = 20,
    max    = 200,
    step   = 1,
  },
  {
    key    = 'queentime',
    name   = 'Boss Time',
    desc   = 'How soon the boss appears, minutes.',
    type   = 'number',
    section= 'chicken',
    def    = 60,
    min    = 1,
    max    = 200,
    step   = 1,
  },
  {
    key    = 'graceperiod',
    name   = 'Grace Period',
    desc   = 'Delay before the first wave appears, minutes.',
    type   = 'number',
    section= 'chicken',
    def    = 2.5,
    min    = 0,
    max    = 120,
    step   = 0.5,
  },
  {
    key    = 'miniqueentime',
    name   = 'Dragon Time',
    desc   = 'Time when the Bone Dragons appear, as a proportion of boss time. 0 disables.',
    type   = 'number',
    section= 'chicken',
    def    = 0.6,
    min    = 0,
    max    = 1,
    step   = 0.05,
  },
  {
    key    = 'techtimemult',
    name   = 'Tech Time Mult',
    desc   = 'Multiplier for the appearance times of advanced chickens.',
    type   = 'number',
    section= 'chicken',
    def    = 1,
    min    = 0,
    max    = 5,
    step   = 0.05,
  },
--[[  
  {
	key    = 'burrowtechtime',
	name   = 'Burrow Tech Time',
	desc   = 'How much time each burrow shaves off chicken appearance times per wave (divided by playercount), seconds',
	type   = 'number',
	section= 'chicken',
	def    = 12,
	min    = 0,
	max    = 60,
	step   = 1,  
  },
]]--  
  {
	key    = 'burrowqueentime',
	name   = 'Burrow Boss Time',
	desc   = 'How much time each burrow death subtracts from boss appearance time (divided by playercount), seconds',
	type   = 'number',
	section= 'chicken',
	def    = 100,
	min    = 0,
	max    = 1200,
	step   = 1,  
  },
 ---- KING OF THE HILL OPTIONS ----
   {
    key    = 'koth_section',
    name   = 'King of the Hill Settings',
    desc   = 'Settings for King of the Hill mode.',
    type   = 'section',
    },
	{
		key="koth",
		name="Hold Time",
		desc="The one with a unit closest to center for that many minutes win. A zero disables King of the Hill.",
		type="number",
		section= 'koth_section',		
		min = 0,
		max = 10080,
		step = 1,
		def = 0,
	},
	{
		key="kothr",
		name="Centre Radius",
		desc="This defines the size of the centre area.",
		type="number",
		section= 'koth_section',		
		min = 100,
		max = 1000,
		step = 50,
		def = 300,
	},
	{
		key		= "kothbase",
		name	= "Start with bases",
		desc	= "Players start with a small base.",
		type	= "bool",
		def		= true,
		section	= 'koth_section',	
	}, 	
}

--// add key-name to the description (so you can easier manage modoptions in springie)
for i=1,#options do
  local opt = options[i]
  opt.desc = opt.desc .. '\nkey: ' .. opt.key
end

return options