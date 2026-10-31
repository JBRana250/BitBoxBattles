@tool
extends ProgressBar

var is_dragging: bool = false

var default_fill: StyleBox
var hover_fill: StyleBox
@export var hover_bg: StyleBox

func set_fill_params(default: StyleBox, hover: StyleBox) -> void:
	default_fill = default
	hover_fill = hover

func _gui_input(event: InputEvent) -> void:
	# Check for mouse click or release
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			update_value_from_mouse(event.position)
		else:
			is_dragging = false
			set_default()
			
	# Check for mouse movement while dragging
	if event is InputEventMouseMotion and is_dragging:
		update_value_from_mouse(event.position)

func update_value_from_mouse(mouse_pos: Vector2) -> void:
	set_hover()
	# Calculate the percentage of where the mouse is along the bar's width
	var percentage: float = mouse_pos.x / size.x
	
	# Calculate and assign the new value based on min/max range
	value = min_value + (percentage * (max_value - min_value))
	
func _on_mouse_entered() -> void:
	set_hover()

func _on_mouse_exited() -> void:
	set_default()

func set_hover():
	add_theme_stylebox_override("fill", hover_fill)
	add_theme_stylebox_override("background", hover_bg)

func set_default():
	add_theme_stylebox_override("fill", default_fill)
	remove_theme_stylebox_override("background")
