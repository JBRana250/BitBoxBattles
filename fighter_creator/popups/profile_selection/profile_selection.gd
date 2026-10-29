extends Control

@export var load_workspace_manager: LoadWorkspaceManager
@export var profiles_hflow: HFlowContainer
@export var profile_option: PackedScene
@export var fighter_profiles: FighterProfiles
@export var reload_profiles_button: Button

func _ready() -> void:
	init_profile_selection()

func init_profile_selection() -> void:
	reload()
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

func reload() -> void:
	reload_profiles_button.disabled = true 
	# Run the saving logic on a separate background thread
	var task_id = WorkerThreadPool.add_task(_reload_profiles_async)
	WorkerThreadPool.wait_for_task_completion(task_id)
	_on_reload_complete()

func _on_reload_complete() -> void:
	reload_profiles_button.disabled = false

func _reload_profiles_async() -> void:
	var new_profiles: FighterProfiles = load_user_profiles()
	if !new_profiles:
		return
	fighter_profiles.next_id = new_profiles.next_id
	fighter_profiles.profiles = new_profiles.profiles

func load_user_profiles() -> FighterProfiles:
	var path = "user://fighter_profiles.tres"
	if ResourceLoader.exists(path):
		var profiles = ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		return profiles
	return null
