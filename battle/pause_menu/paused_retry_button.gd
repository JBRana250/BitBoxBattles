extends RetryButton
@export var pause_menu: Control

func _on_pressed() -> void:
	pause_menu.visible = false
	_retry()
