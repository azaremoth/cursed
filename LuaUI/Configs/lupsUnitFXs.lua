effectUnitDefs = { 
  euf_sarge      = {    {class='GroundFlash', options=HeroAura},    }, 
  euf_sarge_lvl1 = {    {class='GroundFlash', options=HeroAura},    }, 
  euf_sarge_lvl2 = {    {class='GroundFlash', options=HeroAura},    }, 
  euf_sarge_lvl3 = {    {class='GroundFlash', options=HeroAura},    }, 
  euf_sarge_lvl4 = {    {class='GroundFlash', options=HeroAura},    },   
  euf_sarge_lvl5 = {    {class='GroundFlash', options=HeroAura},    },
  
  tc_shade      = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, }, 
  tc_shade_lvl1 = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, }, 
  tc_shade_lvl2 = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, }, 
  tc_shade_lvl3 = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, }, 
  tc_shade_lvl4 = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, },   
  tc_shade_lvl5 = {    {class='GroundFlash', options=HeroAura},      {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_r", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, {class='AirJet', options={color={0.8, 1.0, 0.0}, width=1, length=28, piece="katana_l", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}}, }, 
  
  euf_factory = { 
	{class='ShieldJitter', options={layer=-16, life=math.huge, pos={0,0,0}, size=50, precision=1, strength=0.010, onActive=true, repeatEffect=true, noIconDraw = true}},
   }, 
  euf_airport = { 
	{class='ShieldJitter', options={layer=-16, life=math.huge, pos={-20,40,-20}, size=50, precision=1, strength=0.010, onActive=true, repeatEffect=true, noIconDraw = true}},
   },
  euf_bomber = {
--   {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust1", onActive=true, noIconDraw = true}},
--   {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust2", onActive=true, noIconDraw = true}},
  },
  euf_interceptor = {
 --   {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust1", onActive=true, noIconDraw = true}},
 --   {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust2", onActive=true, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=20, piece="ribbon1", noIconDraw = true}},
    {class='Ribbon', options={width=1, size=20, piece="ribbon2", noIconDraw = true}},	
  },
  euf_priest = {
    {class='GroundFlash', options=FocusAura},  
  },    
  euf_transport = {
--   {class='AirJet', options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust1", onActive=true, noIconDraw = true}},
--   {class='AirJet', options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust2", onActive=true, noIconDraw = true}},
--   {class='AirJet' options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust3", onActive=true, noIconDraw = true}},
--   {class='AirJet' options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust1", emitVector = {0, 1, 0}, onActive=true, noIconDraw = true}},
--   {class='AirJet' options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust2", emitVector = {0, 1, 0}, onActive=true, noIconDraw = true}},	
--   {class='AirJet' options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust3", emitVector = {0, 1, 0}, onActive=true, noIconDraw = true}},	
--   {class='AirJet' options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust4", emitVector = {0, 1, 0}, onActive=true, noIconDraw = true}},	
  },
   tc_heart_ai = {
	{class='ShieldJitter', options={delay=0, life=math.huge, pos={0,15,0}, size=710, strength = .001, precision=50, repeatEffect=true}},
    {class='AirJet', options={color={0.6,1.0,0.15}, width=15, length=300, piece="base", emitVector = {0, -1, 0}, onActive=false}},
    {class='StaticParticles', options=MergeTable(Greenglow_big,{piece="base"})},			
  }, 
   euf_techcenter_shield = {
	{class='ShieldJitter', options={delay=0, life=math.huge, pos={0,15,0}, size=710, strength = .001, precision=50, repeatEffect=true, onActive=true}},
    {class='AirJet', options={color={0.15, 0.8, 0.8}, width=12, length=300, piece="emit_beam", emitVector = {0, 0, 1}, onActive=false}},
    {class='StaticParticles', options=MergeTable(Blueglow_big,{piece="emit_beam"})},		
  }, 
   euf_techcenter_shield_ai = {
	{class='ShieldJitter', options={delay=0, life=math.huge, pos={0,15,0}, size=710, strength = .001, precision=50, repeatEffect=true, onActive=true}},
    {class='AirJet', options={color={0.15, 0.8, 0.8}, width=12, length=300, piece="emit_beam", emitVector = {0, 0, 1}, onActive=false}},
    {class='StaticParticles', options=MergeTable(Blueglow_big,{piece="emit_beam"})},	
  },   
  tc_acranius = {
 --   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=35, piece="emit_thrust1", onActive=true, noIconDraw = true}},
 --   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=35, piece="emit_thrust2", onActive=true, noIconDraw = true}},
  },
  tc_blade = {
 --   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=25, piece="trail1", onActive=true, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=20, piece="ribbon1", noIconDraw = true}},
    {class='Ribbon', options={width=1, size=20, piece="ribbon2", noIconDraw = true}},	
  },
  tc_seeker = {
 --   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=25, piece="trail1", onActive=true, noIconDraw = true}},
  }, 
  tc_witch = {
    {class='GroundFlash', options=HealAura},  
  },   
  tc_witch_shield = {
    {class='GroundFlash', options=HealAura},  
	{class='ShieldJitter', options={delay=0, life=math.huge, pos={0,15,0}, size=385, strength = .001, precision=50, repeatEffect=true}},
  }, 
  euf_paladin = {
    {class='AirJet', options={color={0.15, 0.8, 0.8}, width=2, length=30, piece="bladeemit1", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}},
    {class='StaticParticles', options=MergeTable(PalaCorona,{piece="bladeemit1"})},
  },
  euf_paladin_ai = {
    {class='AirJet', options={color={0.15, 0.8, 0.8}, width=2, length=30, piece="bladeemit1", emitVector = {0, 0, 1}, onActive=false, noIconDraw = true}},
    {class='StaticParticles', options=MergeTable(PalaCorona,{piece="bladeemit1"})},
  },  
  euf_barracks = {
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light1"})},
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light2"})},
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light3"})},	
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light4"})},	
	{class='StaticParticles', options=MergeTable(Redglow_small,{piece="light5"})},	
  },
  euf_barracks_ai = {
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light1"})},
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light2"})},
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light3"})},	
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="light4"})},	
	{class='StaticParticles', options=MergeTable(Redglow_small,{piece="light5"})},	
  },  
  euf_airport = {
    {class='StaticParticles', options=MergeTable(Blueglow_small,{piece="emit_blight1"})},
    {class='StaticParticles', options=MergeTable(Blueglow_small,{piece="emit_blight2"})},
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="emit_rlight1"})},	
    {class='StaticParticles', options=MergeTable(Redglow_small,{piece="emit_rlight2"})},
  },   
  euf_powerplant = {
    {class='GroundFlash', options=groundFlashBluePowerplant},
  },
  tc_altar_hellstorm = {
    {class='AirJet', options={color={0.6,1.0,0.15}, width=20, length=2000, piece="rotator", emitVector = {0, -1, 0}, onActive=false}},
    {class='StaticParticles', options=MergeTable(Greenglow_big,{piece="rotator"})},	
  },  
  tc_necromancer = {{class='StaticParticles', options=MergeTable(Greenglow_small,{piece="emit"})},},  
  tc_necromancer_sum = {{class='StaticParticles', options=MergeTable(Greenglow_small,{piece="emit"})},},
  tc_lich = {
  {class='GroundFlash', options=FrenzyAura},  
  {class='StaticParticles', options=MergeTable(Greenglow_small,{piece="emit_gun"})},	
  },  
  tc_lich_sum = {
  {class='GroundFlash', options=FrenzyAura},
  {class='StaticParticles', options=MergeTable(Greenglow_small,{piece="emit_gun"})},
  },
  tc_gunner = {{class='StaticParticles', options=MergeTable(Greenglow_small,{piece="glow"})},},    
  tc_totem_red = {{class='StaticParticles', options=MergeTable(Redglow_medium,{piece="gem"})},},
  tc_totem_purple = {{class='StaticParticles', options=MergeTable(Purpleglow_medium,{piece="gem"})},},  
  tc_totem_black = {{class='StaticParticles', options=MergeTable(Blackglow_medium,{piece="gem"})},},  
  tc_soulstone = {{class='StaticParticles', options=MergeTable(Greenglow_medium,{piece="emit"})},},    
  tc_soulcage = {
	{class='StaticParticles', options=MergeTable(Greenglow_big,{piece="emit"})},
    {class='GroundFlash', options=groundFlashGreen},	
	},      
  tc_pyramid = {	{class='StaticParticles', options=MergeTable(Smoke, {piece="emit2"})},  },
  tc_tower= {	
  {class='StaticParticles', options=MergeTable(Greenglow_small, {piece="emit"})},  
  {class='StaticParticles', options=MergeTable(ThickSmoke, {piece="wirbel02"})},
  },
  tc_storage = {
   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=70, piece="emit1", onActive=false, noIconDraw = true}},
   {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=70, piece="emit2", onActive=false, noIconDraw = true}},
  },
  tc_metalextractor_lvl2 = {
   {class='AirJet', options={color={0.6,1.0,0.15}, emitVector = {0, 1, 0}, width=3, length=50, piece="tamper", onActive=false, noIconDraw = true}},
  },  
  crystals = {
    {class='GroundFlash', options=groundFlashBigViolett},   
	{class='StaticParticles', options=MergeTable(Purpleglow_bigger,{piece="biggem"})},  
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_01"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_02"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_03"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_04"})},	
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_05"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_06"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_07"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_08"})},
	{class='StaticParticles', options=MergeTable(Purpleglow_big,{piece="gem_09"})},		
  }  
-----------
}

effectUnitDefsXmas = {}


local levelScale = {
    1,
    1.1,
    1.2,
    1.25,
    1.3,
}

-- load presets from unitdefs
for i=1,#UnitDefs do
	local unitDef = UnitDefs[i]
	if unitDef.customParams then
		local fxTableStr = unitDef.customParams.lups_unit_fxs
		if fxTableStr then
			local fxTableFunc = loadstring("return "..fxTableStr)
			local fxTable = fxTableFunc()
			effectUnitDefs[unitDef.name] = effectUnitDefs[unitDef.name] or {}
			for i=1,#fxTable do	-- for each item in preset table
				local toAdd = presets[fxTable[i]]
				for i=1,#toAdd do
					table.insert(effectUnitDefs[unitDef.name],toAdd[i])	-- append to unit's lupsFX table
				end
			end
		end
	end
end
