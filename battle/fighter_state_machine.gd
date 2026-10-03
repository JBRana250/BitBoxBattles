class_name FighterStateMachine extends Node

@export var fighter: Fighter
@export var inactive_timer: Timer
@export var fighter_sprite_manager: FighterSpriteManager

enum State {
	ACTIVE,
	INACTIVE,
	CONTACT_COOLDOWN
}

@export var current_state: State

@export var sprite: Sprite2D
@export var colshape: CollisionShape2D

func init_states() -> void:
	set_fighter_active()

func get_state() -> State:
	return current_state

func on_hit(time: float) -> void:
	inactive_timer.stop()
	inactive_timer.wait_time = time
	set_fighter_inactive()
	inactive_timer.start()

func set_fighter_active() -> void:
	current_state = State.ACTIVE
	fighter_sprite_manager.set_sprite_active()

func set_fighter_inactive() -> void:
	current_state = State.INACTIVE
	fighter_sprite_manager.set_sprite_inactive()

func set_fighter_scale(scale: float) -> void:
	var scale_v2 = Vector2(scale, scale)
	sprite.scale = scale_v2
	colshape.scale = scale_v2

func _on_inactive_timer_timeout() -> void:
	set_fighter_active()
