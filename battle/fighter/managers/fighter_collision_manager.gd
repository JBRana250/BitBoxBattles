extends Node

@export_group("References")
@export var scale_distortion_manager: ScaleDistortionManager
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager

var is_squishing: bool

func _on_fighter_body_entered(body: Node) -> void:
	scale_distortion_manager.add_impact_squash(owner.linear_velocity.length(), is_horizontal(owner.linear_velocity))
	if !body.is_in_group("fighter"):
		return
	if owner.get_state() != FighterStateMachine.State.ACTIVE:
		return
	body = body as Fighter
	body.take_damage(owner.contact_damage)
	owner.hit_enemy()
	BattleEventBus.fighter_damaged.emit(owner.fighter_id)

func is_horizontal(vec: Vector2) -> bool:
	if abs(vec.x) > abs(vec.y):
		return true
	else:
		return false
