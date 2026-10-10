extends PanelContainer

@export var label: Label

func init_slot(slot_name: String) -> void:
	label.text = slot_name
