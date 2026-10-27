extends Control

@export var load_workspace_manager: LoadWorkspaceManager
@export var profiles_hflow: HFlowContainer
@export var profile_option: PackedScene
@export var fighter_profiles: FighterProfiles

func _ready() -> void:
	init_profile_selection()

func init_profile_selection() -> void:
	for option: ProfileOption in profiles_hflow.get_children():
		option.queue_free()
	
	visible = true
	
	for id: int in fighter_profiles.profiles.keys():
		var profile: FighterProfile = fighter_profiles.profiles[id]
		var profile_option_instance: ProfileOption = profile_option.instantiate()
		profile_option_instance.init_fighter_option(profile, self, id)
		profiles_hflow.add_child(profile_option_instance)

func choose_fighter(profile: FighterProfile, id: int) -> void:
	load_workspace_manager.init_workspace(profile.workspace_data, id)
	visible = false
