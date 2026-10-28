extends EventCompositeGraphNode

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {}

# Override
# Obtains the battle-ready Event for the actual Fighter
func process_event() -> Event:
	var deal_contact_damage_event: DealContactDamageEvent = DealContactDamageEvent.new()
	deal_contact_damage_event.actions = get_actions()
	return deal_contact_damage_event
