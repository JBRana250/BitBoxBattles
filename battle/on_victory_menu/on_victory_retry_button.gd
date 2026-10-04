extends Button

@export var on_victory_menu: HBoxContainer

func _on_pressed() -> void:
	BattleEventBus.start_battle.emit()
	on_victory_menu.visible = false
