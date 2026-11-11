class_name FighterBaseSpritesNode extends BaseCompositeGraphNode

@export var active_importer: ImageImporter
@export var inactive_importer: ImageImporter
@export var default_image: Texture

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	active_importer.init_from_properties(properties.active_properties)
	inactive_importer.init_from_properties(properties.inactive_properties)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var active_properties: Dictionary = active_importer.properties
	var inactive_properties: Dictionary = inactive_importer.properties
	return {
		"active_properties": active_properties,
		"inactive_properties": inactive_properties
	}

func get_fighter_sprites() -> Dictionary:
	var active_sprite = default_image
	var inactive_sprite = default_image
	if not active_importer.properties.is_empty():
		active_sprite = active_importer.properties.thumbnail
	if not inactive_importer.properties.is_empty():
		inactive_sprite = inactive_importer.properties.thumbnail
	
	return {
		"active_image": active_sprite,
		"inactive_image": inactive_sprite
	}
