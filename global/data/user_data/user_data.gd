extends Node

var profiles_manager: ProfilesManager
var image_manager: ImageManager

func _ready() -> void:
	init_data()
	get_tree().auto_accept_quit = false

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		profiles_manager.save()
		#image_manager.save() TEMP
		get_tree().quit()

#region Obtain Data
func get_profiles() -> FighterProfiles:
	return profiles_manager.fighter_profiles

func get_user_image(image_id: int) -> Texture:
	return image_manager.get_user_image(image_id)
# Import Data
#endregion

#region Add Data
func save_multiple_images(images: Array[Texture]) -> void:
	for image: Texture in images:
		save_user_image(image)

func save_user_image(new_image: Texture) -> void:
	image_manager.add_user_image(new_image)
#endregion

#region Import Data

func init_data() -> void:
	profiles_manager = ProfilesManager.new()
	image_manager = ImageManager.new()

func import_json_file(path: String) -> Variant: ## Can be dict or array
	var file = FileAccess.open(path, FileAccess.READ)
	if !file:
		return null
	var json_text: String = file.get_as_text()
	var json: Variant = JSON.parse_string(json_text)
	return json

func import_image_file(path: String) -> Texture:
	return ImageTexture.create_from_image(Image.load_from_file(path))

func import_all_json_from_folder(path: String) -> Array:
	var files: Array = get_all_files_from_folder(path)
	
	var all_json = []
	for file_name: String in files:
		var json: Variant = import_json_file(path + "/" + file_name)
		print(json)
		all_json.append(json)
	return all_json

func import_all_images_from_folder(path: String) -> Array:
	var files: Array[String] = get_all_files_from_folder(path)
	
	var all_image = []
	for file_name: String in files:
		var image: Texture = import_image_file(path + "/" + file_name)
		all_image.append(image)
	return all_image

func get_all_files_from_folder(path: String) -> Array[String]:
	var dir_access: DirAccess = DirAccess.open(path)
	if dir_access == null:
		return []
	
	var files: Array = Array(dir_access.get_files())
	if files == null:
		return []
	return files
#endregion

#region Export Data
func export_json_file(data: Variant, filepath: String) -> void:
	print(filepath)
	var file = FileAccess.open(filepath, FileAccess.WRITE)
	if file == null:
		print_debug("ERROR OPENING SAVEFILE ", FileAccess.get_open_error())
	var json_string: String = JSON.stringify(data)
	file.store_string(json_string)
	file.close()
#endregion
