extends Button

@export var add_event_popup_menu: Control

func _on_pressed() -> void:
	add_event_popup_menu.visible = false
