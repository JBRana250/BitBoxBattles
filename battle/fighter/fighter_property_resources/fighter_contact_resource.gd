class_name FighterContactResource extends Resource

@export var contact_damage: int
@export var contact_cooldown: float
@export var contact_knockback: float

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	contact_damage = profile_data.contact_damage
	contact_cooldown = profile_data.contact_cooldown
	contact_knockback = profile_data.contact_knockback

func to_dict() -> Dictionary:
	return {
		"contact_damage": contact_damage,
		"contact_cooldown": contact_cooldown,
		"contact_knockback": contact_knockback
	}
