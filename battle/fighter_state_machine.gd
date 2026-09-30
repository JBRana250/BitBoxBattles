class_name FighterStateMachine extends Node

@export var fighter: Fighter
@export var active_timer: Timer
@export var inactive_timer: Timer
@export var contact_cooldown_timer: Timer

enum State {
	ACTIVE,
	INACTIVE,
	CONTACT_COOLDOWN
}

@export var current_state: State

@export var sprite: Sprite2D
@export var colshape: CollisionShape2D

func _ready() -> void:
	set_fighter_inactive()

func get_state() -> State:
	return current_state

func set_state_contact_cooldown(time: float) -> void:
	active_timer.stop()
	inactive_timer.stop()
	contact_cooldown_timer.stop()
	print_debug(time)
	contact_cooldown_timer.start(time)
	set_fighter_contact_cooldown()

func switch_state() -> void:
	if current_state == State.ACTIVE:
		set_fighter_inactive()
	else:
		set_fighter_active()

func set_fighter_active() -> void:
	current_state = State.ACTIVE
	set_fighter_scale(1)

func set_fighter_inactive() -> void:
	current_state = State.INACTIVE
	set_fighter_scale(0.85)

func set_fighter_contact_cooldown() -> void:
	current_state = State.CONTACT_COOLDOWN
	set_fighter_scale(0.7)

func set_fighter_scale(scale: float) -> void:
	var scale_v2 = Vector2(scale, scale)
	sprite.scale = scale_v2
	colshape.scale = scale_v2

func _on_active_timer_timeout() -> void:
	switch_state()
	inactive_timer.start(randf_range(0.1, 1))

func _on_inactive_timer_timeout() -> void:
	switch_state()
	active_timer.start(randf_range(0.1, 1))
	
func _on_contact_cooldown_timer_timeout() -> void:
	print_debug("back to active")
	set_fighter_active()
	active_timer.start(randf_range(0.1, 1))
