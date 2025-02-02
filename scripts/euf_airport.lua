include "constants.lua"
include "common.lua"

-- pieces
local base = piece 'base'
local raisepoint = piece 'raisepoint'
local platform = piece 'platform' 
local building = piece 'building' 
local emit_sparkles1 = piece 'emit_sparkles1' 
local emit_sparkles2 = piece 'emit_sparkles2' 
local emit_sparkles3 = piece 'emit_sparkles3' 
local fist1 = piece 'fist1'
local fist2 = piece 'fist2'
local fist3 = piece 'fist3'


-- action pieces
local buildpoint = piece 'buildpoint' 
local smokePieces= { platform, building, fist2 }
local nanoPieces = { base }

-- variables
local isbuilding = false

-- FX
local BOOM	 = 1024+0
local BUILDINGFX	 = 1025+0
local SPARKS	 = 1026+0
local DUST = 1027+0

---------------------------

local function Building()
	while true do
		if isbuilding then
			EmitSfx(emit_sparkles1,SPARKS)
			EmitSfx(buildpoint,DUST)			
			Sleep(150)
		end
		if isbuilding then
			EmitSfx(emit_sparkles2,SPARKS)
			Sleep(150)
		end		
		if isbuilding then
			EmitSfx(emit_sparkles3,SPARKS)
			EmitSfx(buildpoint,DUST)				
		end		
		Sleep(250)		
	end
end

local function Open ()
	SetSignalMask (1)

	-- set values
	SetUnitValue (COB.YARD_OPEN, 1)
	SetUnitValue (COB.INBUILDSTANCE, 1)
	SetUnitValue (COB.BUGGER_OFF, 1)
end

local function Close()
	Signal (1)

	-- set values
	SetUnitValue (COB.YARD_OPEN, 0)
	SetUnitValue (COB.BUGGER_OFF, 0)
	SetUnitValue (COB.INBUILDSTANCE, 0)

	-- move pieces back to original spots

end

function script.Create()
	if NotEnemyAI() then
		Hide(fist1)
		Hide(fist2)
		Hide(fist3)		
	end
	local structureheight = ((-15*GetUnitValue(COB.UNIT_HEIGHT))/1000000)
	Move( raisepoint, y_axis, structureheight)
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0) do
		local leftbuildpercent = (GetUnitValue(COB.BUILD_PERCENT_LEFT))
		local outofground = (0.01*leftbuildpercent*structureheight)
		Move( raisepoint, y_axis, outofground, 50 )
		EmitSfx(base,BUILDINGFX)
		Sleep(100)
	end
	Move( raisepoint, y_axis, 0, 200 )
	Sleep(500)

	StartThread (SmokeUnit, smokePieces)
	StartThread( Building )	
	Spring.SetUnitNanoPieces (unitID, nanoPieces)
end

function script.QueryNanoPiece ()
	return base
end

function script.Activate ()
	isbuilding = true
	StartThread (Open) -- animation needs its own thread because Sleep and WaitForTurn will not work otherwise
end

function script.Deactivate ()
	isbuilding = false
	StartThread (Close)
end

function script.QueryBuildInfo ()
	return buildpoint
end

function script.Killed (recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if (severity <= .5) then
		EmitSfx(base,BOOM)
		Explode (platform, SFX.SHATTER)
		
		return 1
	else
		EmitSfx(base,BOOM)
		Explode (platform, SFX.SHATTER)

		return 2
	end
end
