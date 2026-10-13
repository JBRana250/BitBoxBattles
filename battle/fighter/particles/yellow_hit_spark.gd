extends AnimatedSprite2D

func init_particles(scale_factor: Vector2) -> void:
	scale = scale_factor
	play("default")

func _on_animation_finished() -> void:
	queue_free()
