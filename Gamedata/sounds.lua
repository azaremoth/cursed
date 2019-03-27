local Sounds = {
   SoundItems = {
      FailedCommand = {
		 file = "sounds/FailedCommand.wav",
      },
      IncomingChat = {
		 file = "sounds/click.wav",
      },
      MultiSelect = {
         file = "sounds/click.wav",
      },
      MapPoint = {
         file = "sounds/mappoint.wav",
      },
      DefaultsForSounds = { -- this are default settings
         file = "ThisEntryMustBePresent.wav",
         gain = 1.0,
         pitch = 1.0,
         priority = 0,
         maxconcurrent = 4, --- some reasonable limits
         maxdist = FLT_MAX, --- no cutoff at all
      },
	  Sparks = {
         file = "sounds/sparks.wav",
         priority = -10,
         maxconcurrent = 1,
         maxdist = 1000,
         preload = false,
         in3d = true,
         rolloff = 4,
      },
   },
}

--------------------------------------------------------------------------------
-- Automagical sound handling
--------------------------------------------------------------------------------
local VFSUtils = VFS.Include('gamedata/VFSUtils.lua')

local optionOverrides = {
}

local defaultOpts = {
	pitchmod = 0, --0.02,
	gainmod = 0,
}
local replyOpts = {
	pitchmod = 0, --0.02,
	gainmod = 0,
}

local noVariation = {
	dopplerscale = 0,
	in3d = false,
	pitchmod = 0,
	gainmod = 0,
	pitch = 1,
	gain = 1,
}

local ignoredExtensions = {
	["svn-base"] = true,
}

local function AutoAdd(subDir, generalOpts)
	generalOpts = generalOpts or {}
	local opts
	local dirList = RecursiveFileSearch("sounds/" .. subDir)
	--local dirList = RecursiveFileSearch("sounds/")
	--Spring.Echo("Adding sounds for " .. subDir)
	for _, fullPath in ipairs(dirList) do
		local path, key, ext = fullPath:match("sounds/(.*/(.*)%.(.*))")
		local pathPart = fullPath:match("(.*)[.]")
		pathPart = pathPart:sub(8, -1)	-- truncates extension fullstop and "sounds/" part of path
		--Spring.Echo(pathPart)
		if path ~= nil and (not ignoredExtensions[ext]) then
			if optionOverrides[pathPart] then
				opts = optionOverrides[pathPart]
				--Spring.Echo("optionOverrides for " .. pathPart)
			else
				opts = generalOpts
			end
			--Spring.Echo(path,key,ext, pathPart)
			Sounds.SoundItems[pathPart] = {
				file = tostring('sounds/'..path), 
				rolloff = opts.rollOff, 
				dopplerscale = opts.dopplerscale, 
				maxdist = opts.maxdist, 
				maxconcurrent = opts.maxconcurrent, 
				priority = opts.priority, 
				in3d = opts.in3d,
				gain = opts.gain, 
				gainmod = opts.gainmod, 
				pitch = opts.pitch, 
				pitchmod = opts.pitchmod
			}
			--Spring.Echo(Sounds.SoundItems[key].file)
		end
	end
end

-- add sounds
AutoAdd("explosion", defaultOpts)
AutoAdd("music", noVariation)

return Sounds
