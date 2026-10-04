extends Node

@export_group("References")
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager

func _on_fighter_body_entered(body: Node) -> void:
	if !body.is_in_group("fighter"):
		return
	if owner.get_state() != FighterStateMachine.State.ACTIVE:
		return
	body = body as Fighter
	body.take_damage(owner.contact_damage)
	owner.hit_enemy()
	BattleEventBus.fighter_damaged.emit(owner.fighter_id)
