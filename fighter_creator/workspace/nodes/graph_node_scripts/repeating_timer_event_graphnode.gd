extends EventCompositeGraphNode

@export var time_progbar: ProgressBar

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	time_progbar.value = properties.time

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {
		"time": time_progbar.value
	}

# Override
# Obtains the battle-ready Event for the actual Fighter
func process_event() -> Event:
	var repeating_timer_event: RepeatingTimerEvent = RepeatingTimerEvent.new()
	repeating_timer_event.time = time_progbar.value
	repeating_timer_event.actions = get_actions()
	return repeating_timer_event
