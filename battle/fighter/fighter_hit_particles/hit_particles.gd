class_name HitParticles extends GPUParticles2D

@export var intensity_factor: float

func init_particles(_texture: Texture, intensity: int) -> void:
	amount = intensity
	process_material.set_shader_parameter("scale_factor", intensity / intensity_factor)
	process_material.set_shader_parameter("emitter_size", intensity)
	process_material.set_shader_parameter("sprite", _texture)
	emitting = true

func _on_finished() -> void:
	queue_free()
