extends RetryButton

@export var on_victory_menu: HBoxContainer

func _on_pressed() -> void:
	on_victory_menu.visible = false
	_retry()
