@tool
class_name DraggableProgressBar extends Control

@export var prog_bar: ProgressBar
@export var line_edit: LineEdit
@export var label: Label

signal value_changed(new_value)

@export var allow_greater: bool
@export var allow_lesser: bool
@export var allow_decimal: bool:
	set(val):
		allow_decimal = val
		line_edit.allow_decimal = val

@export var max_value: float:
	set(val):
		max_value = val
		apply_progbar_max()

@export var min_value: float:
	set(val):
		min_value = val
		apply_progbar_min()

# This basically is linked to the value of the progress bar
# but has an additional inspector_value variable to keep track in the inspector
@export var default_value: float = value
@export var value: float:
	set(val):
		inspector_value = val
		apply_progbar_value() #update progbar value
	get:
		if not is_node_ready():
			return inspector_value
		return prog_bar.value
var inspector_value: float

@export var label_text: String:
	set(val):
		label_text = val
		apply_text()

@export var bar_color: Color:
	set(val):
		bar_color = val
		apply_color()

func _ready():
	apply_text()
	apply_color()
	apply_progbar_max()
	apply_progbar_min()
	apply_progbar_value()
	prog_bar.allow_greater = allow_greater
	prog_bar.allow_lesser = allow_lesser

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

func apply_progbar_min():
	if not is_node_ready():
		return
	prog_bar.min_value = self.min_value

func apply_progbar_max():
	if not is_node_ready():
		return
	prog_bar.max_value = self.max_value

func apply_progbar_value():
	if not is_node_ready():
		return
	prog_bar.value = inspector_value

func get_default_stylebox(color: Color) -> StyleBoxFlat:
	var box = StyleBoxFlat.new()
	box.bg_color = color
	return box

func get_hover_stylebox(default_color: Color) -> StyleBoxFlat:
	var box = StyleBoxFlat.new()
	var color = default_color.lightened(0.5)
	box.bg_color = color
	return box

func reset_to_default() -> void:
	value = default_value

func _on_progress_bar_value_changed(new_value: float) -> void:
	value_changed.emit(new_value)
