extends Node2D

func _ready() -> void:
	BattleEventBus.clear_fighters.connect(clear_fighters)

func clear_fighters() -> void:
	for child: Node in get_children():
		child.queue_free()
