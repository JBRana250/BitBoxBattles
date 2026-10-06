extends Node

func _ready() -> void:
	BattleEventBus.start_battle.connect(_start_battle)

func _start_battle(fighter_one_profile: FighterProfile, fighter_two_profile: FighterProfile) -> void:
	BattleEventBus.clear_fighters.emit()
	BattleEventBus.spawn_fighters.emit(fighter_one_profile, fighter_two_profile)
