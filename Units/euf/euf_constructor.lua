-- UNITDEF -- euf_constructor --
--------------------------------------------------------------------------------

local unitName = "euf_constructor"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.0,
  activateWhenBuilt  = true,
  armortype          = "LIGHT",
  badTargetCategory  = "AIR",
  brakeRate          = 1.5,
  buildCostEnergy    = 250,
  buildCostMetal     = 250,
  buildDistance      = 200,
  builder            = true,
  buildPic           = "euf_constructor.png",
  buildTime          = 250,
  canAssist          = true,
  canBeAssisted      = false,
  canGuard           = true,
  canPatrol          = true,
  canReclaim         = true,
  canRepair          = true,
  canstop            = "1", 
  canAttack          = true,
  CantBeTransported  = false,
  --canHover           = true,
  canMove            = true,
  category           = "EUF LAND LIGHTARMOR",
  customParams       = {	
	noautorepair	 = true,
	canbetransported = "true",	
	factionname		 = "imperials",
    helptext = "This hovering robot can build basic structures. It has a weak stun-gun but can not shoot out of bunkers."	
	},
  defaultmissiontype = "Standby",
  description        = "basic builder",
  energyMake         = 5,
  energyStorage      = 0,
  explodeAs          = "NULL",
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = "spanner",
  idleAutoHeal       = 0.01,
  idleTime           = 400,
  levelGround        = true,  

  crushResistance    = 2000,
  mass               = 1100,
  
  maxDamage          = 800,
  maxSlope           = 14,
  maxVelocity        = 2,
  maxWaterDepth      = 255,
  metalMake          = 0.5,
  metalStorage       = 0,
  movementClass      = "TANKHOVER2x2",
  name               = "Builderoid",
  nanoColor          = "0.16 1 1",
  noChaseCategory    = "AIR",
  objectName         = "euf_constructor.s3o",
  reclaimSpeed       = 5,
  repairSpeed        = 6,
  resurrectSpeed     = 0,
  script             = "euf_constructor.cob",  
  selfDestructAs     = "NULL",
  showNanoFrame      = false,
  showNanoSpray      = true,
  side               = "imperials",
  sightDistance      = 512,
  smoothAnim         = false,
  sonarDistance      = 768,
  standingfireorder  = "2",
  standingmoveorder  = "2",
  terraformSpeed     = 1200,
  turnRate           = 1005,
  unitname           = "euf_constructor",
  upright            = true,
  workerTime         = 25,
  buildoptions = {
    "euf_metalextractor_lvl1",
    "euf_solar",
    "euf_storage",	
    "euf_radar_lvl1",
    "euf_barracks",	
    "euf_factory",
    "euf_airport",		
    "euf_church",		
    "euf_bunker",
    "euf_plasmatower",
    "euf_artytower",	
    "euf_aatower",
    "euf_wall",	
  },
  sfxtypes = {
    explosiongenerators = {
      "custom:TINY_EXPLOSION_YELLOW",
      "custom:PLasmaTowerGunFlare",
      "custom:PLasmaTowerGunGroundflash",	 
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
      "voices_yes",
    },
    select = {
      "voices_engrdy",
    },
  },
  weapons = {
    [1]  = {
      def                = "TAZER",
      mainDir            = "0 0 1",
      maxAngleDif        = 160,
      onlyTargetCategory = "LAND",
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TAZER = {
    accuracy           = 300,
    areaOfEffect       = 8,
    -- beamweapon         = true,
    burnblow           = true,
    cegTag             = "LICHBOLT",
    coreThickness      = 0,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.05,
      energypershot           = 0,	
    explosionGenerator = "custom:LICHBOLT_EXPLOSION",
    impulseBoost       = 0,
    intensity          = 0.5,
    -- lineofsight        = true,
    name               = "Tazer",
    paralyzer          = 1,
    paralyzetime       = 15,
    range              = 175,
    reloadtime         = 2.0,
    -- rendertype         = 0,
    rgbColor           = "1 1 1",
--    soundHit           = "defender_hit",
    soundStart         = "paralyser",
    soundStartVolume   = 15,
    soundTrigger       = true,
    startVelocity      = 650,
    texture1           = "darkbolt",
    texture2           = "null_texture",
    texture3           = "null_texture",
    thickness          = 1.8,
    tolerance          = 3000,
    tracks             = false,
    turnRate           = 6000,
    turret             = true,
    weaponAcceleration = 1,
    weaponTimer        = 1,
    weaponType         = "LaserCannon",
    weaponVelocity     = 650,
    damage = {
      default            = 175,
      flyer              = 175,
      heavy              = 175,
      light              = 175,
    },
  },
 --[[   TORPEDO = {
      name                    = "Torpedo Launcher",
      areaOfEffect            = 16,
      avoidFriendly           = false,
      bouncerebound           = 0.5,
      bounceslip              = 0.5,
      burnblow                = true,
		cegTag             = "BUBBLE_TRAIL",	  
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
      explosionGenerator      = "custom:TORPEDOEXPLOSION",
      groundbounce            = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      model                   = "Rocket.s3o",
      numbounce               = 4,
      range                   = 300,
      reloadtime              = 1.75,
      -- rendertype              = 1,
      soundHit                = "ex_underwater",
      soundStart              = "bomb_drop",
      startVelocity           = 150,
      tracks                  = true,
      turnRate                = 22000,
      turret                  = true,
      waterWeapon             = true,
      weaponAcceleration      = 22,
      weaponTimer             = 3,
      weaponType              = "TorpedoLauncher",
      weaponVelocity          = 320,
    damage = {
      default            = 150,
      flyer              = 150,
      heavy              = 150,
      light              = 150,
    },	  
  },]]--
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
