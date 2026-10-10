extends ConditionCompositeGraphNode

func process_condition() -> Condition:
	var state_condition: StateCondition = StateCondition.new()
	state_condition.accepted_states = get_states()
	return state_condition

func get_states() -> Array[FighterStateMachine.State]:
	var accepted_states: Array[FighterStateMachine.State] = []
	for output_node: StateGraphNode in output_nodes:
		accepted_states.append(output_node.state)
	return accepted_states
