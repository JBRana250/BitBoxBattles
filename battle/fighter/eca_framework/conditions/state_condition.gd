class_name StateCondition extends Condition

@export var accepted_states: Array[FighterStateMachine.State]

func is_met(context: Dictionary = {}) -> bool:
	if not context.has("actor"):
		return false
	
	var fighter := context.get("actor") as Fighter
	var state := fighter.get_state() as FighterStateMachine.State
	
	if (state in accepted_states):
		return true
	else:
		return false
