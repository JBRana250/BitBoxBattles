extends Button

@export var base_stat_manager: Node
@export var fighter_sprite_manager: Node
@export var fighter_abilities_manager: Node

@export var fighter_profiles: FighterProfiles

func _on_pressed() -> void:
	var base_stats: Dictionary = base_stat_manager.get_base_stats()
	var sprites: Dictionary = await fighter_sprite_manager.get_fighter_sprites()
	var abilities: Array[Event] = fighter_abilities_manager.get_abilities()
	
	
	var init_resource: FighterInitResource = FighterInitResource.new()
	init_resource.fighter_id = base_stats.fighter_id
	init_resource.fighter_mass = base_stats.mass
	init_resource.starting_force = base_stats.starting_force
	
	var health_resource: FighterHealthResource = FighterHealthResource.new()
	health_resource.max_health = base_stats.health
	
	var contact_resource: FighterContactResource = FighterContactResource.new()
	contact_resource.contact_damage = base_stats.contact_damage
	contact_resource.contact_cooldown = base_stats.contact_cooldown
	
	var texture_resource: FighterTextureResource = FighterTextureResource.new()
	texture_resource.active_image = sprites.active
	texture_resource.inactive_image = sprites.inactive
	
	var action_resource: FighterActionResource = FighterActionResource.new()
	action_resource.action_events = abilities
	
	var fighter_profile: FighterProfile = FighterProfile.new()
	fighter_profile.init_resource = init_resource
	fighter_profile.health_resource = health_resource
	fighter_profile.contact_resource = contact_resource
	fighter_profile.texture_resource = texture_resource
	fighter_profile.action_resource = action_resource
	
	fighter_profiles.profiles.append(fighter_profile)
