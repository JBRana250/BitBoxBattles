class_name FighterHealthResource extends Resource

@export var max_health: int

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	max_health = profile_data.max_health

func to_dict() -> Dictionary:
	return {
		"max_health": max_health
	}
