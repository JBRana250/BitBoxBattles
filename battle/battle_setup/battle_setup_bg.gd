class_name BattleSetupBG extends Control

@export var blue_bg_anim_player: AnimationPlayer
@export var red_bg_anim_player: AnimationPlayer

func play_blue_bg() -> void:
	blue_bg_anim_player.play("blue_fighter_wave_start")

func play_red_bg() -> void:
	red_bg_anim_player.play("red_fighter_wave_start")
