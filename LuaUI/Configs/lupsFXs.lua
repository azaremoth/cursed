VFS.Include("LuaRules/Utilities/tablefunctions.lua")

----------------------------------------------------------------------------
-- GROUNDFLASHES -----------------------------------------------------------
----------------------------------------------------------------------------
groundFlash = {
  life       = 40,
  size       = 30,
  sizeGrowth = 7,
  colormap   = { {1, 1, 0.5, 0.3},{1, 1, 0, 0.04},{1, 0.3, 0, 0} }
}

HeroAura = {
  life       = 100,
  size       = 350,
  texture    = "bitmaps/GPL/Lups/groundflash_heroaura.png",
  colormap   = { {0.9, 0.9, 0.0, 0.25}, {0.9, 0.9, 0.0, 0.05}, {0.9, 0.9, 0.0, 0.05}, {0.9, 0.9, 0.0, 0.05}, {0.9, 0.9, 0.0, 0.25},},
  repeatEffect = true,
  mobile = true,
}

FrenzyAura = {
  life       = 100,
  size       = 250,
  texture    = "bitmaps/GPL/Lups/groundflash_aura.png",
  colormap   = { {0.6, 1.0, 0.15, 0.25}, {0.6, 1.0, 0.15, 0.1}, {0.6, 1.0, 0.15, 0.05}, {0.6, 1.0, 0.15, 0.1}, {0.6, 1.0, 0.15, 0.25},},
  repeatEffect = true,
  mobile = true,
}

FearAura = {
  life       = 25,
  size       = 150,
  texture    = "bitmaps/GPL/Lups/groundflash_fearaura.png",
  colormap   = { {0.9, 0.0, 0.05, 0.25}, {0.9, 0.0, 0.05, 0.1}, {0.9, 0.0, 0.05, 0.1}, {0.9, 0.0, 0.05, 0.1}, {0.9, 0.0, 0.05, 0.25},},
  repeatEffect = true,
  mobile = true,
}

HealAura = {
  life       = 100,
  size       = 250,
  texture    = "bitmaps/GPL/Lups/groundflash_runesaura.png",
  colormap   = { {1.0, 0.0, 0.95, 0.35}, {1.0, 0.0, 0.95, 0.2}, {1.0, 0.0, 0.95, 0.05}, {1.0, 0.0, 0.95, 0.2}, {1.0, 0.0, 0.95, 0.35},},
  repeatEffect = true,
  mobile = true,
}

FocusAura = {
  life       = 100,
  size       = 250,
  texture    = "bitmaps/GPL/Lups/groundflash_aura.png",
  colormap   = { {1.0, 1.0, 1.0, 0.25}, {1.0, 1.0, 1.0, 0.1}, {1.0, 1.0, 1.0, 0.05}, {1.0, 1.0, 1.0, 0.1}, {1.0, 1.0, 1.0, 0.25},},
  repeatEffect = true,
  mobile = true,
}

groundFlashOrange = {
  life       = 20,
  size       = 100,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.7, 0.5, 0.2, 0.3},{0.7, 0.5, 0.2, 0.4},{0.7, 0.5, 0.2, 0.4},{0.7, 0.5, 0.2, 0.3}, },
  repeatEffect = true,
}

groundFlashBlue = {
  life       = 40,
  size       = 100,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.15, 0.8, 0.8, 0.3},{0.1, 1.0, 1.0, 0.4},{0.15, 0.8, 0.8, 0.4}, },
  repeatEffect = true,
}

groundFlashGreen = {
  life        = math.huge,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.7, 1.0, 0.25, 0.15} },
  repeatEffect = true,
}

groundFlashBluePowerplant = {
  life       = 40,
  size       = 100,
  texture    = "bitmaps/Lups/gf_eufpplant.png",
  colormap   = { {0.15, 0.8, 0.8, 0.15},{0.1, 1.0, 1.0, 0.2},{0.15, 0.8, 0.8, 0.15}, },
  repeatEffect = true,
}

groundFlashViolett = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.9, 0.1, 0.9, 0.1},{0.9, 0.1, 0.9, 0.2},{0.9, 0.1, 0.9, 0.2},{0.9, 0.1, 0.9, 0.1}, },
  repeatEffect = true,
}

groundFlashBigViolett = {
  life       = 50,
  size       = 400,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.9, 0.1, 0.9, 0.05},{0.9, 0.1, 0.9, 0.2},{0.9, 0.1, 0.9, 0.2},{0.9, 0.1, 0.9, 0.05}, },
  repeatEffect = true,
}

groundFlashCorestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_corestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.15},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.15}, },
  repeatEffect = true,
}
groundFlashArmestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_armestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.2},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.2}, },
  repeatEffect = true,
}
PalaCorona = {
  life        = 40,
  lifeSpread  = 0,
  size        = 30,
  sizeSpread  = 10,
  colormap    = { {0.15, 0.8, 0.8, 0.010}, {0.15, 0.8, 0.8, 0.005}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Redglow_small = {
  life        = 60,
  lifeSpread  = 0,
  size        = 30,
  sizeSpread  = 8,
  colormap    = { {0.8, 0.1, 0.1, 0.015}, {0.4, 0.05, 0.05, 0.012}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Redglow_medium = {
  life        = 60,
  lifeSpread  = 0,
  size        = 50,
  sizeSpread  = 2,
  colormap    = { {0.8, 0.1, 0.1, 0.015}, {0.4, 0.05, 0.05, 0.012}, {0.8, 0.1, 0.1, 0.015},},
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Purpleglow_medium = {
  life        = 60,
  lifeSpread  = 0,
  size        = 50,
  sizeSpread  = 2,
  colormap    = { {0.8, 0.1, 0.8, 0.015}, {0.4, 0.05, 0.4, 0.012}, {0.8, 0.1, 0.8, 0.015},},
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Purpleglow_big = {
  life        = 60,
  lifeSpread  = 0,
  size        = 100,
  sizeSpread  = 2,
  colormap    = { {0.8, 0.1, 0.8, 0.0015}, {0.4, 0.05, 0.4, 0.0012}, {0.8, 0.1, 0.8, 0.0015},},
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Purpleglow_bigger = {
  life        = 60,
  lifeSpread  = 0,
  size        = 250,
  sizeSpread  = 3,
  colormap    = { {0.8, 0.1, 0.8, 0.0015}, {0.4, 0.05, 0.4, 0.0012}, {0.8, 0.1, 0.8, 0.0015},},
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Blackglow_medium = {
  life        = 60,
  lifeSpread  = 0,
  size        = 50,
  sizeSpread  = 2,
  colormap    = { {0.35, 0.0, 0.64, 0.015}, {0.15, 0.0, 0.3, 0.012}, {0.35, 0.0, 0.64, 0.015},},
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Blueglow_small = {
  life        = 60,
  lifeSpread  = 0,
  size        = 30,
  sizeSpread  = 8,
  colormap    = { {0.15, 0.8, 0.8, 0.015}, {0.07, 0.4, 0.4, 0.012}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Greenglow_small = {
  life        = 50,
  lifeSpread  = 0,
  size        = 40,
  sizeSpread  = 8,
  colormap    = { {0.7, 1.0, 0.25, 0.03}, {0.35, 0.5, 0.12, 0.01}, {0.7, 1.0, 0.25, 0.03}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Greenglow_small_stable = {
  life        = 50,
  lifeSpread  = 0,
  size        = 40,
  sizeSpread  = 8,
  colormap    = { {0.5, 1.0, 0.16, 0.03}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Greenglow_medium = {
  life        = 50,
  lifeSpread  = 0,
  size        = 100,
  sizeSpread  = 8,
  colormap    = { {0.7, 1.0, 0.25, 0.03}, {0.6, 0.8, 0.15, 0.01}, {0.7, 1.0, 0.25, 0.03}, },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Greenglow_big = {
  life        = 50,
  lifeSpread  = 0,
  size        = 150,
  sizeSpread  = 33,
  colormap    = { {0.7, 1.0, 0.25, 0.03}, {0.6, 0.8, 0.15, 0.01}, {0.7, 1.0, 0.25, 0.03},  },
  texture     = 'bitmaps/GPL/smallflare.tga',
  count       = 1,
  repeatEffect = true,
}
Smoke = {
  pos	      = {0,0,0},
  life        = 100,
  lifeSpread  = 0,
  size        = 30,
  sizeGrowth  = 0,
  colormap    = { {0.5, 0.5, 0.5, 0.03}, {0.2, 0.2, 0.2, 0.01}, {0.5, 0.5, 0.5, 0.03}, },
  texture     = 'bitmaps/cursed/Blacksmoke.tga',
  count       = 1,
  repeatEffect = true,
}
ThickSmoke = {
  pos	      = {0,0,0},
  life        = 150,
  lifeSpread  = 0,
  size        = 50,
  sizeGrowth  = 0,
  colormap    = { {0.2, 0.2, 0.2, 0.5}, {0.2, 0.2, 0.2, 0.3}, {0.2, 0.2, 0.2, 0.5},},
  texture     = 'bitmaps/cursed/Blacksmoke.tga',
  count       = 1,
  repeatEffect = true,
}