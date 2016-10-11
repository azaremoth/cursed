return {
 
  ["napalm_green"] = {
    usedefaultexplosions = false,
    splash = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      water              = true,
	  underwater		 = true,
      properties = {
        colormap           = [[0.8745 1 0.1568 0.05 	0.8745 1 0.1568 0.05 	0.6 0.8 0.10 0.01 	0 0 0 0.01]],
        dir                = [[0, 1, 0]],
        frontoffset        = 0,
        fronttexture       = [[BUILDING_BASE_FRONT]],
        length             = [[100]],
        sidetexture        = [[BUILDING_BASE_SIDE]],
        size               = [[20]],
        sizegrowth         = 5,
        ttl                = 15,
      },
    },  
    groundflash = {
      flashalpha         = 0.66,
      flashsize          = 300,
      ttl                = 280,
      color = {
        [1]  = 0.87,
        [2]  = 1.00,
        [3]  = 0.16,
      },
    },
    ploom = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 6,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i40]],
        explosiongenerator = [[custom:NAPALMFIREBALL_GREEN_200]],
        pos                = [[-20 r40, 30, -20 r40]],
      },
    }, 
  },
-- Fireball particles of various lifetimes
  ["NAPALMFIREBALL_GREEN_200"] = {
    rocks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.97,
        colormap           = [[0.8745 1 0.1568 0.01 	0.8745 1 0.1568 0.01 	0.2 1 0 0.01 	0 0 0 0.01]],
        directional        = false,
        emitrot            = 60,
        emitrotspread      = 30,
        emitvector         = [[r6.2831 y11 -3.1415 a11 y11    r1 y12    -1 x12 y0 1 a0 p0.5 y0 0 a12 p0.5 y1 2 x0 x1 y13       -0.5x11x11 y0 0.0417x11x11x11x11 y1 -0.00139x11x11x11x11x11x11 y2 0.0000248015x11x11x11x11x11x11x11x11 y3 -0.000000275573x11x11x11x11x11x11x11x11x11x11 y4 0.00000000208768x11x11x11x11x11x11x11x11x11x11x11x11 y5 1 a0 a1 a2 a3 a4 a5 x13,              2 x12 y12 -1 a12,              -0.1667x11x11x11 y0 0.00833x11x11x11x11x11 y1 -0.000198412x11x11x11x11x11x11x11 y2 0.00000275573192x11x11x11x11x11x11x11x11x11 y3 -0.00000002505210838x11x11x11x11x11x11x11x11x11x11x11 y4 0 a11 a0 a1 a2 a3 a4 x13]],
        gravity            = [[0.001 r-0.002, 0.001 r0.002, 0.001 r-0.002]],
        numparticles       = 2,
        particlelife       = 60,
        particlelifespread = 140,
        particlesize       = 40,
        particlesizespread = 13,
        particlespeed      = 0.5,
        particlespeedspread = 1.0,
        pos                = [[-10 r20, 0, -10 r20]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[firecloud2]],
      },
    },
  },

}

