class_name FighterStateMachine extends Node

@export var fighter: Fighter
@export var active_timer: Timer
@export var inactive_timer: Timer

enum State {
	ACTIVE,
	INACTIVE
}

@export var current_state: State

@export var sprite: Sprite2D
@export var colshape: CollisionShape2D

func _ready() -> void:
	set_fighter_inactive()

func get_state() -> State:
	return current_state

func _on_active_timer_timeout() -> void:
	switch_state()
	inactive_timer.start(randf_range(0.1, 1))

func _on_inactive_timer_timeout() -> void:
	switch_state()
	active_timer.start(randf_range(0.1, 1))

func switch_state() -> void:
	if current_state == State.ACTIVE:
		current_state = State.INACTIVE
		set_fighter_inactive()
	else:
		current_state = State.ACTIVE
		set_fighter_active()

func set_fighter_active() -> void:
	set_fighter_scale(1)

func set_fighter_inactive() -> void:
	set_fighter_scale(0.85)

func set_fighter_scale(scale: float) -> void:
	var scale_v2 = Vector2(scale, scale)
	sprite.scale = scale_v2
	colshape.scale = scale_v2
