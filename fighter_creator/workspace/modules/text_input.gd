class_name TextInput extends Module

@export var line_edit: LineEdit

var text: String:
	set(value):
		line_edit.text = value
	get:
		return line_edit.text
