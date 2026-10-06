extends Node

@export var active_import_image_manager: Node
@export var inactive_import_image_manager: Node

func get_fighter_sprites() -> Dictionary:
	var fighter_sprites: Dictionary = {}
	
	var active_sprite: ImageTexture = await active_import_image_manager.get_sprite()
	var inactive_sprite: ImageTexture = await inactive_import_image_manager.get_sprite()
	fighter_sprites["active"] = active_sprite
	fighter_sprites["inactive"] = inactive_sprite
	
	return fighter_sprites
