class_name FighterProfiles extends Resource

@export var next_id: int
@export var profiles: Dictionary[int, FighterProfile]

func add_new_profile(fighter_profile: FighterProfile) -> void:
	profiles[next_id] = fighter_profile
	next_id += 1

func modify_existing_profile(id: int, fighter_profile: FighterProfile) -> void:
	profiles[id] = fighter_profile

func delete_profile(id: int) -> void:
	profiles.erase(id)
