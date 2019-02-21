function Detonate()	
--	GG.QueueUnitDescruction(unitID, true)
	GG.delayeddeathlist[unitID] = Spring.GetGameFrame()
end