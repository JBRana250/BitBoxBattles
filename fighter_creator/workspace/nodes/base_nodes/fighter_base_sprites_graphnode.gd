class_name FighterBaseSpritesNode extends BaseCompositeGraphNode

@export var active_import_image_manager: ImportImageManager
@export var inactive_import_image_manager: ImportImageManager

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	
	active_import_image_manager.set_sprite(properties.active_texture, 
	properties.active_position, properties.active_scale)
	
	inactive_import_image_manager.set_sprite(properties.inactive_texture, 
	properties.inactive_position, properties.inactive_scale)

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	var active_properties: Dictionary = active_import_image_manager.get_properties()
	var inactive_properties: Dictionary = inactive_import_image_manager.get_properties()
	return {
		"active_texture": active_properties.texture,
		"active_position": active_properties.position,
		"active_scale": active_properties.scale,
		"inactive_texture": inactive_properties.texture,
		"inactive_position": inactive_properties.position,
		"inactive_scale": inactive_properties.scale
	}

func get_fighter_sprites() -> Dictionary:
	var fighter_sprites: Dictionary = {}
	
	var active_sprite: ImageTexture = await active_import_image_manager.get_sprite()
	var inactive_sprite: ImageTexture = await inactive_import_image_manager.get_sprite()
	fighter_sprites.active = active_sprite
	fighter_sprites.inactive = inactive_sprite
	
	return fighter_sprites
