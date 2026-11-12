class_name FighterTextureResource extends Resource

@export var active_image_ptr: TexturePointer
@export var inactive_image_ptr: TexturePointer
@export var setup_image_ptr: TexturePointer

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	active_image_ptr = TexturePointer.create_from_dict(profile_data.active_ptr)
	inactive_image_ptr = TexturePointer.create_from_dict(profile_data.inactive_ptr)
	setup_image_ptr = TexturePointer.create_from_dict(profile_data.setup_ptr)

# this needs to be able to be stored in json format
# so basically only dictionaries / arrays / primitives allowed
func to_dict() -> Dictionary:
	return {
		"active_ptr": active_image_ptr.to_dict(),
		"inactive_ptr": inactive_image_ptr.to_dict(),
		"setup_ptr": setup_image_ptr.to_dict()
	}
