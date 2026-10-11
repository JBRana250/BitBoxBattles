extends Node

@export_group("References")
@export var scale_distortion_manager: ScaleDistortionManager
@export var fighter_sprite_manager: FighterSpriteManager
@export var fighter_health_manager: FighterHealthManager

var is_squishing: bool

func _on_fighter_body_entered(body: Node) -> void:
	if body.is_in_group("arena_wall"):
		_on_collide_arena_wall(body)
	if !body.is_in_group("fighter"):
		return
	if owner.get_state() != FighterStateMachine.State.ACTIVE:
		return
	body = body as Fighter
	body.take_damage(owner.contact_damage)
	owner.hit_enemy()
	BattleEventBus.fighter_damaged.emit(owner.fighter_id)

func _on_collide_arena_wall(wall: ArenaWall) -> void:
	var wall_type: ArenaWall.WallType = wall.wall_type
	
	match (wall_type):
		ArenaWall.WallType.VERTICAL:
			_on_collide_vertical_wall()
		ArenaWall.WallType.HORIZONTAL:
			_on_collide_horizontal_wall()

func _on_collide_vertical_wall() -> void:
	scale_distortion_manager.add_impact_squash(owner.linear_velocity.length(), true)

func _on_collide_horizontal_wall() -> void:
	scale_distortion_manager.add_impact_squash(owner.linear_velocity.length(), false)
