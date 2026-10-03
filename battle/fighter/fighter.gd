class_name Fighter extends RigidBody2D

@export_group("References")
@export var sprite: Sprite2D
@export var onhit_timer: Timer
@export var fighter_state_machine: FighterStateMachine
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager

@export_group("Properties")
@export var onhit_modulate: Color
@onready var default_modulate: Color = Color(1,1,1,1)
@export var current_health: int
@export var contact_damage: int
@export var contact_cooldown: float
@export var fighter_id: String 

@warning_ignore("shadowed_variable", "shadowed_variable_base_class")
func init_fighter(fighter_id: String, max_health: int, contact_damage: int, contact_cooldown: float, position: Vector2, rotation: float, active_image: Texture, inactive_image: Texture, starting_force: float, mass: float) -> void:
	self.fighter_id = fighter_id
	self.position = position
	self.rotation = rotation
	self.current_health = max_health
	self.contact_damage = contact_damage
	self.contact_cooldown = contact_cooldown
	self.mass = mass
	
	fighter_sprite_manager.init_sprites(active_image, inactive_image)
	fighter_state_machine.init_states()
	fighter_health_manager.init_health(max_health)
	
	apply_force(global_transform.x * starting_force)

func get_state():
	return fighter_state_machine.get_state()

func hit_enemy():
	fighter_state_machine.on_hit(contact_cooldown)

func take_damage(amount: int):
	fighter_health_manager.reduce_health(amount)
	fighter_sprite_manager.onhit_flash()
