class_name ParticlesManager extends Node2D

@export var fighter: Fighter
@export var hit_particles: PackedScene
@export var hit_spark: PackedScene
@export var hit_spark2: PackedScene
@export var wall_texture: Texture

func spawn_collision_particles(colliding_body: Node) -> void:
	var state: PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(fighter.get_rid())
	var col_point: Vector2 = state.get_contact_collider_position(0)
	
	init_based_on_col_type(colliding_body, col_point)

func init_based_on_col_type(colliding_body: Node, col_point: Vector2) -> void:
	if (colliding_body.is_in_group("fighter")):
		
		var rand_num = randi_range(0, 1)
		
		var particles_instance: AnimatedSprite2D = null
		if (rand_num == 1):
			particles_instance = hit_spark.instantiate()
			particles_instance.init_particles(Vector2(0.25, 0.25))
		else:
			particles_instance = hit_spark2.instantiate()
			particles_instance.init_particles(Vector2(0.15, 0.15))
		
		particles_instance.global_position = col_point
		fighter.particles.add_child(particles_instance)
		
	else:
		
		var particles_instance: HitParticles = hit_particles.instantiate()
		particles_instance.global_position = col_point
		particles_instance.init_particles(wall_texture, 50)
		fighter.particles.add_child(particles_instance)
