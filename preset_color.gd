@tool
extends Node

@export var normal_stylebox: StyleBoxFlat
@export var hover_stylebox: StyleBoxFlat
@export var pressed_stylebox: StyleBoxFlat
@export var button: Button
@export var darken_amount: float
@export var state_machine: SpriteEditorStateMachine

@export var preset_color: Color:
	set(value):
		if button == null:
			return
		normal_stylebox.bg_color = value
		hover_stylebox.bg_color = value.darkened(darken_amount)
		pressed_stylebox.bg_color = value.darkened(darken_amount * 2)
		
		button.add_theme_stylebox_override("normal", normal_stylebox)
		button.add_theme_stylebox_override("hover", hover_stylebox)
		button.add_theme_stylebox_override("pressed", pressed_stylebox)
		preset_color = value

func _ready() -> void:
	button.add_theme_stylebox_override("normal", normal_stylebox)
	button.add_theme_stylebox_override("hover", hover_stylebox)
	button.add_theme_stylebox_override("pressed", pressed_stylebox)

func _on_button_pressed() -> void:
	state_machine.preset_color_picked(preset_color)
