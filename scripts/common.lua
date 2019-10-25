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

function NotEnemyAI()
	local localteam = Spring.GetUnitTeam(unitID)
	local _,_,_,_,_,localAllyTeam,_,_ = Spring.GetTeamInfo(localteam)
	-- Spring.Echo("localAllyTeam")
	-- Spring.Echo(localAllyTeam)
	local ai = select(4, Spring.GetTeamInfo(localteam))
	if ai then
		local isAlliedToPlayer = false
		for _,team in ipairs(Spring.GetTeamList()) do	
			local loopAi = select(4, Spring.GetTeamInfo(team))
				-- Spring.Echo("loopAi")
				-- Spring.Echo(loopAi)
			local _,_,_,_,_,allyTeam,_,_ = Spring.GetTeamInfo(team)
				-- Spring.Echo("allyTeam")
				-- Spring.Echo(allyTeam)
			if not loopAi and allyTeam == localAllyTeam then
				isAlliedToPlayer = true
			end
		end
		if isAlliedToPlayer then
			return true
		else
			return false
		end
	else
		return true
	end
end