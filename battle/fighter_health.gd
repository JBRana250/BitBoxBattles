extends Label

@export var fighter: RigidBody2D

func update_text() -> void:
	text = str(fighter.current_health)
