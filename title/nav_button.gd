extends Button

@export var scene_path: String

func _on_pressed() -> void:
	get_tree().paused = false
	LoadManager.load_scene_with_loading_screen(scene_path)
