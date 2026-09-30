extends Label

@export var fighter: RigidBody2D
@export var fighter_id: String

func _ready() -> void:
	BattleEventBus.fighter_damaged.connect(on_fighter_damaged)
	update_text()

func on_fighter_damaged(hit_fighter_id: String) -> void:
	if fighter_id != hit_fighter_id:
		return
	update_text()

func update_text() -> void:
	text = fighter_id + " Health: " + str(fighter.current_health)
