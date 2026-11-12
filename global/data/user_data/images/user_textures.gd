class_name UserTextures

const USER_TEXTURES_PATH: String = "user://images"
const USER_TEXTURE_DATA_PATH: String = "user://images/image_data.json"
var textures: Dictionary[int, Texture] = {}
var file_path_to_id: Dictionary[String, int] = {}
var next_id: int = 0

func _init() -> void:
	var user_texture_data = UserData.import_json_file(USER_TEXTURE_DATA_PATH)
	if user_texture_data != null:
		next_id = user_texture_data.next_id
		file_path_to_id.assign(user_texture_data.file_path_to_id)
	
	var user_textures: Dictionary[String, Texture] = UserData.import_all_images_from_folder(USER_TEXTURES_PATH)
	for path: String in user_textures.keys():
		if file_path_to_id.has(path):
			textures[file_path_to_id[path]] = user_textures[path]
		else:
			textures[next_id] = user_textures[path]
			file_path_to_id[path] = next_id
			next_id += 1

func save() -> void:
	DirAccess.make_dir_recursive_absolute(USER_TEXTURES_PATH)
	var user_texture_data = {
		"next_id": next_id,
		"file_path_to_id": file_path_to_id
	}
	UserData.export_json_file(user_texture_data, USER_TEXTURE_DATA_PATH)

func get_user_texture(id: int) -> Texture:
	return textures[id]
