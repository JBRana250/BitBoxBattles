class_name FighterInitResource extends Resource

# Battle Init
@export var name: String = "No Name"
@export var starting_force: float = 0.0
@export var fighter_mass: float = 1.0

# Setup Init
enum SetupAnimType {
	NONE,
	IDLE,
	EXCITED
}

@export var setup_anim_type: SetupAnimType

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	name = profile_data.name
	starting_force = profile_data.starting_force
	fighter_mass = profile_data.mass

func to_dict() -> Dictionary:
	return {
		"name": name,
		"starting_force": starting_force,
		"mass": fighter_mass
	}
