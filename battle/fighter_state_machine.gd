class_name FighterStateMachine extends Node

@export var fighter: Fighter
@export var inactive_timer: Timer

enum State {
	ACTIVE,
	INACTIVE,
	CONTACT_COOLDOWN
}

@export var current_state: State

@export var sprite: Sprite2D
@export var colshape: CollisionShape2D

func _ready() -> void:
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
	set_fighter_scale(1)

func set_fighter_inactive() -> void:
	current_state = State.INACTIVE
	set_fighter_scale(0.85)

func set_fighter_scale(scale: float) -> void:
	var scale_v2 = Vector2(scale, scale)
	sprite.scale = scale_v2
	colshape.scale = scale_v2

func _on_inactive_timer_timeout() -> void:
	set_fighter_active()
