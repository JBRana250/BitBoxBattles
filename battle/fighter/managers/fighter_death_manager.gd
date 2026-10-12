extends Node

@export var fighter_sprite: Sprite2D
@export var death_particles: GPUParticles2D

func on_death() -> void:
	var tween: Tween = get_tree().create_tween()
	
	death_particles.process_material = death_particles.process_material.duplicate()
	var shader_material = (death_particles.process_material as ShaderMaterial)
	shader_material.set_shader_parameter("sprite", fighter_sprite.texture)
	death_particles.emitting = true
	
	tween.tween_property(fighter_sprite.material, "shader_parameter/progress", 1.0, 0.5)
