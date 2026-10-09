extends Button

@export var add_event_popup_menu: AddNodePopupMenu

func _on_pressed() -> void:
	add_event_popup_menu.option_selected()
