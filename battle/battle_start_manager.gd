extends Node

func _ready() -> void:
	BattleEventBus.start_battle.connect(_start_battle)
	BattleEventBus.start_battle.emit()

func _start_battle() -> void:
	BattleEventBus.clear_fighters.emit()
	BattleEventBus.spawn_fighters.emit()
