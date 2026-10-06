extends Button

@export var on_victory_menu: HBoxContainer
@export var scene_path: String

func _on_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", scene_path)
	on_victory_menu.visible = false
