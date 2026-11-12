class_name ProfilesManager

var fighter_profiles: FighterProfiles
var FIGHTER_PROFILES_PATH: String = "user://fighters"
var DEFAULT_PROFILES_PATH: String = "res://global/data/profiles/default_fighter_profiles.tres"

func _init() -> void:
	var profiles: Array = UserData.import_all_json_from_folder(FIGHTER_PROFILES_PATH)
	fighter_profiles = FighterProfiles.new(profiles)

func get_profiles() -> FighterProfiles:
	return fighter_profiles

func save() -> void:
	DirAccess.make_dir_recursive_absolute(FIGHTER_PROFILES_PATH)
	clear_profiles()
	var profiles_data: Array = fighter_profiles.get_profiles_data()
	for profile: Dictionary in profiles_data:
		var profile_name: String = profile.name
		UserData.export_json_file(profile, FIGHTER_PROFILES_PATH + "/" + profile_name + ".json")
	
func clear_profiles() -> void:
	var files: Array = UserData.get_all_files_from_folder(FIGHTER_PROFILES_PATH)
	for file_name: String in files:
		DirAccess.remove_absolute(FIGHTER_PROFILES_PATH + "/" + file_name)
