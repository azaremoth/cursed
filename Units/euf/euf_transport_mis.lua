--------------------------------------------------------------------------------

local unitName = "euf_transport_mis"

--------------------------------------------------------------------------------

local unitDef = {
  name               = "Dropship",
  description        = "Troop transport",
  objectName         = "euf_transport_mis.s3o",
  script             = "euf_transport_mis.lua", 
  buildPic           = "euf_transport.png",
  category           = "EUF AIR",
  armortype          = "FLYER",   
  side               = "imperials",
  iconType           = "triangle",
  buildCostEnergy    = 0,
  buildCostMetal     = 0,
  buildTime          = 0,
-- Collision
  collide                = false,
  collisionSphereScale   = 0.05,
  collisionVolumeOffsets = [[0 10 0]],
  collisionVolumeScales  = [[85 35 85]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[Box]],
  customParams          = {	
	factionname			= "imperials",
	normaltex 			= "unittextures/normalmaps/euf_transport_normal.png",
	normalmaps 			= "yes",			
	helptext 			= "An armored flying troop transporter that can hold up to 8 soldiers."	
	},
  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = "SMALL_EXPLOSION_YELLOW",
  footprintX         = 6,
  footprintZ         = 6,
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = false,
  maxDamage          = 3000,
  maxSlope           = 25,
  maxWaterDepth      = 0,
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  onoffable          = false,
  radarDistance      = 0,
  selfDestructAs     = "SMALL_EXPLOSION_YELLOW",
  showNanoFrame      = false,
  sightDistance      = 512,
  smoothAnim         = false,
  unitname           = "euf_transport_mis",
  useBuildingGroundDecal = false,  
  yardMap            = "oooooo oooooo oooooo oooooo oooooo oooooo",
  sfxtypes = {
    explosiongenerators = {
      "custom:Small_Explosion_YELLOW",
    },
  },  
  sounds = {
    build              = "",
    canceldestruct     = "",
    repair             = "",
    underattack        = "voices_emergency",
    working            = "",
    arrived = {
      "",
    },
    cant = {
      "",
    },
    count = {
      "",
      "",
      "",
      "",
      "",
      "",
    },
    ok = {
      "bomber_move",
    },
    select = {
      "bomber_select",
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
