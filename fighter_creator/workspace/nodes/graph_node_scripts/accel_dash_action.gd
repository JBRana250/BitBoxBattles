extends ActionCompositeGraphNode

@export var force_progbar: ProgressBar

func process_action() -> Action:
	var accel_dash_action: AccelDashAction = AccelDashAction.new()
	accel_dash_action.accel_dash_force = force_progbar.value
	accel_dash_action.conditions = get_conditions()
	return accel_dash_action
