extends Node

@export var title_label: Label
@onready var fighters = ["Fighter 1", "Fighter 2"]

func _ready() -> void:
	BattleEventBus.fighter_death.connect(on_fighter_death)

func on_fighter_death(fighter_id: String) -> void:
	fighters.erase(fighter_id)
	if fighters.size() == 1:
		var winner_id = fighters.front()
		title_label.text = winner_id + " Wins!"
