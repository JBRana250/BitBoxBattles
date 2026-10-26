class_name FighterAbilitiesNode extends BaseCompositeGraphNode

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

func get_abilities() -> Array[Event]:
	var events: Array[Event] = []
	for event_node: EventCompositeGraphNode in output_nodes.values():
		events.append(event_node.process_event())
	return events
