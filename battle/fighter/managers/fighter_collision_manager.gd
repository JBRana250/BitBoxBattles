extends Node

@export_group("References")
@export var scale_distortion_manager: ScaleDistortionManager
@export var particles_manager: ParticlesManager
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager

var is_squishing: bool

func _on_fighter_body_entered(body: Node) -> void:
	scale_distortion_manager.add_impact_squash(owner.linear_velocity.length(), is_horizontal(owner.linear_velocity))
	
	if !body.is_in_group("fighter"):
		AudioManager.sfx_player.play_collision()
		particles_manager.spawn_collision_particles()
		return
	if owner.get_state() != FighterStateMachine.State.ACTIVE:
		AudioManager.sfx_player.play_collision()
		particles_manager.spawn_collision_particles()
		return
		
	body = body as Fighter
	var dmg: int = randi_range(owner.contact_damage - owner.contact_damage/2,
	 owner.contact_damage + owner.contact_damage/2)
	
	body.take_damage(dmg)
	owner.hit_enemy()
	BattleEventBus.fighter_damaged.emit(owner.fighter_id)
	particles_manager.spawn_hit_particles(dmg)

func is_horizontal(vec: Vector2) -> bool:
	if abs(vec.x) > abs(vec.y):
		return true
	else:
		return false
