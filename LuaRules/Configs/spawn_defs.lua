--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local modoptions = Spring.GetModOptions() or {}

local eggsModifier = 0.8	--unused
alwaysEggs = false			--spawn limited-lifespan eggs when not in Eggs mode?
eggDecayTime = 180

spawnSquare          = 150       -- size of the chicken spawn square centered on the burrow
spawnSquareIncrement = 1         -- square size increase for each unit spawned
burrowName           = "tc_pitt"   -- burrow unit name
playerMalus          = 1         -- how much harder it becomes for each additional player, exponential (playercount^playerMalus = malus)	-- used only for burrow spawn rate and queen XP
lagTrigger           = 0.7       -- average cpu usage after which lag prevention mode triggers
triggerTolerance     = 0.01      -- increase if lag prevention mode switches on and off too fast
maxAge               = 5*60      -- chicken die at this age, seconds
queenName            = "tc_dragonqueen"
queenMorphName		 = ""
miniQueenName		 = "tc_shade_lvl5"
waveRatio            = 0.6       -- waves are composed by two types of chicken, waveRatio% of one and (1-waveRatio)% of the other
baseWaveSize		 = 2.00		 -- multiplied by malus, 1 = 1 squadSize of chickens
waveSizeMult		 = 1
defenderChance       = 0.03		-- amount of turrets spawned per wave, <1 is the probability of spawning a single turret
quasiAttackerChance  = 0.65		-- subtract defenderChance from this to get spawn chance if "defender" is tagged as a quasi-attacker
maxBurrows           = 50
burrowEggs           = 0       -- number of eggs each burrow spawns
--forceBurrowRespawn	 = false	-- burrows always respawn even if the modoption is set otherwise        
queenSpawnMult       = 4         -- how many times bigger is a queen hatch than a normal burrow hatch
alwaysVisible        = false     -- chicken are always visible
burrowSpawnRate      = 50        -- higher in games with many players, seconds
chickenSpawnRate     = 49
minBaseDistance      = 700      
maxBaseDistance      = 3500

gracePeriod          = 180       -- no chicken spawn in this period, seconds
gracePenalty		 = 15		-- reduced grace per player over one, seconds
gracePeriodMin		 = 90

queenTime            = 60*60    -- time at which the queen appears, seconds
queenMorphTime		 = {60*30, 120*30}	--lower and upper bounds for delay between morphs, gameframes
queenHealthMod		 = 1
miniQueenTime		= {}		-- times at which miniqueens are spawned (multiplier of queentime)
endMiniQueenWaves	= 7		-- waves per miniqueen in PvP endgame

burrowQueenTime		= 15		-- how much killing a burrow shaves off the queen timer, seconds
burrowWaveSize		= 1.2		-- size of contribution each burrow makes to wave size (1 = 1 squadSize of chickens)
burrowRespawnChance = 0.15
burrowRegressTime	= 60		-- direct tech time regress from killing a burrow, divided by playercount

humanAggroPerBurrow	= 1			-- divided by playercount
humanAggroDecay		= 0.25		-- linear rate at which aggro decreases
humanAggroWaveFactor = 1
humanAggroWaveMax	= 5
humanAggroDefenseFactor = 1		-- multiplies aggro for defender spawn chance	-- this one uses per-wave delta rather than listed value
humanAggroSupportFactor	= 0.1	-- multiplies aggro for supporter spawn chance
humanAggroTechTimeProgress = 20	-- how much to increase chicken tech progress (* aggro), seconds
humanAggroTechTimeRegress = 0	-- how much to reduce chicken tech progress (* aggro), seconds
humanAggroQueenTimeFactor = 1	-- burrow queen time is multiplied by this and aggro (after clamping)
humanAggroQueenTimeMin = 0	-- min value of aggro for queen time calc
humanAggroQueenTimeMax = 8

techAccelPerPlayer	= 5		-- how much tech accel increases per player over one per wave, seconds
techTimeFloorFactor	= 0.5	-- tech timer can never be less than this * real time

scoreMult			= 1

gameMode		= true	--Spring.GetModOption("zkmode")
tooltipMessage	= "Try to survive!"
mexes = {
  "tc_metalextractor_lvl1",
  "tc_metalextractor_lvl2",  
  "euf_metalextractor_lvl1",
  "euf_metalextractor_lvl2", 
  --"armestor"	--pylon; needed for annis etc.
}
noTarget = {
	burrowcrust=true,
	grounddecal=true,
	PIG=true,
}

