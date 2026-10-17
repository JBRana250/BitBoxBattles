class_name PlaySFXAction extends Action

@export var sfx: AudioStream

func execute(context: Dictionary = {}) -> void:
	if !(pass_conditions(context)):
		return
	
	AudioManager.sfx_player.play_sfx(sfx)
