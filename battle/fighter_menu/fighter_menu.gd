extends Control

@export var fighter_options_hflow: HFlowContainer
@export var fighter_option_scene: PackedScene
@export var fighter_profiles: FighterProfiles

var current_fighter: TextureButton

func open_fighter_menu(fighter: TextureButton) -> void:
	clear_options()
	current_fighter = fighter
	for profile: FighterProfile in fighter_profiles.profiles:
		instance_fighter_profile_as_option(profile)
	visible = true

func instance_fighter_profile_as_option(profile: FighterProfile) -> void:
	var instance: PanelContainer = fighter_option_scene.instantiate()
	instance.init_fighter_option(profile, current_fighter, self)
	fighter_options_hflow.add_child(instance)

func clear_options() -> void:
	for child: Node in fighter_options_hflow.get_children():
		child.queue_free()
