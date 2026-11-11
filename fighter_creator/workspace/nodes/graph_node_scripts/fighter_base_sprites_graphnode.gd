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
	active_importer.init_from_id(properties.active_id)
	inactive_importer.init_from_id(properties.inactive_id)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var active_id = StaticTextures.ID.GODOT
	var inactive_id = StaticTextures.ID.GODOT
	if active_importer.id != null:
		active_id = active_importer.id
	if inactive_importer.id != null:
		inactive_id = inactive_importer.id
	
	return {
		"active_id": active_id,
		"inactive_id": inactive_id
	}

func get_fighter_sprites() -> Dictionary:
	return get_properties()
