-- all values to 50%
function battleGroupCondition1(idleFactor, idleCost) -- raider
	return idleFactor > 0.3 or idleCost > 500
end
-- all values to 50%
function battleGroupCondition2(idleFactor, idleCost) -- combat
	return idleCost > 200 and (idleFactor > 0.45 or (idleCost > 1000 and idleFactor > 0.2) or idleCost > 2000)
end
-- all values to 75%
function battleGroupCondition3(idleFactor, idleCost) -- gunship
	return idleCost > 750 
end