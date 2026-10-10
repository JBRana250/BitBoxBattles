class_name RepeatingTimerEvent extends Event

#@export var actions: Array[Action] = []
@export var time: float

func trigger(context: Dictionary = {}) -> void:
	for action in actions:
		if action:
			action.execute(context)
