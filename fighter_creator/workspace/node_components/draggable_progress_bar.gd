@tool
class_name DraggableProgressBar extends Control

@export var prog_bar: ProgressBar
@export var label: Label

@export var label_text: String:
	set(val):
		label_text = val
		apply_text()

@export var bar_color: Color:
	set(val):
		bar_color = val
		apply_color()

var value: float:
	get:
		return prog_bar.value

func _ready():
	apply_text()
	apply_color()

func apply_text():
	if not is_node_ready():
		return
	label.text = label_text

func apply_color():
	if not is_node_ready():
		return
	var default_stylebox = get_default_stylebox(bar_color)
	var hover_stylebox = get_hover_stylebox(bar_color)
	
	prog_bar.set_fill_params(default_stylebox, hover_stylebox)
	prog_bar.add_theme_stylebox_override("fill", default_stylebox)

func get_default_stylebox(color: Color) -> StyleBoxFlat:
	var box = StyleBoxFlat.new()
	box.bg_color = color
	return box

func get_hover_stylebox(default_color: Color) -> StyleBoxFlat:
	var box = StyleBoxFlat.new()
	var color = default_color.lightened(0.5)
	box.bg_color = color
	return box
