class_name ImageManager

var user_images: UserImages
var USER_IMAGES_PATH: String = "user://images"
var USER_IMAGE_DATA_PATH: String = "user://images/image_data.json"

func _init() -> void:
	var import = UserData.import_json_file(USER_IMAGE_DATA_PATH)
	if import == null:
		return
	var image_data: Dictionary[int, String] = import
	
	var id_to_image: Dictionary[int, Texture] = {}
	for image_id: int in image_data:
		var image_file_path: String = image_data[image_id]
		var image: Texture = UserData.import_image_file(image_file_path)
		id_to_image[image_id] = image
		
	user_images = UserImages.new(id_to_image)

func get_user_image(image_id: int) -> Texture:
	return user_images.get_image(image_id)

func add_user_image(new_image: Texture) -> void:
	user_images.add_new_image(new_image)

func get_images() -> UserImages:
	return user_images
