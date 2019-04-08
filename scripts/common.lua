function Turn2(piecenum,axis, degrees, speed)
	local radians = degrees * 3.1415 / 180
	if speed then
		local speed1 = speed * 3.1415 / 180
		Turn(piecenum, axis, radians, speed1) 
	else
		Turn(piecenum, axis, radians ) 
	end
end

function SmokeUnit(smokepiece, SMOKE)
	while true do
		health = Spring.GetUnitHealth(unitID)
		if (health < 200 and (not Spring.GetUnitIsCloaked(unitID))) then
			if SMOKE ~= nil then
				EmitSfx(smokepiece, SMOKE)
			end
		end
		Sleep(500)		
	end
end

function NotAI()
	local team = Spring.GetUnitTeam(unitID)
	local ai = select(4, Spring.GetTeamInfo(team))
	if ai then
		return false
	else
		return true
	end
end