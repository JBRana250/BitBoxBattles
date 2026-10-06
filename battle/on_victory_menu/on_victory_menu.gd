extends HBoxContainer

func _ready() -> void:
	BattleEventBus.victory.connect(on_victory)
	BattleEventBus.start_battle.connect(on_start)

func on_start(_fighter_one_profile: FighterProfile, _fighter_two_profile: FighterProfile) -> void:
	visible = false

func on_victory() -> void:
	visible = true
