----------------------------------- ADAPTIONS TO BASE CLASS ------------------------------
local SHADELVL6DRAGON = { damage = { default = 500, flyer = 500, heavy = 500, light = 500, },}
local SHADELVL7DRAGON = { damage = { default = 575, flyer = 575, heavy = 575, light = 575, },}
local SHADELVL8DRAGON = { damage = { default = 650, flyer = 650, heavy = 650, light = 650, },}
local SHADELVL9DRAGON = { damage = { default = 725, flyer = 725, heavy = 725, light = 725, },}
local SHADELVL10DRAGON = { damage = { default = 800, flyer = 800, heavy = 800, light = 800, },}
-----------------------------------  BASE CLASS CHAINGUN ---------------------------------

local DRAGONBASE = {
      name               = "Dragon's Wrath",
	  accuracy           = 64,
      areaOfEffect       = 64,
	  commandFire 	     = true,	  
      range              = 350,
	  reloadtime         = 10,	  
-----------------------------
		avoidfeature = false,
		avoidfriendly = false,
		avoidground = false,
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		waterbounce = true,
		groundbounce = true,
		bounceRebound = 0, --stick the explosion to ground with 0 vertical component
		waterweapon = false,
		firesubmersed = false,
		energypershot = 500,
		explosiongenerator = "custom:DGUNTRACE",
		firestarter = 100,
		impulseboost = 0,
		impulsefactor = 0,
		noexplode = true,
		noselfdamage = true,
		soundhit = "explosion/ex_large8",
		soundhitwet = "explosion/wet/large_water_explode",
		soundhitwetvolume = 0.5,
		soundstart = "dragoncall",
		soundtrigger = true,
		tolerance = 10000,
		turret = true,
		weapontimer = 4.2,
		weapontype = "DGun",
		weaponvelocity = 300,
}
----------------------------------- FINALIZE ---------------------------------------------
function WeaponDefCopyTable(tableToCopy, deep)
  local copy = {}
  for key, value in pairs(tableToCopy) do
    if (deep and type(value) == "table") then
      copy[key] = WeaponDefCopyTable(value, true)
    else
      copy[key] = value
    end
  end
  return copy
end

function WeaponDefMergeTable(primary, secondary, deep)
    local new = WeaponDefCopyTable(primary, deep)
    for i, v in pairs(secondary) do
	    -- key not used in primary, assign it the value at same key in secondary
	    if not new[i] then
		    if (deep and type(v) == "table") then
			    new[i] = WeaponDefCopyTable(v, true)
		    else
			    new[i] = v
		    end
	    -- values at key in both primary and secondary are tables, merge those
	    elseif type(new[i]) == "table" and type(v) == "table"  then
		    new[i] = WeaponDefMergeTable(new[i], v, deep)
	    end
    end
    return new
end

return lowerkeys({
	SHADELVL6DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL6DRAGON),
	SHADELVL7DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL7DRAGON),
	SHADELVL8DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL8DRAGON),
	SHADELVL9DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL9DRAGON),
	SHADELVL10DRAGON = WeaponDefMergeTable(DRAGONBASE, SHADELVL10DRAGON),		
})

