local configs = {}

configs.roostName = 'tc_pitt'

configs.difficulties = {
    [0] = 0,
    [1] = 'Very Easy',
    [2] = 'Easy',
    [3] = 'Normal',
    [4] = 'Hard',
	[5] = 'Suicidal',
	[6] = 'Custom',
    [7] = 'Eggs: Easy',
    [8] = 'Eggs: Normal',
    [9] = 'Eggs: Hard',
    [10] = 'Eggs: Suicidal',
	[11] = 'Eggs: Custom',
}

configs.colorSet = {
  tc_ghoul        = "\255\184\100\255",
  tc_undeadmarine_melee = "\255\184\100\255",
  tc_skeleton = "\255\184\100\255",
  bug_med_undead = "\255\184\100\255",
  bug_big_undead = "\255\50\50\255",   
  tc_gunner       = "\255\255\100\100",
  tc_undeadmarine_gun = "\255\255\50\80",  
  tc_bonebeast       = "\255\100\255\100",
  tc_enforcer       = "\255\255\120\80",
  tc_redeemer       = "\255\255\120\80",
  tc_spiderdemon       = "\255\155\120\80",  
  tc_purgatory_ai = "\255\100\170\170",
  tc_mage   = "\255\150\001\001",
  tc_blade       = "\255\255\255\100",
  tc_rictus       = "\255\100\255\255",
  tc_mancubus = "\255\75\75\25",  
  tc_belial = "\255\25\25\25",
  tc_deathwalker = "\255\0\0\25", 
  tc_dragon = "\255\0\0\25",  
  tc_shade = "\255\0\50\25",   
  tc_shade_lvl10 = "\255\0\50\25", 
}

return configs