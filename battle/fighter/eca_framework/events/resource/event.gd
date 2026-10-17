@abstract class_name Event extends Resource

@export var actions: Array[Action] = []

# trigger all actions
func trigger(_context: Dictionary = {}) -> void:
	pass

# instance event scene
func instance_event(_owner: Fighter, _event_manager: FighterEventManager) -> void:
	pass
