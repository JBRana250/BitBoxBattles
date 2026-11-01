class_name DraggableImportImage extends TextureRect

@export var import_image_popup: ImportPopupMenu
@export var min_scale: Vector2 = Vector2(0.5, 0.5)
@export var max_scale: Vector2 = Vector2(3.0, 3.0)
@export var zoom_speed: float = 0.25
var is_dragging = false

signal position_changed
signal scale_changed

func _gui_input(event):
	# Handle Dragging (Left Click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = event.pressed

		# Handle Zooming (Mouse Wheel)
		elif event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_image(1.0 + zoom_speed)
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_image(1.0 - zoom_speed)

	# Handle Mouse Motion while Dragging
	elif event is InputEventMouseMotion and is_dragging:
		position += event.relative * scale
		position_changed.emit()
	
	get_viewport().set_input_as_handled()

func _on_file_dialog_file_selected(path: String) -> void:
	var image: Image = Image.load_from_file(path)
	if (image):
		var _texture: Texture = ImageTexture.create_from_image(image)
		self.texture = _texture

func zoom_image(factor: float):
	var new_scale = scale * factor
	scale_image(new_scale)
	scale_changed.emit()

func scale_image(new_scale: Vector2):
	new_scale.x = clamp(new_scale.x, min_scale.x, max_scale.x)
	new_scale.y = clamp(new_scale.y, min_scale.y, max_scale.y)
	
	scale = new_scale
