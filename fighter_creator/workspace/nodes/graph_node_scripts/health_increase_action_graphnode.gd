extends ActionCompositeGraphNode

@export var amount_progbar: ProgressBar

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	amount_progbar.value = properties.amount

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {
		"amount": amount_progbar.value
	}

# Override
# Obtains the battle-ready Action for the actual Fighter
func process_action() -> Action:
	var health_increase_action: HealthIncreaseAction = HealthIncreaseAction.new()
	health_increase_action.amount = int(amount_progbar.value)
	health_increase_action.conditions = get_conditions()
	return health_increase_action
