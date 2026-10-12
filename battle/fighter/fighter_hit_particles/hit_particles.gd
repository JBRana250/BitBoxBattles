class_name HitParticles extends GPUParticles2D

func init_particles(_texture: Texture, intensity: int) -> void:
	amount = intensity
	process_material.set_shader_parameter("emitter_size", intensity/7.0)
	process_material.set_shader_parameter("sprite", _texture)
	emitting = true

func _on_finished() -> void:
	queue_free()
