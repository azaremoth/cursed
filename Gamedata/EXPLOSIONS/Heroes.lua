return {
  ["LEVELING"] = {
    explosionsphere = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 3,
      ground             = true,
      properties = {
        alpha              = 0.2,
        alwaysvisible      = true,
        color              = [[1, 1, 0.5]],
        expansionspeed     = [[15 r3]],
        ttl                = 8,
      },
    },  
    explosionspikes = {
      air                = true,
      class              = [[explspike]],
      count              = 50,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.19,
        alwaysvisible      = true,
        color              = [[1, 1, 0.5]],
        dir                = [[-45 r90,-45 r90,-45 r90]],
        length             = 10,
        width              = 5,
      },
    },
  },
}
