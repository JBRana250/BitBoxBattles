class_name ImportImageSaveManager extends Node

@export var popup: ImportPopupMenu
@export var import_image_popup_menu: ImportPopupMenu
@export var imported_image: DraggableImportImage
@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar
@export var data_manager: ImportImageDataManager
@export var viewport: SubViewport

func get_sprite() -> ImageTexture:
	await RenderingServer.frame_post_draw
	var viewport_tex = viewport.get_texture()
	var img = viewport_tex.get_image()
	
	img.convert(Image.FORMAT_RGBA8)
	
	return ImageTexture.create_from_image(img)

func get_properties() -> Dictionary:
	return {
		"thumbnail": await get_sprite(),
		"texture": imported_image.texture,
		"position": imported_image.position,
		"scale": imported_image.scale.x,
		"resolution": data_manager.resolution
	}

func _on_save_button_pressed() -> void:
	var properties: Dictionary = await get_properties()
	popup.importer.recieve_imported_data(properties)
	popup.visible = false
