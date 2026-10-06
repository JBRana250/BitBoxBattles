extends Button

@export var battle_setup_menu: Control
@export var pause_menu: Control

func _on_pressed() -> void:
	pause_menu.visible = false
	get_tree().paused = false
	battle_setup_menu.visible = true
