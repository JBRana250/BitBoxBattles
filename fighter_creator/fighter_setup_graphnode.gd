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
	setup_image_importer.init_from_properties(properties.setup_image_properties)
	setup_anim_type_menu_button.set_checked_item(properties.setup_anim_type)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {
		"setup_image_properties": setup_image_importer.properties,
		"setup_anim_type": setup_anim_type_menu_button.get_anim_type()
	}

func get_fighter_setup() -> Dictionary:
	var setup_image = default_image 
	if not setup_image_importer.properties.is_empty():
		setup_image = setup_image_importer.properties.thumbnail
	
	return {
		"setup_anim_type": setup_anim_type_menu_button.get_anim_type(),
		"setup_image": setup_image
	}
