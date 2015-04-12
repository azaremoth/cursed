function gadget:GetInfo()
	return 
	{
		name = "DisableMoveCrtl",
		desc = "Freezes Unit Move Control.",
		author = "azaremoth",
		date = "April 22th, 2009",
     		license = "Public Domain, or the least-restrictive license your country allows.",
		layer = 1,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

function GG.Freeze(u, ud, team)
	Freeze(u, ud, team)
end

function GG.UnFreeze(u, ud, team)
	UnFreeze(u, ud, team)
end


function Freeze(u, ud, team)
   Spring.MoveCtrl.Enable(u)
end
gadgetHandler:RegisterGlobal("Freeze", Freeze)

function UnFreeze(u, ud, team)
   Spring.MoveCtrl.Disable(u)
end
gadgetHandler:RegisterGlobal("UnFreeze", UnFreeze)

end