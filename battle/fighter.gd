class_name Fighter extends RigidBody2D

@export_group("References")
@export var sprite: Sprite2D
@export var onhit_timer: Timer
@export var fighter_state_machine: FighterStateMachine
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_label: Label

@export_group("Properties")
@export var onhit_modulate: Color
@onready var default_modulate: Color = Color(1,1,1,1)
@export var current_health: int
@export var contact_damage: int
@export var contact_cooldown: float
@export var fighter_id: String 

func _ready() -> void:
	apply_force(global_transform.x * 500)

@warning_ignore("shadowed_variable", "shadowed_variable_base_class")
func init_fighter(fighter_id: String, current_health: int, contact_damage: int, contact_cooldown: float, position: Vector2, rotation: float, active_image: Texture, inactive_image: Texture) -> void:
	self.fighter_id = fighter_id
	self.position = position
	self.rotation = rotation
	self.current_health = 100
	self.contact_damage = contact_damage
	self.contact_cooldown = contact_cooldown
	
	fighter_sprite_manager.init_sprites(active_image, inactive_image)
	fighter_state_machine.init_states()
	fighter_health_label.update_text()
	

func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("fighter"):
		return
	if body.get_state() != FighterStateMachine.State.ACTIVE:
		return
	
	sprite.modulate = onhit_modulate
	current_health -= contact_damage
	fighter_health_label.update_text()
	body.hit_enemy()
	
	BattleEventBus.fighter_damaged.emit(fighter_id)
	if (current_health <= 0):
		BattleEventBus.fighter_death.emit(fighter_id)
		queue_free()
	onhit_timer.start()

func _on_onhit_flash_timeout() -> void:
	sprite.modulate = default_modulate

func get_state():
	return fighter_state_machine.get_state()

func hit_enemy():
	fighter_state_machine.on_hit(contact_cooldown)
