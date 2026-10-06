extends Button

@export var battle_setup_menu: Control
@export var on_victory_menu: HBoxContainer

func _on_pressed() -> void:
	battle_setup_menu.visible = true
	on_victory_menu.visible = false
