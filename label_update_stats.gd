extends LineEdit

@export var negative_allowed: bool

func _ready() -> void:
	# Set the initial text of the label
	_update_label_text(get_parent().value)

# This function runs every time the progress bar value alters
func _on_progress_bar_value_changed(new_value: float) -> void:
	_update_label_text(new_value)

# On progress bar value change, update the text
func _update_label_text(val: float) -> void:
	text = str(int(val))

func _gui_input(event):
	# on double click turn into line edit
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.double_click:
			editable = true
			grab_focus()
			select_all()
	# only allow numeric and stop editing on space or enter
	# Allow negative (-) if its in the first column
	if event is InputEventKey and event.pressed and editable:
		if event.keycode in [KEY_SPACE, KEY_ENTER]:
			editable = false
			release_focus()
			get_viewport().set_input_as_handled()
			get_parent().value = text.to_int()
			return
		if event.unicode >= 48 and event.unicode <= 57:
			return
		if negative_allowed and event.unicode == 45 and caret_column == 0:
			return
		if event.keycode in [KEY_BACKSPACE, KEY_DELETE, KEY_LEFT, KEY_RIGHT]:
			return
		get_viewport().set_input_as_handled()
		get_parent().value = text.to_int()

# Change font color on hover
func _on_mouse_entered():
	add_theme_color_override("font_uneditable_color", Color.WHITE)

func _on_mouse_exited():
	remove_theme_color_override("font_uneditable_color")
