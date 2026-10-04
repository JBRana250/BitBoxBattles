@abstract class_name FighterAction extends Resource

@export var conditions: Array[Condition] = []

# requires the actor to be a fighter in context
func execute(context: Dictionary = {}) -> void:
	var _actor := context.get("actor") as Fighter
	if !(pass_conditions(context)):
		return
	# execute action

func pass_conditions(context: Dictionary = {}) -> bool:
	for condition in conditions:
		if condition and not condition.is_met(context):
			#Condition failed! Cancel execution.
			return false
	return true
