class_name ImportPopupMenu extends Control

@export var title_label: Label
@export var viewport_container: SubViewportContainer
@export var x_resolution_progbar: DraggableProgressBar
@export var y_resolution_progbar: DraggableProgressBar
@export var x_offset_progbar: DraggableProgressBar
@export var y_offset_progbar: DraggableProgressBar
@export var scale_progbar: DraggableProgressBar
@export var imported_image: DraggableImportImage
@export var file_dialog: FileDialog
var importer: ImageImporter
var resolution: Vector2
var center: Vector2:
	get:
		return (resolution - imported_image.size) / 2.0

func _ready() -> void:
	resolution = Vector2(x_resolution_progbar.value, y_resolution_progbar.value)
	update_resolution()

func open_menu(_importer: Importer) -> void:
	self.importer = _importer as ImageImporter
	title_label.text = "Import " + importer.label_text + " Image"
	visible = true

func _on_save_button_pressed() -> void:
	visible = false

func _on_x_resolution_value_changed(new_value: float) -> void:
	resolution.x = new_value
	update_resolution()

func _on_y_resolution_value_changed(new_value: Variant) -> void:
	resolution.y = new_value
	update_resolution()

func _on_x_offset_value_changed(new_value: float) -> void:
	imported_image.position.x = new_value + center.x

func _on_y_offset_value_changed(new_value: float) -> void:
	imported_image.position.y = new_value + center.y 

func _on_scale_value_changed(new_scale: float) -> void:
	imported_image.scale_image(Vector2(new_scale, new_scale))

func _on_image_position_changed() -> void:
	x_offset_progbar.value = imported_image.position.x - center.x
	y_offset_progbar.value = imported_image.position.y - center.y

func _on_image_scale_changed() -> void:
	scale_progbar.value = imported_image.scale.x

func _on_import_button_pressed() -> void:
	file_dialog.visible = true

func _on_reset_position_button_pressed() -> void:
	imported_image.position = center
	x_offset_progbar.value = 0.0
	y_offset_progbar.value = 0.0

func update_resolution() -> void:
	viewport_container.custom_minimum_size = resolution
