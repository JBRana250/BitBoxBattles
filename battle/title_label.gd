extends Label

@onready var initial_fighters = ["Past Bot", "Future Bot"]
@onready var fighters = ["Past Bot", "Future Bot"]

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
	fighters = initial_fighters.duplicate()
	text = " vs ".join(fighters)
