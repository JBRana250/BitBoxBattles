class_name SpriteEditorStateMachine extends Node

enum State {
	NONE,
	PENCIL,
	QUICK_ERASE,
	ERASER,
	FILL,
	PICK
}

@onready var current_state: State = State.PENCIL
@onready var current_color: Color = Color.BLACK

@export var current_color_button: ColorPickerButton

func set_state(new_state: State) -> void:
	current_state = new_state

func get_state() -> State:
	return current_state


func _on_color_picker_button_color_changed(color: Color) -> void:
	current_color = color

func preset_color_picked(color: Color) -> void:
	current_color = color
	update_color()

func update_color() -> void:
	current_color_button.color = current_color
