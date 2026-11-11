class_name ProfilesManager

var fighter_profiles: FighterProfiles
var FIGHTER_PROFILES_PATH: String = "user://fighters"
var DEFAULT_PROFILES_PATH: String = "res://global/data/profiles/default_fighter_profiles.tres"

func _init() -> void:
	var profiles: Array = UserData.import_all_json_from_folder(FIGHTER_PROFILES_PATH)
	fighter_profiles = FighterProfiles.new()
	
	if profiles.is_empty():
		return
	
	for profile_data: Dictionary in profiles:
		var profile = FighterProfile.new(profile_data)
		fighter_profiles.add_new_profile(profile)

func get_profiles() -> FighterProfiles:
	return fighter_profiles

func save() -> void:
	DirAccess.make_dir_recursive_absolute(FIGHTER_PROFILES_PATH)
	var profiles_data: Array = fighter_profiles.get_profiles_data()
	for profile: Dictionary in profiles_data:
		var profile_name: String = profile.name
		UserData.export_json_file(profile, FIGHTER_PROFILES_PATH + "/" + profile_name + ".json")
	
