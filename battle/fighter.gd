extends RigidBody2D

@export var sprite: Sprite2D
@export var onhit_timer: Timer
@export var onhit_modulate: Color
@onready var default_modulate: Color = Color(1,1,1,1)

func _ready() -> void:
	apply_force(global_transform.x * 500)

func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("fighter"):
		return
	sprite.modulate = onhit_modulate
	onhit_timer.start()

func _on_onhit_flash_timeout() -> void:
	sprite.modulate = default_modulate
