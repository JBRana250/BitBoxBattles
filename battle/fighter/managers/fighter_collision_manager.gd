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
		
	var fighter: Fighter = body as Fighter
	var dmg: int = randi_range(owner.contact_damage - owner.contact_damage/2,
	 owner.contact_damage + owner.contact_damage/2)
	
	fighter.take_damage(dmg)
	apply_knockback_force(fighter, owner.contact_knockback)
	owner.hit_enemy()
	BattleEventBus.fighter_damaged.emit(owner.fighter_id)
	particles_manager.spawn_hit_particles(dmg)

func apply_knockback_force(fighter: Fighter, amount: float) -> void:
	var direction: Vector2 = (fighter.global_position - owner.global_position).normalized()
	var force: Vector2 = direction * amount
	fighter.apply_external_force(force)

func is_horizontal(vec: Vector2) -> bool:
	if abs(vec.x) > abs(vec.y):
		return true
	else:
		return false
