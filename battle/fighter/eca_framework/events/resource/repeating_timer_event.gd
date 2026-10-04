class_name RepeatingTimerEvent extends Event

@export var time: float
@export var actions: Array[FighterAction] = []

func trigger(context: Dictionary = {}) -> void:
	for action in actions:
		if action:
			action.execute(context)
