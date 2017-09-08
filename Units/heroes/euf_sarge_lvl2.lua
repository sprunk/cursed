--------------------------------------------------------------------------------

local unitName = "euf_sarge_lvl2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = false,
  armortype          = "light",
  brakeRate          = 1.0,
  buildCostEnergy    = 500,
  buildCostMetal     = 500,
  buildPic           = "euf_sarge.png",
  buildTime          = 500,
  canAssist          = false,
  canAttack          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canRepair          = false,
  canstop            = "1",
  capturable         = false, 
  category           = "EUF LAND LIGHTARMOR",
  collisionVolumeOffsets 	= "0 0 0",
  collisionVolumeScales 	= "22 35 22",
  collisionVolumeType 		= "CylY",
  -- collisionVolumeTest 		= 1,
  customParams          = {
  	factionname		   = "imperials",
	isinfantry = "true",	
    canjump        = "1",
	jumpclass = "hero",		
	normaltex = "unittextures/normalmaps/euf_sarge_normal.png",
	normalmaps = "yes",	
	ProvideTech = "-Hero",	
    helptext = "The Sarge is a tank class imperial hero. Fear his chain- and plasmaguns!"		
  },
  defaultmissiontype = "Standby",
  description        = "Hero",
  energyMake         = "",
  explodeAs          = "BLOOD_EXPLOSION",
  firestandorders    = "1",
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = "skull",
  idleAutoHeal       = 2.5,
  idleTime           = 200,
  mass               = 2000,
  maxDamage          = 2800,
  maxSlope           = 20,
  maxVelocity        = 2,
  maxWaterDepth      = 12,
  mobilestandorders  = "1",
  movementClass      = "Trooper3X3",
  name               = "Sarge (Level 2)",
  nanoColor          = "0 0 0",
  noAutoFire         = false,
  noChaseCategory    = "AIR",
  objectName         = "euf_sarge.s3o",
  repairable         = false,  
  selfDestructAs     = "BLOOD_EXPLOSION",
  showNanoFrame      = false,
  showNanoSpray      = false,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  standingfireorder  = "2",
  standingmoveorder  = "1",
  terraformSpeed     = 0,
  turnRate           = 1000,
  turnInPlace        = true,
  
  leavetracks            = 1,
  trackOffset            = 0,
  trackStrength          = 5,
  trackStretch           = 1,
  trackType              = [[Sarge]],
  trackWidth             = 36,   
  
  unitname           = "euf_sarge_lvl2",
  upright            = true,
  workerTime         = 0,
  script			 = "euf_sarge.lua",
  sfxtypes = {
    explosiongenerators = {
      "custom:BLOOD_EXPLOSION",
      "custom:MARINEGUNFLARE",
      "custom:MARINEGROUNDFLASH",
      "custom:blood_spray",
      "custom:Greycloud",
      "custom:SargeGunFlare",
      "custom:PLasmaTowerGunGroundflash",
	  "custom:JUMPBURST",
	  "custom:LEVELING",	  
    },
  },
 sounds = {
    canceldestruct     = "",
    underattack        = "sarge_underatk.ogg",
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
      "sarge_move.ogg",
      "sarge_move2.ogg",	  
      "sarge_move3.ogg",	  
    },
    select = {
      "sarge_select.ogg",
      "sarge_select2.ogg",	
    },
  },
  weapons = {
    [1]  = {
	  def                = "SARGE_CHAINGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",	
    },
   [2]  = {
	  def                = "SARGE_CHAINGUN",
      mainDir            = "0 0 1",
      maxAngleDif        = 180,
      onlyTargetCategory = "LAND AIR",
      badTargetCategory = "HEAVYARMOR",		  
    },	
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
SARGE_CHAINGUN = {
    avoidFriendly      = true,
	collideFriendly    = true,
    accuracy           = 1024,
    areaOfEffect       = 16,
	cylinderTargeting = 128,		
    energypershot           = 0,	
    explosionGenerator = "custom:SMALL_BULLET_FX",
	explosionScar      = false,	
    interceptedByShieldType = 1,
    name               = "Chaingun",
    range              = 350,
    reloadtime         = .1,
    soundHit           = "defender_hit",
    soundStart         = "chaingun",
    soundStartVolume   = 15,
    soundTrigger       = true,
    tolerance          = 3000,
    turret             = true,
    weaponVelocity     = 1600,
--	Weaponspecial ------------------------------------------
    model              = "gunshot.s3o",    
	size               = 5,
	stages 			   = 0,
	weaponType         = "Cannon",
------------------------------------------------------------	
    damage = {
      default            = 20,
      flyer              = 20,
      heavy              = (20*0.75),
      light              = 20,
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

