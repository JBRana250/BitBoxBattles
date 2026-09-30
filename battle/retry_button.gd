extends Button

func _ready() -> void:
	BattleEventBus.victory.connect(on_victory)

func on_victory() -> void:
	visible = true

func _on_pressed() -> void:
	BattleEventBus.start_battle.emit()
	visible = false