modes = {
    [0] = 0,
    [1] = 'Zombie Survival: Very Easy',
    [2] = 'Zombie Survival: Easy',
    [3] = 'Zombie Survival: Normal',
    [4] = 'Zombie Survival: Hard',
	[5] = 'Zombie Survival: Suicidal',
	[6] = 'Zombie Survival: Custom',
    [7] = 'Chicken Eggs: Easy',
    [8] = 'Chicken Eggs: Normal',
    [9] = 'Chicken Eggs: Hard',
    [10] = 'Chicken Eggs: Suicidal',
	[11] = 'Chicken Eggs: Custom',
}
defaultDifficulty = modes[2]
testBuilding 	= UnitDefNames["euf_bunker"].id	--testing to place burrow
testBuildingQ 	= UnitDefNames["euf_bunker"].id	--testing to place queen


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function Copy(original)   -- Warning: circular table references lead to
  local copy = {}               -- an infinite loop.
  for k, v in pairs(original) do
    if (type(v) == "table") then
      copy[k] = Copy(v)
    else
      copy[k] = v
    end
  end
  return copy
end


local function TimeModifier(d, mod)
  for chicken, t in pairs(d) do
    t.time = t.time*mod
    if (t.obsolete) then
      t.obsolete = t.obsolete*mod
    end
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- times in minutes
local chickenTypes = {
  tc_ghoul				=  {time =  -60, squadSize = 1.4, obsolete = 30},
  tc_undeadmarine_melee	=  {time =  -60, squadSize = 1.2, obsolete = 30},

  tc_skeleton			=  {time =  5, squadSize = 0.2, obsolete = 30},
  tc_gunner       		=  {time = 5, squadSize = 0.8, obsolete = 30},
  
  tc_mage				=  {time = 7, squadSize = 0.5},
  tc_bonebeast			=  {time = 7, squadSize = 0.5, obsolete = 40},
  
  tc_enforcer			=  {time = 9, squadSize = 1.0, obsolete = 30},
  
  tc_undeadmarine_gun	=  {time = 10, squadSize = 0.4, obsolete = 30},
  tc_redeemer			=  {time = 10, squadSize = 0.3},
  tc_blade				=  {time = 10, squadSize = 0.3},
  
  tc_spiderdemon		=  {time = 15, squadSize = 0.3},
  tc_rictus 			=  {time = 15, squadSize = 0.3},
  tc_mancubus			=  {time = 15, squadSize = 0.4},
  
  tc_purgatory_ai		=  {time = 30, squadSize = 0.2},
  
  tc_belial				=  {time = 36, squadSize = 0.3},

  tc_dragon				=  {time = 40, squadSize = 0.15},
  
  tc_shade_lvl1			=  {time = 5, squadSize = 0.01},
  tc_shade_lvl2			=  {time = 7, squadSize = 0.01},
  tc_shade_lvl3			=  {time = 9, squadSize = 0.01},
  tc_shade_lvl4			=  {time = 10, squadSize = 0.01},
  tc_shade_lvl5			=  {time = 15, squadSize = 0.01},
  tc_shade_lvl6			=  {time = 20, squadSize = 0.01},
  tc_shade_lvl7			=  {time = 25, squadSize = 0.01},
  tc_shade_lvl8			=  {time = 30, squadSize = 0.01},
  tc_shade_lvl9			=  {time = 36, squadSize = 0.01},
  
}

local defenders = {
  tc_defender_survival 	= {time = 5, squadSize = 0.5 },
  tc_tower_survival 	= {time = 20,  squadSize = 0.4}, 
  tc_witch_shield 		= {time = 30,  squadSize = 0.2},
}

local supporters = {
  tc_witch 				=  {time = 15, squadSize = 0.2},
  tc_lich 				=  {time = 30, squadSize = 0.2},
}

-- TODO
-- cooldown is in waves
local specialPowers = {
	--{name = "Digger Ambush", maxAggro = -2, time = 15, obsolete = 40, unit = "chicken_digger", burrowRatio = 1.25, minDist = 100, maxDist = 450, cooldown = 3, targetHuman = true},
	--{name = "Wurmsign", maxAggro = -3, time = 40, unit = "chickenwurm", burrowRatio = 0.2, cooldown = 4},
	--{name = "Spire Sprout", maxAggro = -4.5, time = 20, unit = "chickenspire", burrowRatio = 0.15, tieToBurrow = true, cooldown = 3},
	--{name = "Rising Dragon", maxAggro = -8, time = 30, unit = "chicken_dragon", burrowRatio = 1/12, minDist = 250, maxDist = 1200, cooldown = 5, targetHuman = true},
	--{name = "Dino Killer", maxAggro = -12, time = 40, unit = "chicken_silo", minDist = 1500},
}

local function SetCustomMiniQueenTime()
	if modoptions.miniqueentime then
		if modoptions.miniqueentime == 0 then return nil
		else return modoptions.miniqueentime end
	else return 0.6 end
end    
    
