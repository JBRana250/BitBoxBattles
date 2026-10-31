class_name FighterBaseStatsNode extends BaseCompositeGraphNode

@export var fighter_id_line_edit: LineEdit
@export var health_bar: DraggableProgressBar
@export var contact_damage_bar: DraggableProgressBar
@export var contact_cooldown_bar: DraggableProgressBar
@export var contact_knockback_bar: DraggableProgressBar
@export var mass_bar: DraggableProgressBar
@export var starting_force_bar: DraggableProgressBar

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	fighter_id_line_edit.text = properties.fighter_id
	health_bar.value = properties.health
	contact_damage_bar.value = properties.contact_damage
	contact_cooldown_bar.value = properties.contact_cooldown
	contact_knockback_bar.value = properties.contact_knockback
	mass_bar.value = properties.mass
	starting_force_bar.value = properties.starting_force

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return get_base_stats()

func get_base_stats() -> Dictionary:
	var base_stats: Dictionary = {}
	base_stats.fighter_id = fighter_id_line_edit.text
	base_stats.health = health_bar.value
	base_stats.contact_damage = contact_damage_bar.value
	base_stats.contact_cooldown = contact_cooldown_bar.value
	base_stats.contact_knockback = contact_knockback_bar.value
	base_stats.mass = mass_bar.value
	base_stats.starting_force = starting_force_bar.value
	return base_stats
