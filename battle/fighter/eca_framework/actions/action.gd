@abstract class_name Action extends Resource

@export var conditions: Array[Condition] = []

func execute(context: Dictionary = {}) -> void:
	#Evaluate all conditions before running action logic
	if !(pass_conditions(context)):
		return
	# execute action

func pass_conditions(context: Dictionary = {}) -> bool:
	for condition in conditions:
		if condition and not condition.is_met(context):
			#Condition failed! Cancel execution.
			return false
	return true
