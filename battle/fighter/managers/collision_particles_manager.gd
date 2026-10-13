class_name ParticlesManager extends Node2D

@export var fighter: Fighter
@export var hit_particles: PackedScene
@export var wall_texture: Texture

func spawn_collision_particles(colliding_body: Node) -> void:
	var state: PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(fighter.get_rid())
	var col_point: Vector2 = state.get_contact_collider_position(0)
	
	var particles_instance: HitParticles = hit_particles.instantiate()
	particles_instance.global_position = col_point
	init_based_on_col_type(colliding_body, particles_instance)
	fighter.particles.add_child(particles_instance)

func init_based_on_col_type(colliding_body: Node, particles: HitParticles) -> void:
	if (colliding_body.is_in_group("fighter")):
		var texture: Texture = colliding_body.sprite.texture
		particles.init_particles(texture, 50)
	else:
		particles.init_particles(wall_texture, 50)
