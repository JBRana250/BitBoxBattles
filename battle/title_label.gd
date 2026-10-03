extends Label

@onready var initial_fighters = ["Fighter 1", "Fighter 2"]
@onready var fighters = ["Fighter 1", "Fighter 2"]

func _ready() -> void:
	BattleEventBus.fighter_death.connect(on_fighter_death)
	BattleEventBus.start_battle.connect(on_start_battle)

func on_fighter_death(fighter_id: String) -> void:
	fighters.erase(fighter_id)
	if fighters.size() == 1:
		var winner_id = fighters.front()
		text = winner_id + " Wins!"
		BattleEventBus.victory.emit()
		return
	if fighters.size() == 0:
		text = "It's a tie!"
		BattleEventBus.victory.emit()
		return

func on_start_battle() -> void:
	text = "Battle"
	fighters = initial_fighters
