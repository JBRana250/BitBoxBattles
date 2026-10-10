extends ActionCompositeGraphNode

@export var amount_progbar: ProgressBar

func process_action() -> Action:
	var contact_damage_increase_action: ContactDamageIncreaseAction = ContactDamageIncreaseAction.new()
	contact_damage_increase_action.amount = int(amount_progbar.value)
	contact_damage_increase_action.conditions = get_conditions()
	return contact_damage_increase_action
