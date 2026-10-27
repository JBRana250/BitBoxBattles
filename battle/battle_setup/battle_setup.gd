class_name BattleSetup extends Control

@export var fighter_one: FighterSetupButton
@export var fighter_two: FighterSetupButton

func _ready() -> void:
	intro()

func intro() -> void:
	visible = true
	fighter_one.play_intro_animation()
	fighter_two.play_intro_animation()
