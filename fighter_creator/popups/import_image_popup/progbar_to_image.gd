extends Node

@export var data_manager: ImportImageDataManager
@export var viewport_container: SubViewportContainer
@export var file_dialog: FileDialog
@export var imported_image: DraggableImportImage

@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar

func _on_x_resolution_value_changed(new_value: float) -> void:
	data_manager.resolution.x = new_value
	viewport_container.custom_minimum_size = data_manager.resolution

func _on_y_resolution_value_changed(new_value: Variant) -> void:
	data_manager.resolution.y = new_value
	viewport_container.custom_minimum_size = data_manager.resolution

func _on_x_offset_value_changed(new_value: float) -> void:
	imported_image.position.x = new_value + data_manager.center.x

func _on_y_offset_value_changed(new_value: float) -> void:
	imported_image.position.y = new_value + data_manager.center.y 

func _on_scale_value_changed(new_scale: float) -> void:
	imported_image.scale_image(Vector2(new_scale, new_scale))

func _on_import_button_pressed() -> void:
	file_dialog.visible = true

func _on_file_dialog_file_selected(path: String) -> void:
	var image: Image = Image.load_from_file(path)
	if (image):
		var _texture: Texture = ImageTexture.create_from_image(image)
		imported_image.texture = _texture

func _on_reset_position_button_pressed() -> void:
	imported_image.position = data_manager.center
	x_offset_progbar.value = 0.0
	y_offset_progbar.value = 0.0
