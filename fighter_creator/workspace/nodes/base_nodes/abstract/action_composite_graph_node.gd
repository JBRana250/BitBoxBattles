@abstract class_name ActionCompositeGraphNode extends CompositeGraphNode

func process_action() -> Action:
	return null

func get_conditions() -> Array[Condition]:
	var conditions: Array[Condition] = []
	for condition_node: ConditionCompositeGraphNode in output_nodes:
		conditions.append(condition_node.process_condition())
	return conditions
