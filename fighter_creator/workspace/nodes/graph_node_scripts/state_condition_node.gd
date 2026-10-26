extends ConditionCompositeGraphNode

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(_node_res: NodeResource) -> void:
	pass

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {}

# Override
# Obtains the battle-ready Condition for the actual fighter
func process_condition() -> Condition:
	var state_condition: StateCondition = StateCondition.new()
	state_condition.accepted_states = get_states()
	return state_condition

func get_states() -> Array[FighterStateMachine.State]:
	var accepted_states: Array[FighterStateMachine.State] = []
	for output_node: StateGraphNode in output_nodes.values():
		accepted_states.append(output_node.state)
	return accepted_states
