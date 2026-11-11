class_name UserImages extends Node

@export var next_id: int
@export var user_images: Dictionary[int, Texture]

func _init(starting_images: Dictionary[int, Texture]) -> void:
	user_images = starting_images

func add_image_array(new_images: Array[Texture]) -> void:
	for image: Texture in new_images:
		add_new_image(image)

func add_new_image(new_image: Texture) -> void:
	user_images[next_id] = new_image
	next_id += 1

func modify_existing_image(id: int, new_image: Texture) -> void:
	user_images[id] = new_image

func get_image(id: int) -> Texture:
	return user_images[id]

func delete_image(id: int) -> void:
	user_images.erase(id)
