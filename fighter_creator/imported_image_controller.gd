extends PanelContainer

# can drag around
var is_dragging := false
var drag_start_pos := Vector2.ZERO

@export var texture_rect: TextureRect

@export var min_scale: Vector2 = Vector2(0.5, 0.5)
@export var max_scale: Vector2 = Vector2(3.0, 3.0)
@export var zoom_speed: float = 0.1

func _gui_input(event):
	# Handle Dragging (Left Click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = event.pressed

		# Handle Zooming (Mouse Wheel)
		elif event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				texture_rect.zoom_image(1.0 + zoom_speed)
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				texture_rect.zoom_image(1.0 - zoom_speed)

	# Handle Mouse Motion while Dragging
	elif event is InputEventMouseMotion and is_dragging:
		texture_rect.position += event.relative
