extends Node

@export var popup: ImportPopupMenu
@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar
@export var x_resolution_progbar: DraggableProgressBar
@export var y_resolution_progbar: DraggableProgressBar
@export var scale_progbar: DraggableProgressBar
@export var imported_image: DraggableImportImage
@export var data_manager: ImportImageDataManager
@export var default_texture: Texture

func reset_to_default() -> void:
	imported_image.texture = default_texture
	
	x_resolution_progbar.reset_to_default()
	y_resolution_progbar.reset_to_default()
	
	imported_image.scale = Vector2(2.35, 2.35)
	imported_image.scale_changed.emit()
	
	wrangle_position(data_manager.center)
	
	popup.visible = true

func load_previous(properties: Dictionary) -> void:
	imported_image.texture = properties.texture
	
	x_resolution_progbar.value = properties.resolution.x
	y_resolution_progbar.value = properties.resolution.y
	
	imported_image.scale = Vector2(properties.scale, properties.scale)
	imported_image.scale_changed.emit()
	
	wrangle_position(properties.position)
	
	popup.visible = true

func wrangle_position(target_pos: Vector2) -> void:
	for i in range(10):
		await get_tree().create_timer(0.05).timeout
		imported_image.position = target_pos
	imported_image.position_changed.emit()
