class_name SFXPlayer extends AudioStreamPlayer

@export var collision_sound: AudioStreamWAV
@export var normal_hit_sound: AudioStreamWAV
@export var heavy_hit_sound: AudioStreamWAV

var poly_playback: AudioStreamPlaybackPolyphonic

func _ready() -> void:
	play()
	poly_playback = get_stream_playback()

func play_collision() -> void:
	poly_playback.play_stream(collision_sound, 0, -25.0)

func play_normal_hit() -> void:
	pass
	#poly_playback.play_stream(normal_hit_sound, 0, -10.0, 1.5)

func play_heavy_hit() -> void:
	pass
	#poly_playback.play_stream(heavy_hit_sound)
