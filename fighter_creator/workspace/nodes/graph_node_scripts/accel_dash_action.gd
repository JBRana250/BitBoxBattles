extends ActionCompositeGraphNode

@export var force_progbar: DraggableProgressBar

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	force_progbar.value = properties.force

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {
		"force": force_progbar.value
	}

# Override
# Obtains the battle-ready Action for the actual Fighter
func process_action() -> Action:
	var accel_dash_action: AccelDashAction = AccelDashAction.new()
	accel_dash_action.accel_dash_force = force_progbar.value
	accel_dash_action.conditions = get_conditions()
	return accel_dash_action
