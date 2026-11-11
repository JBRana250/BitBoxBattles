extends Control

@export var profiles_hflow: HFlowContainer
@export var profile_option: PackedScene
@export var reload_profiles_button: Button
@export var profile_options: Control

var fighter_profiles: FighterProfiles

func _ready() -> void:
	init_profile_selection()

func init_profile_selection() -> void:
	fighter_profiles = UserData.profiles_manager.fighter_profiles
	for option: ProfileOption in profiles_hflow.get_children():
		option.queue_free()
	visible = true
	
	for id: int in fighter_profiles.profiles.keys():
		var profile: FighterProfile = fighter_profiles.profiles[id]
		var profile_option_instance: ProfileOption = profile_option.instantiate()
		profile_option_instance.init_fighter_option(profile, self, id)
		profiles_hflow.add_child(profile_option_instance)

func choose_fighter(profile: FighterProfile, id: int) -> void:
	profile_options.init_profile_options(profile, id)
