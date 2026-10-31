extends Node

@onready var load_screen_path: String = "res://global/loading/loading_screen.tscn"
var target_scene_path: String = ""

func load_scene_with_loading_screen(path: String) -> void:
	if ResourceLoader.has_cached(path):
		var cached_scene = load(path)
		get_tree().change_scene_to_packed(cached_scene)
	else:
		target_scene_path = path
		get_tree().change_scene_to_file(load_screen_path)
