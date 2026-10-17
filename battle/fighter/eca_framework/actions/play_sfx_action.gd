class_name PlaySFXAction extends Action

@export var sfx: AudioStream
@export var volume_offset: float
@export var pitch_scalar: float = 1.0

func execute(context: Dictionary = {}) -> void:
	if !(pass_conditions(context)):
		return
	
	AudioManager.sfx_player.play_sfx(sfx, volume_offset - 25, max(0.0, pitch_scalar))
