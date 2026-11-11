class_name FighterSaveManager extends Node

var existing_fighter_id = -1
var fighter: BaseCompositeGraphNode
@export var profile_selection: Control

@onready var fighter_profiles = UserData.get_profiles()

func save_fighter() -> void:
	var base_stats: Dictionary = fighter.base_stats_node.get_base_stats()
	var setup: Dictionary = await fighter.setup_node.get_fighter_setup()
	var sprites: Dictionary = await fighter.base_sprites_node.get_fighter_sprites()
	var abilities: Array[Event] = fighter.abilities_node.get_abilities()
	var workspace_data: NodeResource = fighter.get_node_resource()
	
	# TEMP
	setup.setup_image_id = 0
	sprites.active_image_id = 0
	sprites.inactive_image_id = 0
	
	var profile_data: Dictionary = base_stats.merged(setup).merged(sprites)
	profile_data.action_events = abilities
	profile_data.workspace_data = workspace_data
	
	var fighter_profile: FighterProfile = FighterProfile.new(profile_data)
	
	if existing_fighter_id == -1: # New Fighter
		fighter_profiles.add_new_profile(fighter_profile)
	
	else: #existing fighter
		fighter_profiles.modify_existing_profile(existing_fighter_id, fighter_profile)
	
	profile_selection.init_profile_selection()
