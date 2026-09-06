extends ProgressBar

var is_dragging: bool = false

@export var default_fill: StyleBox
@export var hover_fill: StyleBox
@export var hover_bg: StyleBox

func _gui_input(event: InputEvent) -> void:
	# Check for mouse click or release
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			update_value_from_mouse(event.position)
		else:
			is_dragging = false
			
	# Check for mouse movement while dragging
	if event is InputEventMouseMotion and is_dragging:
		update_value_from_mouse(event.position)

func update_value_from_mouse(mouse_pos: Vector2) -> void:
	# Calculate the percentage of where the mouse is along the bar's width
	var percentage: float = mouse_pos.x / size.x
	
	# Calculate and assign the new value based on min/max range
	value = min_value + (percentage * (max_value - min_value))


func _on_mouse_entered() -> void:
	add_theme_stylebox_override("fill", hover_fill)
	add_theme_stylebox_override("background", hover_bg)

func _on_mouse_exited() -> void:
	add_theme_stylebox_override("fill", default_fill)
	remove_theme_stylebox_override("background")
