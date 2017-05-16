
if addon.InGetInfo then
	return {
		name    = "LoadTexture",
		desc    = "",
		author  = "jK",
		date    = "2012",
		license = "GPL2",
		layer   = 2,
		depend  = {"LoadProgress"},
		enabled = true,
	}
end

------------------------------------------
math.randomseed(os.time())
local loadscreens = VFS.DirList("bitmaps/loadpictures/")
local backgroundTexture = loadscreens[ math.random(#loadscreens) ]
local aspectRatio


function addon.DrawLoadScreen()
	local loadProgress = SG.GetLoadProgress()

	if not aspectRatio then
		local texInfo = gl.TextureInfo(backgroundTexture)
		if not texInfo then return end
		aspectRatio = texInfo.xsize / texInfo.ysize
	end

	local vsx, vsy = gl.GetViewSizes()
	local screenAspectRatio = vsx / vsy

	local xDiv = 0
	local yDiv = 0
	local ratioComp = screenAspectRatio / aspectRatio

	if (ratioComp > 1) then
		xDiv = (1 - (1 / ratioComp)) * 0.5;
	elseif (math.abs(ratioComp - 1) < 0) then
	else
		yDiv = (1 - ratioComp) * 0.5;
	end

	-- background
	--fade in: gl.Color(1,1,1,1 - (1 - loadProgress)^5)
	gl.Color(1,1,1,1)
	gl.Texture(backgroundTexture)
	gl.TexRect(0+xDiv,0+yDiv,1-xDiv,1-yDiv)
	gl.Texture(false)
end

function addon.Shutdown()
	gl.DeleteTexture(backgroundTexture)
end
