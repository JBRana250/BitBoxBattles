class_name FighterProfiles extends Resource

@export var next_id: int
@export var profiles: Dictionary[int, FighterProfile]

func get_profiles_data() -> Array:
	var profiles_data = []
	for profile: FighterProfile in profiles.values():
		var profile_data: Dictionary = profile.get_profile_data()
		profiles_data.append(profile_data)
	return profiles_data

func add_new_profile(fighter_profile: FighterProfile) -> void:
	profiles[next_id] = fighter_profile
	next_id += 1

func modify_existing_profile(id: int, fighter_profile: FighterProfile) -> void:
	profiles[id] = fighter_profile

func delete_profile(id: int) -> void:
	profiles.erase(id)
