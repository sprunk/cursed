function widget:GetInfo()
  return {
    name      = "Select n Center!",
    desc      = "Selects and centers the Commander at the start of the game.",
    author    = "quantum and Evil4Zerggin",
    date      = "19 April 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 1003,
    enabled   = true  --  loaded by default?
  }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local go = true
local zDist = 750
local yDist = 1750

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Update()
  local t = Spring.GetGameSeconds()
  if (select(3,Spring.GetPlayerInfo(Spring.GetMyPlayerID(),false)) or t > 10) then
    widgetHandler:RemoveWidget(self)
    return
  end
  if (t > 1) then
  
	local camera = Spring.GetCameraState()
  
    local unitArray = Spring.GetTeamUnits(Spring.GetMyTeamID())
    if (go and unitArray[1]) then
      local x, y, z = Spring.GetUnitPosition(unitArray[1])
	  
--	  camera.name = "viewfree"
	  camera.px = x
	  camera.py = y+yDist
	  camera.pz = z+zDist	  
	  camera.dx = 0
	  camera.dy = -0.90
	  camera.dz = -0.45
	  camera.rx = -1.02
	  camera.ry = 3.14
	  camera.rz = 0

	  Spring.SetCameraState(camera)	  
--	  WG.COFC_SetCameraTarget(x,y+yDist,z+zDist,0.5,true)
  
      Spring.SelectUnitArray{unitArray[1]}
      go = false
    end
    if (not go) then
      widgetHandler:RemoveWidget(self)
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------