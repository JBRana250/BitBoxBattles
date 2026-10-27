class_name FighterSetupNode extends BaseCompositeGraphNode

@export var setup_import_image_manager: ImportImageManager
@export var setup_anim_type_menu_button: MenuButton

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	setup_import_image_manager.set_sprite(properties.setup_texture, 
	properties.setup_position, properties.setup_scale)
	setup_anim_type_menu_button.set_checked_item(properties.setup_anim_type)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var properties: Dictionary = setup_import_image_manager.get_properties()
	return {
		"setup_texture": properties.texture,
		"setup_position": properties.position,
		"setup_scale": properties.scale,
		"setup_anim_type": setup_anim_type_menu_button.get_anim_type()
	}

func get_fighter_setup() -> Dictionary:
	return {
		"setup_image": await setup_import_image_manager.get_sprite(),
		"setup_anim_type": setup_anim_type_menu_button.get_anim_type()
	}
