class_name FighterTextureResource extends Resource

@export var active_image_id: int
@export var inactive_image_id: int
@export var setup_image_id: int

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	active_image_id = profile_data.active_id
	inactive_image_id = profile_data.inactive_id
	setup_image_id = profile_data.setup_id

func to_dict() -> Dictionary:
	return {
		"active_id": active_image_id,
		"inactive_id": inactive_image_id,
		"setup_id": setup_image_id
	}
