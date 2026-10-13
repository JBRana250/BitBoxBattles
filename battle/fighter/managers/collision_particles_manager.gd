class_name ParticlesManager extends Node2D

@export var fighter: Fighter
@export var hit_particles: PackedScene
@export var hit_spark: PackedScene
@export var hit_spark2: PackedScene
@export var wall_texture: Texture

@export var spark_one_factor: float = 0.025
@export var spark_two_factor: float = 0.015

func spawn_collision_particles() -> void:
	var state: PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(fighter.get_rid())
	var col_point: Vector2 = state.get_contact_collider_position(0)
	
	var particles_instance: HitParticles = hit_particles.instantiate()
	particles_instance.global_position = col_point
	particles_instance.init_particles(wall_texture, 50)
	fighter.particles.add_child(particles_instance)

func spawn_hit_particles(intensity: float) -> void:
	var state: PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(fighter.get_rid())
	var col_point: Vector2 = state.get_contact_collider_position(0)
	
	var rand_num = randi_range(0, 1)
		
	var particles_instance: AnimatedSprite2D = null
	if (rand_num == 1):
		particles_instance = hit_spark.instantiate()
		var adjusted_intensity = spark_one_factor * intensity
		particles_instance.init_particles(Vector2(adjusted_intensity, adjusted_intensity))
	else:
		particles_instance = hit_spark2.instantiate()
		var adjusted_intensity = spark_two_factor * intensity
		particles_instance.init_particles(Vector2(adjusted_intensity, adjusted_intensity))
	
	particles_instance.global_position = col_point
	fighter.particles.add_child(particles_instance)
