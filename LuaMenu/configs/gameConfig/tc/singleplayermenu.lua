return {
	{
		name = "skirmish",
		control = WG.BattleRoomWindow.GetSingleplayerControl(),
		entryCheck = WG.BattleRoomWindow.SetSingleplayerGame,
--		name = "skirmish", 
--		control = WG.BattleRoomWindow.GetSingleplayerControl(VFS.Include(LUA_DIRNAME .. "configs/gameConfig/tc/singleplayerQuickSkirmish.lua")),
--		entryCheck = WG.BattleRoomWindow.SetSingleplayerGame,
	},
--	{
--		name = "editor",
--		control = WG.SpringBoardWindow.GetControl(),
--	},
}
