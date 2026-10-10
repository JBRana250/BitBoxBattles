extends ActionCompositeGraphNode

@export var force_progbar: ProgressBar

func process_action() -> Action:
	var fighter_dash_action: FighterDashAction = FighterDashAction.new()
	fighter_dash_action.fighter_dash_force = force_progbar.value
	fighter_dash_action.conditions = get_conditions()
	return fighter_dash_action
