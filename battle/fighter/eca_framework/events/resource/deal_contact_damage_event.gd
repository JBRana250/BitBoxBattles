class_name DealContactDamageEvent extends Event

#@export var actions: Array[Action] = []

func trigger(context: Dictionary = {}) -> void:
	for action in actions:
		if action:
			action.execute(context)
