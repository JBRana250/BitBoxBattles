@abstract class_name EventCompositeGraphNode extends CompositeGraphNode

func process_event() -> Event:
	return null

func get_actions() -> Array[Action]:
	var actions: Array[Action] = []
	for action_node: ActionCompositeGraphNode in output_nodes:
		actions.append(action_node.process_action())
	return actions
