extends ActionCompositeGraphNode

@export var force_progbar: ProgressBar

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
	var fighter_dash_action: FighterDashAction = FighterDashAction.new()
	fighter_dash_action.fighter_dash_force = force_progbar.value
	fighter_dash_action.conditions = get_conditions()
	return fighter_dash_action
