local objectname= "euf_wall_lvl2" 
local featureDef  =  {
	name = "euf_wall_lvl2",
	resurrectable	   = 0,  
    category         = [[dragonteeth]],
    nodrawundergray  = true,  
    autoreclaimable    = "0",
    blocking           = true,
	mass			   = 10000,
	customparams = { 
		normaltex 		   	= "unittextures/normalmaps/atlas_euf_buildings_normal.png",
		normalmaps 		   	= "yes",
	}, 	
	collisionVolumeType 		= "Box",
	collisionVolumeScales 	= "80 70 10",
	collisionVolumeOffsets 	= "0 0 5",	
    damage             = 10000,
    description        = "Defensewall",
    footprintX         = 5,
    footprintZ         = 1,
    height             = "15",
    hitdensity         = "10000",
    metal              = 20,
    object             = "euf_wall_lvl2.s3o",
    reclaimable        = true,
    upright            = true,
    world              = "allworld",
}
return lowerkeys({[featureDef.name] = featureDef})
