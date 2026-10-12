class_name ParticlesManager extends Node2D

@export var raycast: RayCast2D
@export var fighter: Fighter
@export var hit_particles: PackedScene
@export var wall_texture: Texture

func spawn_collision_particles(colliding_body: Node) -> void:
	raycast.target_position = to_local(colliding_body.global_position)
	raycast.force_raycast_update()
	
	if !raycast.is_colliding():
		print_debug("no raycast col")
		return
	
	var col_point: Vector2 = raycast.get_collision_point()
	var particles_instance: HitParticles = hit_particles.instantiate()
	particles_instance.global_position = col_point
	init_based_on_col_type(colliding_body, particles_instance)
	fighter.particles.add_child(particles_instance)

func init_based_on_col_type(colliding_body: Node, particles: HitParticles) -> void:
	if (colliding_body.is_in_group("fighter")):
		var texture: Texture = colliding_body.sprite.texture
		particles.init_particles(texture, 35)
	else:
		particles.init_particles(wall_texture, 35)
