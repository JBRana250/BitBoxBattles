extends Node

@export var popup: ImportPopupMenu
@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar
@export var x_resolution_progbar: DraggableProgressBar
@export var y_resolution_progbar: DraggableProgressBar
@export var scale_progbar: DraggableProgressBar

func reset_to_default() -> void:
	x_resolution_progbar.reset_to_default()
	y_resolution_progbar.reset_to_default()
	scale_progbar.reset_to_default()
	
	popup.visible = true

func load_previous(properties: Dictionary) -> void:
	x_resolution_progbar.value = properties.resolution.x
	y_resolution_progbar.value = properties.resolution.y
	
	scale_progbar.value = properties.scale
	x_offset_progbar.value = properties.position.x
	y_offset_progbar.value = properties.position.y
	popup.visible = true
