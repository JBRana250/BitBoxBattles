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
	active_importer.init_from_ptr(TexturePointer.create_from_dict(properties.active_ptr))
	inactive_importer.init_from_ptr(TexturePointer.create_from_dict(properties.inactive_ptr))

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var active_ptr: TexturePointer
	var inactive_ptr: TexturePointer
	if active_importer.ptr != null:
		active_ptr = active_importer.ptr
	else:
		active_ptr = TexturePointer.new()
	
	if inactive_importer.ptr != null:
		inactive_ptr = inactive_importer.ptr
	else:
		inactive_ptr = TexturePointer.new()
	
	return {
		"active_ptr": active_ptr.to_dict(),
		"inactive_ptr": inactive_ptr.to_dict()
	}

func get_fighter_sprites() -> Dictionary:
	return get_properties()
