class_name RetryButton extends Button

@export var battle_setup_menu: BattleSetup
@export var curtains: Curtains

func _on_pressed() -> void:
	_retry()

func _retry() -> void:
	get_tree().paused = false
	Engine.time_scale = 1.0
	curtains.close_anim()
	await curtains.close_anim_finished
	curtains.down_anim()
	battle_setup_menu.visible = true
	
