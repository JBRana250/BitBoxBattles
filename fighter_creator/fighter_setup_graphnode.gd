class_name FighterSetupNode extends BaseCompositeGraphNode

@export var setup_image_importer: ImageImporter
@export var setup_anim_type_menu_button: MenuButton
@export var default_image: Texture

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	setup_image_importer.init_from_ptr(TexturePointer.create_from_dict(properties.setup_ptr))
	setup_anim_type_menu_button.set_checked_item(properties.setup_anim_type)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var setup_ptr: TexturePointer
	if setup_image_importer.ptr != null:
		setup_ptr = setup_image_importer.ptr
	else:
		setup_ptr = TexturePointer.new(StaticTextures.ID.GODOT, TexturePointer.Type.STATIC)
	
	return {
		"setup_anim_type": setup_anim_type_menu_button.get_anim_type(),
		"setup_ptr": setup_ptr.to_dict()
	}

func get_fighter_setup() -> Dictionary:
	return get_properties()
