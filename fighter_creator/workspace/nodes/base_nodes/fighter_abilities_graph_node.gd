extends CompositeGraphNode

func get_events() -> Array[Event]:
	var events: Array[Event] = []
	for event_node: EventCompositeGraphNode in output_nodes:
		events.append(event_node.process_event())
	return events
