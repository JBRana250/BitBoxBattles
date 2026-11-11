class_name ModuleScenes

var scenes: Dictionary[Module.ModuleType, PackedScene] = {}

func _init() -> void:
	scenes[Module.ModuleType.DRAGGABLE_VALUE] = load("res://fighter_creator/workspace/modules/draggable_progress_bar.tscn")
	scenes[Module.ModuleType.IMAGE_IMPORT] = load("res://fighter_creator/popups/import_image_popup/image_importer.tscn")

func get_scene(type: Module.ModuleType) -> PackedScene:
	return scenes[type]
