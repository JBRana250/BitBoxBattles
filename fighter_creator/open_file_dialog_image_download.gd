extends Button

@export var file_dialog: FileDialog

func _on_pressed() -> void:
	file_dialog.visible = true
