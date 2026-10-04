extends HBoxContainer

func _ready() -> void:
	BattleEventBus.victory.connect(on_victory)

func on_victory() -> void:
	visible = true
