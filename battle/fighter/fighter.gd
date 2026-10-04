class_name Fighter extends RigidBody2D

@export_group("References")
@export var sprite: Sprite2D
@export var onhit_timer: Timer
@export var fighter_state_machine: FighterStateMachine
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager
@export var fighter_dash_manager: FighterDashManager
@export var fighter_manager: FighterManager

@export_group("Properties")
@export var onhit_modulate: Color
@onready var default_modulate: Color = Color(1,1,1,1)
@export var current_health: int
@export var contact_damage: int
@export var contact_cooldown: float
@export var fighter_id: String 

func init_fighter(_fighter_manager: FighterManager, init_resource: FighterInitResource, 
health_resource: FighterHealthResource, contact_resource: FighterContactResource, 
texture_resource: FighterTextureResource, dash_resource: FighterDashResource) -> void:
	
	self.fighter_manager = _fighter_manager
	
	self.fighter_id = init_resource.fighter_id
	self.position = init_resource.position
	self.rotation = init_resource.rotation
	self.mass = init_resource.fighter_mass / 10
	
	self.current_health = health_resource.max_health
	
	self.contact_damage = contact_resource.contact_damage
	self.contact_cooldown = contact_resource.contact_cooldown
	
	
	fighter_sprite_manager.init_sprites(texture_resource.active_image, texture_resource.inactive_image)
	fighter_state_machine.init_states()
	fighter_health_manager.init_health(health_resource.max_health)
	fighter_dash_manager.init_dash(dash_resource)
	
	apply_force(global_transform.x * init_resource.starting_force)

func get_state():
	return fighter_state_machine.get_state()

func hit_enemy():
	fighter_state_machine.on_hit(contact_cooldown)

func take_damage(amount: int):
	fighter_health_manager.reduce_health(amount)
	fighter_sprite_manager.onhit_flash()
