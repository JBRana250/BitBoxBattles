extends RigidBody2D

func _ready() -> void:
	apply_force(global_transform.x * 500)
