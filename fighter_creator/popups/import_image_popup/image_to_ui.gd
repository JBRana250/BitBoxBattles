extends Node

@export var data_manager: ImportImageDataManager
@export var imported_image: DraggableImportImage
@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar
@export var scale_progbar: DraggableProgressBar

func _on_image_position_changed() -> void:
	x_offset_progbar.value = imported_image.position.x - data_manager.center.x
	y_offset_progbar.value = imported_image.position.y - data_manager.center.y

func _on_image_scale_changed() -> void:
	scale_progbar.value = imported_image.scale.x