difficulties = {
  ['Zombie Survival: Very Easy'] = {
    chickenSpawnRate = 120, 
    burrowSpawnRate  = 100,
    gracePeriod      = 300,
	waveSizeMult	 = 0.6,
    timeSpawnBonus   = .02,     -- how much each time level increases spawn size
	queenTime		 = 30*60,
	queenName        = "tc_dragon",
	queenMorphName	 = '',
	maxBurrows       = 10,
	specialPowers	 = {},
	scoreMult		 = 0.25,
  },
  
  ['Zombie Survival: Easy'] = {
    chickenSpawnRate = 120, 
    burrowSpawnRate  = 90,
    gracePeriod      = 240,
	waveSizeMult	 = 0.8,
    timeSpawnBonus   = .02,     -- how much each time level increases spawn size
	queenTime		 = 35*60,
	queenName        = "tc_shade_lvl10",
	queenMorphName	 = '',
	maxBurrows       = 15,
	specialPowers	 = {},
	scoreMult		 = 0.25,
  },

  ['Zombie Survival: Normal'] = {
    gracePeriod      = 120,  
    chickenSpawnRate = 120, 
    burrowSpawnRate  = 90,
	queenTime		 = 45*60,	
    timeSpawnBonus   = .04,
	miniQueenTime		= {0.6},	
  },

  ['Zombie Survival: Hard'] = {
    chickenSpawnRate = 90, 
    burrowSpawnRate  = 90,
	waveSizeMult	 = 1.2,
    timeSpawnBonus   = .05,
	burrowWaveSize	 = 1.4,
	queenHealthMod	 = 1.5,
	queenSpawnMult   = 5,
	miniQueenTime	 = {0.5},
	techAccelPerPlayer	= 7.5,
	scoreMult		 = 1.25,
	timeModifier	 = 0.8,
  },
  
  ['Zombie Survival: Suicidal'] = {
    chickenSpawnRate = 60, 
    burrowSpawnRate  = 40,
	waveSizeMult	 = 1.5,	
    timeSpawnBonus   = .06,
	burrowWaveSize	 = 1.6,	
	gracePeriod		 = 150,
	gracePeriodMin	 = 30,
	burrowRespawnChance = 0.25,
	burrowRegressTime	= 50,
	queenSpawnMult   = 5,
	queenTime		 = 50*60,
	queenHealthMod	 = 2,
	miniQueenTime	 = {0.45}, --{0.37, 0.75},
	endMiniQueenWaves	= 6,
	techAccelPerPlayer	= 10,
	timeModifier	 = 0.66,
	scoreMult		 = 2,
  },

  ['Zombie Survival: Custom'] = {
    chickenSpawnRate = modoptions.chickenspawnrate or 50, 
    burrowSpawnRate  = modoptions.burrowspawnrate or 45,
    timeSpawnBonus   = .04,
--    chickenTypes     = Copy(chickenTypes),
--    defenders        = Copy(defenders),
	queenTime		 = (modoptions.queentime or 60)*60,
	miniQueenTime	= {	SetCustomMiniQueenTime() },
	gracePeriod		= (modoptions.graceperiod and modoptions.graceperiod * 60) or 180,
	gracePenalty	= 0,
	gracePeriodMin	= 30,
	burrowQueenTime	= (modoptions.burrowqueentime and modoptions.burrowqueentime) or 30,
	timeModifier	= modoptions.techtimemult or 1,
	scoreMult		= 0,
  },
}

-- minutes to seconds
TimeModifier(chickenTypes, 60)
TimeModifier(defenders, 60)
TimeModifier(supporters, 60)
TimeModifier(specialPowers, 60)

--[[
for chicken, t in pairs(chickenTypes) do
    t.timeBase = t.time
end
for chicken, t in pairs(supporters) do
    t.timeBase = t.time
end
for chicken, t in pairs(defenders) do
    t.timeBase = t.time
end
]]--

for _, d in pairs(difficulties) do
  d.timeSpawnBonus = (d.timeSpawnBonus or 0)/60
  d.chickenTypes = Copy(chickenTypes)
  d.defenders = Copy(defenders)
  d.supporters = Copy(supporters)
  d.specialPowers = d.specialPowers or Copy(specialPowers)
  
  TimeModifier(d.chickenTypes, d.timeModifier or 1)
  TimeModifier(d.defenders, d.timeModifier or 1)
  TimeModifier(d.supporters, d.timeModifier or 1)
end

difficulties['Chicken Eggs: Very Easy']   = Copy(difficulties['Zombie Survival: Very Easy'])
difficulties['Chicken Eggs: Easy']   = Copy(difficulties['Zombie Survival: Easy'])
difficulties['Chicken Eggs: Normal'] = Copy(difficulties['Zombie Survival: Normal'])
difficulties['Chicken Eggs: Hard']   = Copy(difficulties['Zombie Survival: Hard'])
difficulties['Chicken Eggs: Suicidal']   = Copy(difficulties['Zombie Survival: Suicidal'])
difficulties['Chicken Eggs: Custom']   = Copy(difficulties['Zombie Survival: Custom'])

--for i,v in pairs(difficulties) do v.eggs = true end

difficulties['Chicken Eggs: Very Easy'].eggs   	= true
difficulties['Chicken Eggs: Easy'].eggs 	= true
difficulties['Chicken Eggs: Hard'].eggs   	= true
difficulties['Chicken Eggs: Suicidal'].eggs	= true
difficulties['Chicken Eggs: Custom'].eggs	= true

defaultDifficulty = 'Zombie Survival: Normal'

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
