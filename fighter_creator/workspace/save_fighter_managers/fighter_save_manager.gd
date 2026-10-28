class_name FighterSaveManager extends Node

var existing_fighter_id = -1
var fighter: BaseCompositeGraphNode
@export var fighter_profiles: FighterProfiles
@export var profile_selection: Control

func save_fighter() -> void:
	var base_stats: Dictionary = fighter.base_stats_node.get_base_stats()
	var setup: Dictionary = await fighter.setup_node.get_fighter_setup()
	var sprites: Dictionary = await fighter.base_sprites_node.get_fighter_sprites()
	var abilities: Array[Event] = fighter.abilities_node.get_abilities()
	var workspace_data: NodeResource = fighter.get_node_resource()
	
	var init_resource: FighterInitResource = FighterInitResource.new()
	init_resource.fighter_id = base_stats.fighter_id
	init_resource.fighter_mass = base_stats.mass
	init_resource.starting_force = base_stats.starting_force
	init_resource.setup_anim_type = setup.setup_anim_type
	
	var health_resource: FighterHealthResource = FighterHealthResource.new()
	health_resource.max_health = base_stats.health
	
	var contact_resource: FighterContactResource = FighterContactResource.new()
	contact_resource.contact_damage = base_stats.contact_damage
	contact_resource.contact_cooldown = base_stats.contact_cooldown
	contact_resource.contact_knockback = base_stats.contact_knockback
	
	var texture_resource: FighterTextureResource = FighterTextureResource.new()
	texture_resource.active_image = sprites.active
	texture_resource.inactive_image = sprites.inactive
	texture_resource.setup_image = setup.setup_image
	
	var action_resource: FighterActionResource = FighterActionResource.new()
	action_resource.action_events = abilities
	
	var fighter_profile: FighterProfile = FighterProfile.new()
	fighter_profile.init_resource = init_resource
	fighter_profile.health_resource = health_resource
	fighter_profile.contact_resource = contact_resource
	fighter_profile.texture_resource = texture_resource
	fighter_profile.action_resource = action_resource
	fighter_profile.workspace_data = workspace_data
	
	if existing_fighter_id == -1: # New Fighter
		fighter_profiles.add_new_profile(fighter_profile)
		
	else: #existing fighter
		fighter_profiles.modify_existing_profile(existing_fighter_id, fighter_profile)
	
	ResourceSaver.save(fighter_profiles, "user://fighter_profiles.tres")
	profile_selection.init_profile_selection()
