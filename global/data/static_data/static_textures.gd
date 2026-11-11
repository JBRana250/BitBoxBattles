class_name StaticTextures

enum ID {
	GODOT,
	
	FUTURE_BOT_IDLE,
	FUTURE_BOT_THINKING,
	FUTURE_BOT_SPLASH,
	
	PAST_BOT_IDLE,
	PAST_BOT_THINKING,
	PAST_BOT_SPLASH
}

var textures: Dictionary[ID, Texture] = {}
var DIR_PATH: String = "res://textures/static_textures/"

func _init() -> void:
	for id in ID.keys():
		textures[ID[id]] = load(DIR_PATH + id.to_lower() + ".png")

func get_texture(id: ID) -> Texture:
	return textures[id]

static func get_ids() -> Array[ID]:
	return ID.values()
